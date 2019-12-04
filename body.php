
   <div class="main main-raised">
		<div class="container mainn-raised" style="width:100%;">

			<!--
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="item active">
						<img src="img/banner3.jpg" alt="Los Angeles" style="width:100%;">
						
					</div>

					<div class="item">
						<img src="img/banner2.jpg" style="width:100%;">
						
					</div>
					
					<div class="item">
						<img src="img/banner4.jpg" alt="New York" style="width:100%;">
						
					</div>
					<div class="item">
						<img src="img/banner1.jpg" alt="New York" style="width:100%;">
						
					</div>
					<div class="item">
						<img src="img/banner3.jpg" alt="New York" style="width:100%;">
						
					</div>
				</div>

				<a class="left carousel-control _26sdfg" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only" >Previous</span>
				</a>
				<a class="right carousel-control _26sdfg" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only">Next</span>
				</a>
			</div>
			-->
		</div>
     

		<!-- SECTION -->
		<div class="section mainn mainn-raised">
		
		
			<!-- container -->
			<div class="container">
			
				<!-- row -->
				<div class="row">
					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<a href="product.php?p=78"><div class="shop">
							<div class="shop-img">
								<img src="./img/shop01.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Colectie<br>Laptop-uri</h3>
								<a href="product.php?p=78" class="cta-btn">Cumpara acum <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div></a>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<a href="product.php?p=72"><div class="shop">
							<div class="shop-img">
								<img src="./img/shop03.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Colectie<br>Accesorii</h3>
								<a href="product.php?p=72" class="cta-btn">Cumpara acum <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div></a>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<a href="product.php?p=79"><div class="shop">
							<div class="shop-img">
								<img src="./img/shop02.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Colectie<br>Camere de filmat</h3>
								<a href="product.php?p=79" class="cta-btn">Cumpara acum <i class="fa fa-arrow-circle-right"></i></a>
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
								
                    
					$product_query = "SELECT * FROM products,categories WHERE product_cat=cat_id AND product_id BETWEEN 70 AND 75";
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
								<div class='product'>
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

		<!-- HOT DEAL SECTION -->

		<!--
		<div id="hot-deal" class="section mainn mainn-raised">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="hot-deal">
							<ul class="hot-deal-countdown">
								<li>
									<div>
										<h3>02</h3>
										<span>Days</span>
									</div>
								</li>
								<li>
									<div>
										<h3>10</h3>
										<span>Hours</span>
									</div>
								</li>
								<li>
									<div>
										<h3>34</h3>
										<span>Mins</span>
									</div>
								</li>
								<li>
									<div>
										<h3>60</h3>
										<span>Secs</span>
									</div>
								</li>
							</ul>
							<h2 class="text-uppercase">hot deal this week</h2>
							<p>New Collection Up to 50% OFF</p>
							<a class="primary-btn cta-btn" href="store.php">Shop now</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		-->
		<!-- /HOT DEAL SECTION -->
		

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
                                <!--
								<ul class="section-tab-nav tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab2">Formals</a></li>
									<li><a data-toggle="tab" href="#tab2">Shirts</a></li>
									<li><a data-toggle="tab" href="#tab2">T-Shirts</a></li>
									<li><a data-toggle="tab" href="#tab2">Pants</a></li>
								</ul>
                                -->
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
										<!-- product -->
										<?php
                    include 'db.php';
								
                    
					$product_query = "SELECT * FROM products,categories WHERE product_cat=cat_id AND product_id BETWEEN 59 AND 65";
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
				
                        
                                
								<div class='product'>
									<a href='product.php?p=$pro_id'><div class='product-img'>
										<img src='product_images/$pro_image' style='max-height: 170px;' alt=''>
										<div class='product-label'>
											<span class='sale'>-30%</span>
											<span class='new'>NEW</span>
										</div>
									</div></a>
									<div class='product-body'>
										<p class='product-category'>$cat_name</p>
										<h3 class='product-name header-cart-item-name'><a href='product.php?p=$pro_id'>$pro_title</a></h3>
										<h4 class='product-price header-cart-item-info'>$pro_price LEI</h4>
										<div class='product-rating'>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
										</div>
										<div class='product-btns'>
											<button class='add-to-wishlist'><i class='fa fa-heart-o'></i><span class='tooltipp'>add to wishlist</span></button>
											<button class='add-to-compare'><i class='fa fa-exchange'></i><span class='tooltipp'>add to compare</span></button>
											<button class='quick-view'><i class='fa fa-eye'></i><span class='tooltipp'>quick view</span></button>
										</div>
									</div>
									<div class='add-to-cart'>
										<button pid='$pro_id' id='product' class='add-to-cart-btn block2-btn-towishlist' href='#'><i class='fa fa-shopping-cart'></i> add to cart</button>
									</div>
								</div>
                               
							
                        
			";
		}
        ;
      
}
?>
										
										<!-- /product -->
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
				<div class="row">
					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title"> <?php echo $cat_rows[0]["cat_title"]; ?></h4>
							<div class="section-nav">
								<div id="slick-nav-3" class="products-slick-nav"></div>
							</div>
						</div>
						

						<div class="products-widget-slick" data-nav="#slick-nav-3">
                            
                            <?php
                                $query = "SELECT products.product_id, products.product_image, products.product_title, 
                                         products.product_price FROM products 
                                         JOIN orders ON orders.product_id = products.product_id
                                         WHERE products.product_cat = 1
                                         ORDER BY orders.qty DESC LIMIT 4;";
                               
                                $result = mysqli_query($con, $query);
                                while ($row = $result->fetch_array()){
                                    $cat1_prod_rows[] = $row;
                                }

                            ?>


							<div id="get_product_home">
                                
                               <?php
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
                        $query = "SELECT products.product_id, products.product_image, products.product_title, 
                                 products.product_price FROM products 
                                 JOIN orders ON orders.product_id = products.product_id
                                 WHERE products.product_cat = 2
                                 ORDER BY orders.qty DESC LIMIT 4;";
                       
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
                        $query = "SELECT products.product_id, products.product_image, products.product_title, 
                                 products.product_price FROM products 
                                 JOIN orders ON orders.product_id = products.product_id
                                 WHERE products.product_cat = 3
                                 ORDER BY orders.qty DESC LIMIT 4;";
                       
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
		
