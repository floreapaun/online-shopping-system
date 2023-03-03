<?php
if(isset($_POST['password']) && $_POST['reset_link_token'] && $_POST['email'])
{
include "db.php";
$emailId = $_POST['email'];
$token = $_POST['reset_link_token'];
$password = password_hash($_POST['password'], PASSWORD_BCRYPT);
$query = mysqli_query($con,"SELECT * FROM `user_info` WHERE `reset_link_token`='".$token."' and `email`='".$emailId."'");
$row = mysqli_num_rows($query);
if($row){
mysqli_query($con,"UPDATE user_info set  password='" . $password . "', reset_link_token='" . NULL . "' ,exp_date='" . NULL . "' WHERE email='" . $emailId . "'");
echo '<p>Felicitari! Parola a fost actualizata.</p>';
}else{
echo "<p>Eroare. Va rugam incercati din nou.</p>";
}
}
?>