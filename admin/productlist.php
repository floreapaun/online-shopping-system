<?php
session_start();
include("../db.php");
error_reporting(1);

if(isset($_GET['action']) && $_GET['action']!="" && $_GET['action']=='delete')
{
$product_id=$_GET['product_id'];
///////picture delete/////////
$result=mysqli_query($con,"select product_image from products where product_id='$product_id'")
or die("query is incorrect...");

list($picture)=mysqli_fetch_array($result);
$path="../product_images/$picture";

if(file_exists($path)==true)
{
  unlink($path);
}
else
{}
/*this is delet query*/
mysqli_query($con,"delete from products where product_id='$product_id'")or die("query is incorrect...");
header("location: productlist.php?delete=1");
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
                          echo "<h3 style='color:#0C0'>Produsul a fost sters! &nbsp;&nbsp;  
                                <span class='glyphicon glyphicon-remove'></span></h3>";
                  }
              ?>
            </div>
            <div class="col-md-2">
            </div>

          </div>       

         <div class="col-md-12">


            <div class="card ">


              <div class="card-header card-header-primary">
                <h4 class="card-title"> Lista produse</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive ps">
                  <table class="table tablesorter " id="page1">
                    <thead class=" text-primary">
                      <tr><th>Imagine</th><th>Nume</th><th>Pret (lei)</th><th>
	<a class=" btn btn-primary" href="addproduct.php">Adauga produs</a></th></tr></thead>
                    <tbody>
                      <?php 

                        $result=mysqli_query($con,"select product_id,product_image, product_title,product_price from products Limit $page1,12")or die ("query 1 incorrect.....");

                        while(list($product_id,$image,$product_name,$price)=mysqli_fetch_array($result))
                        {
                        echo "<tr><td><img src='../product_images/$image' style='width:50px; height:50px; border:groove #000'></td><td>$product_name</td>
                        <td>$price</td>
                        <td>

                        <a class=' btn btn-success' href='productlist.php?product_id=$product_id&action=delete'>Sterge</a>
                        </td></tr>";
                        }

                        ?>
                    </tbody>
                  </table>
                <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
              </div>
            </div>
            <nav aria-label="Page navigation example">
              <ul class="pagination">

                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span>Pagina: </span>
                  </a>
                </li>
                 <?php 
//counting paging

                $paging=mysqli_query($con,"select product_id,product_image, product_title,product_price from products");
                $count=mysqli_num_rows($paging);

                $a=$count/10;
                $a=ceil($a);
                
                for($b=1; $b<=$a;$b++)
                {
                ?> 
                <li class="page-item"><a class="page-link" href="productlist.php?page=<?php echo $b;?>"><?php echo $b." ";?></a></li>
                <?php	
}
?>
              </ul>
            </nav>
            
           

          </div>
          
          
        </div>
      </div>
      <?php
include "footer.php";
?>
