  <?php
session_start();
include("../db.php");


if(isset($_POST['btn_save']))
{
$product_name=$_POST['product_name'];
$details=$_POST['details'];
$price=$_POST['price'];
$product_cat=$_POST['cat_id'];
$brand=$_POST['brand_id'];
$tags=$_POST['tags'];

//picture coding
$picture_name=$_FILES['picture']['name'];
$picture_type=$_FILES['picture']['type'];
$picture_tmp_name=$_FILES['picture']['tmp_name'];
$picture_size=$_FILES['picture']['size'];

if($picture_type=="image/jpeg" || $picture_type=="image/jpg" || $picture_type=="image/png" || $picture_type=="image/gif")
{
	if ($picture_size<=50000000) {	
    	move_uploaded_file($picture_tmp_name,"../product_images/".$picture_name);
		
        mysqli_query($con,"insert into products (product_cat, product_brand,product_title,product_price, 
                           product_desc, product_image,product_keywords) 
                           values ('$product_cat','$brand','$product_name','$price','$details','$picture_name','$tags')") 
                           or die ("insert product query with error");

        header("location: submit_form.php?success=1");
    }
    else
        header("location: submit_form.php?success=2");
}
else
    header("location: submit_form.php?success=3");

mysqli_close($con);
}
include "sidenav.php";
include "topheader.php";
?>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <form action="" method="post" type="form" name="form" enctype="multipart/form-data">
          <div class="row">
          
                
         <div class="col-md-7">
            <div class="card">
              <div class="card-header card-header-primary">
                <h5 class="title">Adauga produs</h5>
              </div>
              <div class="card-body">
                
                  <div class="row">
                    
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Nume produs</label>
                        <input type="text" id="product_name" required name="product_name" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="">
                        <label for="">Imagine</label>
                        <input type="file" name="picture" required class="btn btn-fill btn-success" id="picture" >
                      </div>
                    </div>
                     <div class="col-md-12">
                      <div class="form-group">
                        <label>Descriere</label>
                        <textarea rows="4" cols="80" id="details" required name="details" class="form-control"></textarea>
                      </div>
                    </div>
                  
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Pret</label>
                        <input type="text" id="price" name="price" required class="form-control" >
                      </div>
                    </div>
                  </div>
                 
                  
                
              </div>
              
            </div>
          </div>
          <div class="col-md-5">
            <div class="card">
              <div class="card-header card-header-primary">
                <h5 class="title">Categorii</h5>
              </div>
              <div class="card-body">
                
                  <div class="row">
                    
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="cat_select">Categorie produs</label>
                        <select name="cat_id" id="cat_select" class="form-control">
                            <?php
                              $result = mysqli_query($con,"select cat_id, cat_title from categories")
                                        or die ("query for categories failed");
                              while (list($cat_id, $cat_title) = mysqli_fetch_array($result)) {
                                  echo '<option value="' . $cat_id . '">' . $cat_title . '</option>"';
                              }
                            ?>
                        </select>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="">Brand produs</label>
                        <select name="brand_id" id="brand_select" class="form-control">
                            <?php
                              $result = mysqli_query($con,"select brand_id, brand_title from brands")
                                        or die ("query for brands failed");
                              while (list($brand_id, $brand_title) = mysqli_fetch_array($result)) {
                                  echo '<option value="' . $brand_id . '">' . $brand_title . '</option>"';
                              }
                            ?>
                        </select>
                      </div>
                    </div>
                     
                  
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Cuvinte cheie</label>
                        <input type="text" id="tags" name="tags" required class="form-control" >
                      </div>
                    </div>
                  </div>
                
              </div>
              <div class="card-footer">
                  <button type="submit" id="btn_save" name="btn_save" required class="btn btn-fill btn-primary">Adauga produs</button>
              </div>
            </div>
          </div>
          
        </div>
         </form>
          
        </div>
      </div>
      <?php
include "footer.php";
?>
