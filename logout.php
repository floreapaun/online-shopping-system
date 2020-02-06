<?php

session_start();

unset($_SESSION["uid"]);

unset($_SESSION["name"]);

//user is logged out
setcookie("auth", 0);

$BackToMyPage = $_SERVER['HTTP_REFERER'];

//if on the administration panel redirect to index without 
//checking for the referer page
if ($_GET['adminpanel'])
    header('Location: index.php'); 

elseif (isset($BackToMyPage)) {
    header('Location: '.$BackToMyPage);
} else {
    header('Location: index.php'); // default page
}

?>
