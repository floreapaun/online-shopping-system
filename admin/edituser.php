
    <?php
session_start();
include("../db.php");
$user_id=$_REQUEST['user_id'];

$result=mysqli_query($con,"select user_id,first_name,last_name, email, 
                           mobile, address1, address2 from user_info where user_id='$user_id'")
        or die ("query 1 incorrect.......");

list($user_id,$first_name,$last_name,$email,$mobile, $address, $zip)=mysqli_fetch_array($result);

if(isset($_POST['btn_save'])) 
{

$first_name=$_POST['first_name'];
$last_name=$_POST['last_name'];
$email=$_POST['email'];
$mobile = $_POST['mobile'];
$address = $_POST['address'];
$zip = $_POST['zip'];

mysqli_query($con,"update user_info set first_name='$first_name', last_name='$last_name', 
                   email='$email', mobile='$mobile', address1='$address', address2='$zip'
                   where user_id='$user_id'")
            or die ("Query 2 is inncorrect..........");

header("location: edituser.php?user_id=$user_id&modify=1");
mysqli_close($con);
}
include "sidenav.php";
include "topheader.php";
?>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8 text-center">
              <?php
                  if(isset($_REQUEST['modify'])) {
                      if (intval($_REQUEST["modify"]) == 1)
                          echo "<h3 style='color:#0C0'>Datele utilizatorului au fost actualizate! &nbsp;&nbsp;  
                                <span class='glyphicon glyphicon-remove'></span></h3>";
                  }
              ?>
            </div>
            <div class="col-md-2">
            </div>
          </div>       
        <div class="col-md-5 mx-auto">
            <div class="card">
              <div class="card-header card-header-primary">
                <h5 class="title">Modifica utilizator</h5>
              </div>
              <form action="edituser.php" name="form" method="post" enctype="multipart/form-data">
              <div class="card-body">
                
                  <input type="hidden" name="user_id" id="user_id" value="<?php echo $user_id;?>" />
                    <div class="col-md-12 ">
                      <div class="form-group">
                        <label>Nume</label>
                        <input type="text" id="first_name" name="first_name"  class="form-control" value="<?php echo $first_name; ?>" >
                      </div>
                    </div>
                    <div class="col-md-12 ">
                      <div class="form-group">
                        <label>Prenume</label>
                        <input type="text" id="last_name" name="last_name" class="form-control" value="<?php echo $last_name; ?>" >
                      </div>
                    </div>
                    <div class="col-md-12 ">
                      <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email"  id="email" name="email" class="form-control" value="<?php echo $email; ?>">
                      </div>
                    </div>
                    <div class="col-md-12 ">
                      <div class="form-group">
                        <label for="mobile">Telefon</label>
                        <input type="text" name="mobile" id="mobile" class="form-control" value="<?php echo $mobile; ?>">
                      </div>
                    </div>
                    <div class="col-md-12 ">
                      <div class="form-group">
                        <label for="address">Adresa</label>
                        <input type="text" name="address" id="address" class="form-control" value="<?php echo $address; ?>">
                      </div>
                    </div>
                    <div class="col-md-12 ">
                      <div class="form-group">
                        <label for="zip">Cod postal</label>
                        <input type="text" name="zip" id="zip" class="form-control" value="<?php echo $zip; ?>">
                      </div>
                    </div>
                  
                  
                  
                
              </div>
              <div class="card-footer">
                <button type="submit" id="btn_save" name="btn_save" class="btn btn-fill btn-primary">Modifica</button>
              </div>
              </form>    
            </div>
          </div>
         
          
        </div>
      </div>
      <?php
include "footer.php";
?>
