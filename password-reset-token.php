<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

if(isset($_POST['password-reset-token']) && $_POST['email'])
{
    include "db.php";
     
    $emailId = $_POST['email'];
 
    $result = mysqli_query($con,"SELECT * FROM user_info WHERE email='" . $emailId . "'");
 
    $row= mysqli_fetch_array($result);
 
  if($row)
  {
     
     $token = md5($emailId).rand(10,9999);
 
     $expFormat = mktime(
     date("H"), date("i"), date("s"), date("m") ,date("d")+1, date("Y")
     );
 
    $expDate = date("Y-m-d H:i:s",$expFormat);
 
    $update = mysqli_query($con,"UPDATE user_info set  password='" . $password . "', reset_link_token='" . $token . "' ,exp_date='" . $expDate . "' WHERE email='" . $emailId . "'");
 
    $link = "<a href='https://localhost/shop/reset-password.php?key=".$emailId."&token=".$token."'>Click pentru a reseta parola</a>";
 
    $mail = new PHPMailer();
 
    $mail->CharSet =  "utf-8";
    $mail->IsSMTP();
    // enable SMTP authentication
    $mail->SMTPAuth = true;                  
    // GMAIL username
    $mail->Username = "florea.user@gmail.com";
    // GMAIL password
    $mail->Password = "gnqwiknoyxjjkfis";
    $mail->SMTPSecure = "ssl";  
    // sets GMAIL as the SMTP server
    $mail->Host = "smtp.gmail.com";
    // set the SMTP port for the GMAIL server
    $mail->Port = "465";
    $mail->From='office@alphasop.app';
    $mail->FromName='Administrator Alpha Shop';
    $mail->AddAddress($emailId, 'Client');
    $mail->Subject  =  'Resetare parola';
    $mail->IsHTML(true);
    $mail->Body    = 'Click pe acest link pentru resetarea parolei '.$link.'';
    if($mail->Send())
    {
      echo "Verifica email-ul primit la adresa de mail specificata pentru schimbarea parolei.";
    }
    else
    {
      echo "Mail Error - >".$mail->ErrorInfo;
    }
  }else{
    echo "Eroare. Ati oferit o adresa de mail invalida.";
  }
}
?>