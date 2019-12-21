<?php
session_start();
include("../db.php");

error_reporting(0);
if(isset($_GET['action']) && $_GET['action']!="" && $_GET['action']=='delete')
{
$order_id=$_GET['order_id'];

/*this is delet query*/
mysqli_query($con,"delete from order_products where order_id='$order_id'")or die("delete query is incorrect...");
mysqli_query($con,"delete from orders_info where order_id='$order_id'")or die("delete query is incorrect...");
header("location: orders.php?delete=1");
} 

///pagination
$page=$_GET['page'];

if($page=="" || $page=="1")
{
$page1=0;	
}
else
{
$page1=($page*10)-10;	
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
                      if (intval($_REQUEST['delete']) == 1)
                          echo "<h3 style='color:#0C0'>Comanda a fost stearsa! &nbsp;&nbsp;  
                                <span class='glyphicon glyphicon-remove'></span></h3>";
                  }
              ?>
            </div>
            <div class="col-md-2">
            </div>

          </div>       

          <!-- your content here -->
          <div class="col-md-14">
            <div class="card ">
              <div class="card-header card-header-primary">
                <h4 class="card-title">Comenzi  / Pagina <?php echo $page;?> </h4>
              </div>
              <div class="card-body">
                <div class="table-responsive ps">
                  <table class="table table-hover tablesorter " id="">
                    <thead class=" text-primary">
                      <tr><th>Nume client</th><th>Email</th><th>Cod postal</th><th>ID Comanda</th>
                          <th>ID Produs X Cantitate</th><th>Cost (lei)</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php 
                        $sql = "SELECT first_name, email, orders_info.zip, orders_info.order_id, order_products.product_id, 
		                        qty, total_amt FROM order_products 
                                INNER JOIN orders_info ON order_products.order_id = orders_info.order_id 
                                INNER JOIN user_info ON user_info.user_id = orders_info.user_id; 
                               "; 
                        $result = mysqli_query($con, $sql); 
                        $rows = mysqli_fetch_all($result, MYSQLI_NUM);

                        //print_r($arr);

                        $prod_ids = "";

                        for ($i = 0; $i < count($rows)-1; $i++) {
                            $current = $rows[$i][3];
                            $next = $rows[$i+1][3];

                            //each order has at least one product 
                            //for each order we add product and its quantity           
                            $prod_ids .= $rows[$i][4] . ' x ' . $rows[$i][5] . ', ';

                            //we put the sum we reached so far if next order is bigger
                            if ($current < $next) {
                                echo "<tr><td>" . $rows[$i][0] . "</td><td>" . $rows[$i][1] . "</td><td>" .
                                $rows[$i][2] . "</td><td>" .$rows[$i][3] . "</td>
                                      <td>" . substr(trim($prod_ids), 0, -1) . "</td><td>" . $rows[$i][6] . "</td>
                                      <td>
                                      <a class=' btn btn-danger' href='orders.php?order_id=" . $rows[$i][3] . 
                                        "&action=delete'>Sterge</a>
                                      </td>
                                      </tr>";
                                $prod_ids = "";
                            }
                         }
                        
                        $prod_ids .= $rows[$i][4] . ' x ' . $rows[$i][5] . ', ';
                        echo "<tr><td>" . $rows[$i][0] . "</td><td>" . $rows[$i][1] . "</td><td>" .
                        $rows[$i][2] . "</td><td>" .$rows[$i][3] . "</td>
                              <td>" . substr(trim($prod_ids), 0, -1) . "</td><td>" . $rows[$i][6] . "</td>
                              <td>
                              <a class=' btn btn-danger' href='orders.php?order_id=" . $rows[$i][3] . 
                                "&action=delete'>Sterge</a>
                              </td>
                              </tr>";

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
