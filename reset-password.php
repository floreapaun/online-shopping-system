<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Reset Password In PHP MySQL</title>
<!-- CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div class="card">
<div class="card-header text-center">
Resetare parola
</div>
<div class="card-body">
<?php
if($_GET['key'] && $_GET['token'])
{
include "db.php";
$email = $_GET['key'];
$token = $_GET['token'];
$query = mysqli_query($con,
"SELECT * FROM `user_info` WHERE `reset_link_token`='".$token."' and `email`='".$email."';"
);
$curDate = date("Y-m-d H:i:s");
if (mysqli_num_rows($query) > 0) {
$row= mysqli_fetch_array($query);
if($row['exp_date'] >= $curDate){ ?>
<form action="update-forget-password.php" method="post">
<input type="hidden" name="email" value="<?php echo $email;?>">
<input type="hidden" name="reset_link_token" value="<?php echo $token;?>">
<div class="form-group">
<label for="exampleInputEmail1">Parola</label>
<input type="password" name='password' class="form-control">
</div>                
<div class="form-group">
<label for="exampleInputEmail1">Confirmare parola</label>
<input type="password" name='cpassword' class="form-control">
</div>
<input type="submit" name="new-password" class="btn btn-primary" value="Trimite">
</form>
<?php } } else{
echo "<p>Link-ul de resetare a parolei a expirat.</p>";    
}
}
?>
</div>
</div>
</div>
</body>
</html>