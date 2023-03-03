   <div class="main main-raised">
		<div class="container mainn-raised" style="width:100%;">
		</div>

		<!-- SECTION -->
		<div class="section mainn mainn-raised">
		
			<!-- container -->
			<div class="container">
			
				<!-- row -->
				<div class="row">
					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<a href="product.php?p=74">
							<div class="shop">
								<div class="shop-img">
									<img src="./img/product01.png" alt="">
								</div>
								<div class="shop-body">
									<h3>Colectie<br>Laptop-uri</h3>
									<a href="product.php?p=74" class="cta-btn"></a>
								</div>
							</div>
						</a>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<a href="product.php?p=119"><div class="shop">
							<div class="shop-img">
								<img src="./img/tastaturaheivervg7501.jpg" alt="">
							</div>
							<div class="shop-body">
								<h3>Colectie<br>Periferice</h3>
								<a href="product.php?p=119" class="cta-btn"></a>
							</div>
						</div></a>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<a href="product.php?p=117"><div class="shop">
							<div class="shop-img">
								<img src="./img/samsungduronf100.jpg" alt="">
							</div>
							<div class="shop-body">
								<h3>Colectie<br>Desktop-uri</h3>
								<a href="product.php?p=117" class="cta-btn"></a>
							</div>
                            </div></a>
					</div>
					<!-- /shop -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
		  
		

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

                    <!-- here append message if product was added successfuly to cart or not -->
                    <div class="col-md-12 col-xs-12" id="product_msg">
					</div>

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Produse noi</h3>
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12 mainn mainn-raised">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1" >
									
									<?php
                    include 'db.php';
								
                    
                $product_query = "SELECT * FROM products 
                                  INNER JOIN categories ON products.product_cat = categories.cat_id
                                  ORDER BY product_id DESC LIMIT 3;";

                $run_query = mysqli_query($con,$product_query);
                if(mysqli_num_rows($run_query) > 0){

                    while($row = mysqli_fetch_array($run_query)){
                        $pro_id    = $row['product_id'];
                        $pro_cat   = $row['product_cat'];
                        $pro_brand = $row['product_brand'];
                        $pro_title = $row['product_title'];
                        $pro_price = $row['product_price'];
                        $pro_image = $row['product_image'];

                        $cat_name = $row["cat_title"];

                        echo "
								<div class='product' style='height: 380px;'>
									<a href='product.php?p=$pro_id'><div class='product-img'>
										<img src='product_images/$pro_image' style='max-height: 170px;' alt=''>
									</div></a>
									<div class='product-body'>
										<p class='product-category'>$cat_name</p>
										<h3 class='product-name header-cart-item-name'><a href='product.php?p=$pro_id'>$pro_title</a></h3>
										<h4 class='product-price header-cart-item-info'>$pro_price LEI</h4>
									</div>
									<div class='add-to-cart'>
										<button pid='$pro_id' id='product' class='add-to-cart-btn block2-btn-towishlist' href='#'><i class='fa fa-shopping-cart'></i>Adauga in cos </button>
									</div>
								</div>
                               
							
                        
			";
		}
        ;
      
}
?>
										<!-- product -->
										
	
										<!-- /product -->
										
										
										<!-- /product -->
									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Cele mai vandute</h3>
							<div class="section-nav">
							</div>
						</div>
					</div>
					<!-- /section title -->

                    <!-- Products tab & slick -->
					<div class="col-md-12 mainn mainn-raised">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab2" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
                                    </div>
	                            <div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- /Products tab & slick -->

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

        <?php
            //get the first three categories by id
            $cat_query = "SELECT cat_id, cat_title FROM categories LIMIT 3;";   
            $result = mysqli_query($con, $cat_query);
            while ($row = $result->fetch_array()){
                $cat_rows[] = $row;
            }
        ?>

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row" style="height: 200px;">
					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title"> <?php echo $cat_rows[0]["cat_title"]; ?></h4>
							<div class="section-nav">
								<div id="slick-nav-3" class="products-slick-nav"></div>
							</div>
						</div>
						

						<div class="products-widget-slick" data-nav="#slick-nav-3">
                            
                            <?php
                                
                                //get the top 4 sold products from the first category
                                $query = "SELECT order_products.product_id, SUM(order_products.qty), product_cat, 
                                          product_image, product_title,  product_price FROM products 
                                          JOIN order_products ON order_products.product_id = products.product_id
                                          WHERE product_cat = 1
                                          GROUP BY order_products.product_id ORDER BY SUM(order_products.qty) DESC LIMIT 4;";
                                $result = mysqli_query($con, $query);
                                while ($row = $result->fetch_array()){
                                    $cat1_prod_rows[] = $row;
                                }
                            ?>


							<div id="get_product_home">
                                
                               <?php
                                    //print the first 2 products of the top 4 sold products from category one
                                    for ($i = 0; $i <= 1; $i++) {
                                        echo "<div class='product-widget'>
                                                <a href='product.php?p=" . $cat1_prod_rows[$i]['product_id'] . "'> 
                                                    <div class='product-img'>
                                                        <img src='product_images/" . $cat1_prod_rows[$i]['product_image'] . 
                                                    "' alt=''></div>
                                                    <div class='product-body'>
                                                        <h3 class='product-name'>
                                                            <a href='product.php?p=" . $cat1_prod_rows[$i]['product_id'] ."
                                                            ''>" .  $cat1_prod_rows[$i]['product_title'] . "
                                                            </a>
                                                        </h3>
                                                        <h4 class='product-price'>" . $cat1_prod_rows[$i]['product_price']
                                                        . " lei</h4>
                                                    </div>
                                                </a>
                                              </div>";
                                    }
                              ?>
								
							</div>

							<div id="get_product_home2">

                               <?php
                                    //print the last 2 products of the top 4 sold products from category one
                                    for ($i = 2; $i <= 3; $i++) {
                                        echo "<div class='product-widget'>
                                                <a href='product.php?p=" . $cat1_prod_rows[$i]['product_id'] . "'> 
                                                    <div class='product-img'>
                                                        <img src='product_images/" . $cat1_prod_rows[$i]['product_image'] . 
                                                    "' alt=''></div>
                                                    <div class='product-body'>
                                                        <h3 class='product-name'>
                                                            <a href='product.php?p=" . $cat1_prod_rows[$i]['product_id'] ."
                                                            ''>" .  $cat1_prod_rows[$i]['product_title'] . "
                                                            </a>
                                                        </h3>
                                                        <h4 class='product-price'>" . $cat1_prod_rows[$i]['product_price']
                                                        . " lei</h4>
                                                    </div>
                                                </a>
                                              </div>";
                                    }
                              ?>

							</div>
						</div>
					</div>

                    <?php

                        //get the top 4 sold products from the second category
                        $query = "SELECT order_products.product_id, SUM(order_products.qty), product_cat, 
                                  product_image, product_title,  product_price FROM products 
                                  JOIN order_products ON order_products.product_id = products.product_id
                                  WHERE product_cat = 2
                                  GROUP BY order_products.product_id ORDER BY SUM(order_products.qty) DESC LIMIT 4;";
                       
                        $result = mysqli_query($con, $query);
                        while ($row = $result->fetch_array()){
                            $cat2_prod_rows[] = $row;
                        }

                    ?>

					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title"><?php echo $cat_rows[1]["cat_title"]; ?></h4>
							<div class="section-nav">
								<div id="slick-nav-4" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-4">
							<div>

                               <?php
                                    //print the first 2 products of the top 4 sold products from category two 
                                    for ($i = 0; $i <= 1; $i++) {
                                        echo "<div class='product-widget'>
                                                <a href='product.php?p=" . $cat2_prod_rows[$i]['product_id'] . "'> 
                                                    <div class='product-img'>
                                                        <img src='product_images/" . $cat2_prod_rows[$i]['product_image'] . 
                                                    "' alt=''></div>
                                                    <div class='product-body'>
                                                        <h3 class='product-name'>
                                                            <a href='product.php?p=" . $cat2_prod_rows[$i]['product_id'] ."
                                                            ''>" .  $cat2_prod_rows[$i]['product_title'] . "
                                                            </a>
                                                        </h3>
                                                        <h4 class='product-price'>" . $cat2_prod_rows[$i]['product_price']
                                                        . " lei</h4>
                                                    </div>
                                                </a>
                                              </div>";
                                    }
                              ?>

							</div>

							<div>
                               <?php
                                    //print the last 2 products of the top 4 sold products from category two 
                                    for ($i = 2; $i <= 3; $i++) {
                                        echo "<div class='product-widget'>
                                                <a href='product.php?p=" . $cat2_prod_rows[$i]['product_id'] . "'> 
                                                    <div class='product-img'>
                                                        <img src='product_images/" . $cat2_prod_rows[$i]['product_image'] . 
                                                    "' alt=''></div>
                                                    <div class='product-body'>
                                                        <h3 class='product-name'>
                                                            <a href='product.php?p=" . $cat2_prod_rows[$i]['product_id'] ."
                                                            ''>" .  $cat2_prod_rows[$i]['product_title'] . "
                                                            </a>
                                                        </h3>
                                                        <h4 class='product-price'>" . $cat2_prod_rows[$i]['product_price']
                                                        . " lei</h4>
                                                    </div>
                                                </a>
                                              </div>";
                                    }
                              ?>
							</div>
						</div>
					</div>

					<div class="clearfix visible-sm visible-xs">
					    
					</div>

                    <?php

                        //get the top 4 sold products from the third category
                        $query = "SELECT order_products.product_id, SUM(order_products.qty), product_cat, 
                                  product_image, product_title,  product_price FROM products 
                                  JOIN order_products ON order_products.product_id = products.product_id
                                  WHERE product_cat = 3
                                  GROUP BY order_products.product_id ORDER BY SUM(order_products.qty) DESC LIMIT 4;";
                       
                        $result = mysqli_query($con, $query);
                        while ($row = $result->fetch_array()){
                            $cat3_prod_rows[] = $row;
                        }

                    ?>

					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title"><?php echo $cat_rows[2]["cat_title"]; ?></h4>
							<div class="section-nav">
								<div id="slick-nav-5" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-5">
							<div>

                               <?php
                                    //print the first 2 products of the top 4 sold products from category three 
                                    for ($i = 0; $i <= 1; $i++) {
                                        echo "<div class='product-widget'>
                                                <a href='product.php?p=" . $cat3_prod_rows[$i]['product_id'] . "'> 
                                                    <div class='product-img'>
                                                        <img src='product_images/" . $cat3_prod_rows[$i]['product_image'] . 
                                                    "' alt=''></div>
                                                    <div class='product-body'>
                                                        <h3 class='product-name'>
                                                            <a href='product.php?p=" . $cat3_prod_rows[$i]['product_id'] ."
                                                            ''>" .  $cat3_prod_rows[$i]['product_title'] . "
                                                            </a>
                                                        </h3>
                                                        <h4 class='product-price'>" . $cat3_prod_rows[$i]['product_price']
                                                        . " lei</h4>
                                                    </div>
                                                </a>
                                              </div>";
                                    }
                              ?>

							</div>

							<div>

                               <?php
                                    //print the last 2 products of the top 4 sold products from category three
                                    for ($i = 2; $i <= 3; $i++) {
                                        echo "<div class='product-widget'>
                                                <a href='product.php?p=" . $cat3_prod_rows[$i]['product_id'] . "'> 
                                                    <div class='product-img'>
                                                        <img src='product_images/" . $cat3_prod_rows[$i]['product_image'] . 
                                                    "' alt=''></div>
                                                    <div class='product-body'>
                                                        <h3 class='product-name'>
                                                            <a href='product.php?p=" . $cat3_prod_rows[$i]['product_id'] ."
                                                            ''>" .  $cat3_prod_rows[$i]['product_title'] . "
                                                            </a>
                                                        </h3>
                                                        <h4 class='product-price'>" . $cat3_prod_rows[$i]['product_price']
                                                        . " lei</h4>
                                                    </div>
                                                </a>
                                              </div>";
                                    }
                              ?>
							</div>
						</div>
					</div>

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
</div>
		
