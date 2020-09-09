<?php
// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';
require 'db.php';

//passing `true` enables exceptions
$mail = new PHPMailer(true);                              

//get all emails subscribed to newsletter
$query = "SELECT email 
         FROM email_info;";
if ($stmt = $con -> prepare($query)) {
    $stmt->bind_result($emailTo);
    $stmt->execute();

    //send the newsletter for each mail 
    while ($stmt->fetch()) {
        try {

            $mail->SMTPDebug = 0;     
            $mail->isSMTP();                                      
            $mail->Host = 'smtp.gmail.com'; 
            $mail->SMTPAuth = true;        

            //username and password of the free gmail account which sends the emails
            $mail->Username = 'florea.user@gmail.com';                 
            $mail->Password = 'rtflcrjgfkavpwqn';                          

            $mail->SMTPSecure = 'ssl';                            
            $mail->Port = 465;

            //the sender 
            $mail->setFrom('admin@romashop.com', 'Roma Costin'); 

            //the receiver
            $mail->addAddress($emailTo, 'Destinatar');     

            $mail->addReplyTo('no-replay@example.com', 'No Replay');
            $url = "http://" . $_SERVER['HTTP_HOST'] . '/' .
                    dirname($_SERVER['PHP_SELF']) .
                    "/store.php?get_seleted_Category=1&cat_id=1"; 

            //set email format to HTML
            $mail->isHTML(true);      

            $mail->Subject = 'Noutati de vis de la Samsung';
            $mail->Body    = "<h1> Tehnologia ne ajuta sa traim! </h1>
                              <img src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQi
                                s5IiYhTKY53_XNEC8JLFa07du9G_fI641w&usqp=CAU' style='display: block;'/>
                              <p>Colosseumul pe vremuri insemna agitatie, emotie, sentimente, 
                                 adrenalina pentru viata sau moarte. 
                                 Ne putem bucura la fel, cu <a href='$url'>noile telefoane</a>
                                 disponibile de astazi in magazinul Roma Shop!</p>";

            $mail->SMTPOptions = array(
                'ssl' => array(
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
                )
            );

            $mail->send();

        } catch (Exception $e) {
            echo 'Mail-ul nu a fost trimis. Eroare: ', $mail->ErrorInfo;
            
            // to stop user from submitting more than once 
            exit(); 
        }
    }

    $stmt->close();
    $con->close();
}
