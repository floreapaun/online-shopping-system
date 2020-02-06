<?php
session_start();
include("../db.php");
if(isset($_GET['action']) && $_GET['action']!="" && $_GET['action']=='delete')
{
$user_id=$_GET['user_id'];

/*this is delet quer*/
mysqli_query($con,"delete from user_info where user_id='$user_id'")or die("query is incorrect...");
header("location: manageuser.php?delete=1");
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
                  if(isset($_REQUEST['delete'])) {
                      if (intval($_REQUEST["delete"]) == 1)
                          echo "<h3 style='color:#0C0'>Utilizatorul a fost sters! &nbsp;&nbsp;  
                                <span class='glyphicon glyphicon-remove'></span></h3>";
                  }
                  if(isset($_REQUEST['useradd'])) {
                      if (intval($_REQUEST["useradd"]) == 1)
                          echo "<h3 style='color:#0C0'>Utilizatorul a fost adaugat! &nbsp;&nbsp;  
                                <span class='glyphicon glyphicon-remove'></span></h3>";
                  }
              ?>
            </div>
            <div class="col-md-2">
            </div>

          </div>       

         <div class="col-md-14">
            <div class="card ">
              <div class="card-header card-header-primary">
                <h4 class="card-title">Modificare utilizatori</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive ps">
                  <table class="table tablesorter table-hover" id="">
                    <thead class=" text-primary">
                      <tr><th>Nume</th>
                <th>Prenume</th>
                <th>Email</th>
	<th><a href="adduser.php" class="btn btn-success">Adauga</a></th>
                    </tr></thead>
                    <tbody>
                      <?php 
                        $result=mysqli_query($con,"select user_id, first_name, last_name, email 
                                                   from user_info")
                                or die ("select user query error!");

                        while(list($user_id, $first_name, $last_name, $email)=
                        mysqli_fetch_array($result))
                        {
                        echo "<tr><td>$first_name</td><td>$last_name</td><td>$email</td>";

                        echo"<td>
                        <a href='edituser.php?user_id=$user_id' type='button' rel='tooltip' title='' class='btn btn-info btn-link btn-sm' data-original-title='Modifica utilizator'>
                                <i class='material-icons'>edit</i>
                              <div class='ripple-container'></div></a>
                        <a href='manageuser.php?user_id=$user_id&action=delete' type='button' rel='tooltip' title='' class='btn btn-danger btn-link btn-sm' data-original-title='Sterge utilizator'>
                                <i class='material-icons'>close</i>
                              <div class='ripple-container'></div></a>
                        </td></tr>";
                        }
                        mysqli_close($con);
                        ?>
                    </tbody>
                  </table>
                <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
      <?php
include "footer.php";
?>
