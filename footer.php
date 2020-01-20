<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Despre noi</h3>
                        <p>Roma Enterprise Shop Company</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>Ploiesti</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>0244 100 100</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>office@romashop.ro</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 text-center" style="margin-top:80px;">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="delivery">
                      Livrarea produselor costa 15 lei si este gratuita pentru comenzile mai mari de 299 lei.
					</span>
                    <span class="copyright">
					  Copyright &copy;<script>document.write(new Date().getFullYear());</script> Toate drepturile rezervate
					</span>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categorii</h3>
                        <ul class="footer-links">
                            <?php
                            $ip_add = getenv("REMOTE_ADDR");
                            include "db.php";
                            $category_query = "SELECT * FROM categories";
                            $run_query = mysqli_query($con, $category_query) or die(mysqli_error($con));
                            if (mysqli_num_rows($run_query) > 0) {
                                $i = 1;
                                while ($row = mysqli_fetch_array($run_query)) {
                                    $cid = $row["cat_id"];
                                    $cat_name = $row["cat_title"];
                                    $i++;

                                    echo "
                                                      <li class='categoryhome' cid='$cid'>
                                                        <a href='#'>
                                                        <span></span>
                                                          $cat_name
                                                        </a>
                                                      </li>
                                         ";
                                }
                            }
                            ?>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>


            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->


    <!-- bottom footer -->

    <!-- /bottom footer -->
</footer>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>
<script src="js/actions.js"></script>
<script src="js/sweetalert.min"></script>
<script src="js/jquery.payform.min.js" charset="utf-8"></script>
<script src="js/script.js"></script>
<script>var c = 0;

    function menu() {
        if (c % 2 == 0) {
            document.querySelector('.cont_drobpdown_menu').className = "cont_drobpdown_menu active";
            document.querySelector('.cont_icon_trg').className = "cont_icon_trg active";
            c++;
        } else {
            document.querySelector('.cont_drobpdown_menu').className = "cont_drobpdown_menu disable";
            document.querySelector('.cont_icon_trg').className = "cont_icon_trg disable";
            c++;
        }
    }


</script>
<script type="text/javascript">
    $('.block2-btn-addcart').each(function () {
        var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
        $(this).on('click', function () {
            swal(nameProduct, "is added to cart !", "success");
        });
    });

    $('.block2-btn-addwishlist').each(function () {
        var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
        $(this).on('click', function () {
            swal(nameProduct, "is added to wishlist !", "success");
        });
    });
</script>
	
