$(document).ready(function(){
    
    displaySuccessOrderMsg();
    
    function displaySuccessOrderMsg() {
        console.log("x");
    
        if (window.location.pathname == '/online-shopping-system/store.php') {
            console.log("x");
            if (document.cookie.split(';').filter((item) => item.includes('ordercomplete=1')).length) {
                var str = "	<div class='alert alert-success'>" +
                          "	<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> " +
                          "	<b>Comanda trimisa inspre aprobare! Veti fi contactat de un operator!</b> </div>";
                $('#product_msg').html(str);
                document.cookie="ordercomplete=0";
            }
        }
    }
    
        
	brand();
	//product();
    //producthome();
    
    checkforlink();

    function checkforlink() {
        cat().then(function(result) {
            var urlParams = new URLSearchParams(window.location.search);
            console.log(urlParams.get('cidl')); // true
            console.log("url params");
            
            /*
            if (urlParams.get('cidl')) {
                if (window.location.pathname == '/store.php') {
                    $("#get_product").html("<h3>Loading...</h3>");
                    event.preventDefault();
                    var cid = urlParams.get('cidl')

                    $.ajax({
                        url		:	"action.php",
                        method	:	"POST",
                        data	:	{get_seleted_Category:1,cat_id:cid},
                        success	:	function(data){
                            $("#get_product").html(data);
                            if($("body").width() < 480){
                                $("body").scrollTop(683);
                            }
                        }
                    })
                }
            }
            */


            if (urlParams.get('keyword') && urlParams.get('search')) {
                console.log("entered checkforlink search");
                console.log(window.location.pathname);
                if (window.location.pathname == '/online-shopping-system/store.php') {
                    console.log("entered if checkforlink search");
                
                    var keyword = urlParams.get('keyword');
                    var search = urlParams.get('search');
                    $("#get_product").html("<h3>Se incarca...</h3>");

                    if(keyword != ""){
                        $.ajax({
                            url		:	"action.php",
                            method	:	"POST",
                            data	:	{search:search,keyword:keyword},
                            success	:	function(data){
                                $("#get_product").html(data);
                                if($("body").width() < 480){
                                    $("body").scrollTop(683);
                                }
                            }
                        })
                    }
                }
            }
            

            if (urlParams.get('get_seleted_Category') && urlParams.get('cat_id')) {
                console.log("pathname: ");
                console.log(window.location.pathname);
                if (window.location.pathname === '/online-shopping-system/store.php') {
                    console.log("entered if");
                    var get_seleted_Category = urlParams.get('get_seleted_Category');
                    var cat_id = urlParams.get('cat_id');                

                    //make active on navbar
                    $("li[cid='" + cat_id + "']").toggleClass('active');

                    //make active on sidebar
                    $("div[cid='" + cat_id + "'] > a").css('color', 'blue');

                    $("#get_product").html("<h3>Se incarca...</h3>");
                    //event.preventDefault();

                    if (cat_id) {
                        $.ajax({
                            url: "homeaction.php",
                            method: "POST",
                            data: {get_seleted_Category: get_seleted_Category, cat_id: cat_id},
                            success: function (data) {
                                $("#get_product").html(data);
                                if ($("body").width() < 480) {
                                    $("body").scrollTop(683);
                                }
                                $("div[cid='" + cat_id + "'] > a").css('color', 'blue');
                            }
                        })
                    }
                }
            }
        }, //ended promise success
        
        function(err) {
          console.log(err); 
        });
        
        
    } //ended checkforlink function
        

	//cat() is a function fetching category record from database whenever page is load
    //#get_category element is part of store.php file
    //puts the categories with the products number in the sidebar
	function cat(){
        var promise = new Promise(function(resolve, reject) {
            console.log("promise started");
            $.ajax({
                url	:	"action.php",
                method:	"POST",
                data	:	{category:1},
                success	:	function(data){
                    console.log("content put to #get_category");
                    $("#get_category").html(data);
                    if (data)
                        resolve("categories retrieved!");
                    else
                        reject(Error("null content"));
                }
                
            })
        });
        return promise;
	}

    // puts the categories in the navigation bar
    function cathome(){
		$.ajax({
			url	:	"homeaction.php",
			method:	"POST",
			data	:	{categoryhome:1},
			success	:	function(data){
				$("#get_category_home").html(data);
				
			}
		})
	}

	//brand() is a function fetching brand record from database whenever page is load
    //#get_brand element is part of store.php file
	function brand(){
		$.ajax({
			url	:	"action.php",
			method:	"POST",
			data	:	{brand:1},
			success	:	function(data){
				$("#get_brand").html(data);
			}
		})
	}

	//product() is a funtion fetching product record from database whenever page is load
    //#get_product element is part of store.php file
	//puts products	
    function product(){
		$.ajax({
			url	:	"action.php",
			method:	"POST",
			data	:	{getProduct:1},
			success	:	function(data){
				$("#get_product").html(data);
			}
		})
	}
    //gethomeproduts();
    function gethomeproduts(){
		$.ajax({
			url	:	"homeaction.php",
			method:	"POST",
			data	:	{gethomeProduct:1},
			success	:	function(data){
				$("#get_home_product").html(data);
			}
		})
	}
    
    //was puting products in the top sold products section 
    function producthome(){
		$.ajax({
			url	:	"homeaction.php",
			method:	"POST",
			data	:	{getProducthome:1},
			success	:	function(data){
				$("#get_product_home").html(data);
			}
		})
	}
   
    
	/*	when page is load successfully then there is a list of categories when user click on category we will get category id and 
		according to id we will show products
	*/

	$("body").on("click", ".categoryhome", function(event) {
        
        console.log("anchor inside categoryhome class has been clicked");
		var cid = $(this).attr('cid');

        console.log($(this));

        $(this).toggleClass('active');

        console.log($(this));

		if (window.location.pathname != '/store.php') {
			console.log('/store.php?cat_id=' + cid + '&get_seleted_Category=1');
            console.log("moved to store");
			//location.replace("https://www.w3schools.com");
			window.location.href = 'store.php?get_seleted_Category=1&cat_id=' + cid;
		} else {

			window.location.href = 'store.php?get_seleted_Category=0&cat_id=' + cid;
            /*
			$("#get_product").html("<h3>Loading...</h3>");
			event.preventDefault();
            if(cid) {

                 $.ajax({
                        url: "homeaction.php",
                        method: "POST",
                        data: {get_seleted_Category: 1, cat_id: cid},
                        success: function (data) {
                            $("#get_product").html(data);
                            if ($("body").width() < 480) {
                                $("body").scrollTop(683);
                            }
                        }
                 })

		   }
            */

        }
	});

	/*	when page is load successfully then there is a list of brands when user click on brand we will get brand id and 
		according to brand id we will show products
	*/

	$("body").on("click", ".selectBrand", function(event){
		event.preventDefault();
		$("#get_product").html("<h3>Se incarca...</h3>");
		var bid = $(this).attr('bid');
		
			$.ajax({
			url		:	"action.php",
			method	:	"POST",
			data	:	{selectBrand:1,brand_id:bid},
			success	:	function(data){
				$("#get_product").html(data);
				if($("body").width() < 480){
					$("body").scrollTop(683);
				}
			}
		})
	
	})

    /*
	$(".category-link").click( function() {
		var cidl = $(this).attr('cidl');
		if (window.location.pathname == '/store.php') {
			$("#get_product").html("<h3>Loading...</h3>");
			event.preventDefault();
			var cid = cidl;

			$.ajax({
				url		:	"action.php",
				method	:	"POST",
				data	:	{get_seleted_Category:1,cat_id:cid},
				success	:	function(data){
					$("#get_product").html(data);
					if($("body").width() < 480){
						$("body").scrollTop(683);
					}
				}
			})
		} else {
			window.location = '/store.php?cidl=' + cidl;
		}
	});
    */

	/*
		At the top of page there is a search box with search button when user put name of product then we will take the user 
		given string and with the help of sql query we will match user given string to our database keywords column then matched product 
		we will show 
	*/
	$("#search_btn").click(function(){

        console.log("search button has been clicked!");
		console.log(window.location.pathname);
		var keyword = $("#search").val();
		console.log(keyword);

		if (window.location.pathname == '/store.php') {
			console.log('Parleala');
			$("#get_product").html("<h3>Loading...</h3>");

			if(keyword != ""){
				$.ajax({
					url		:	"action.php",
					method	:	"POST",
					data	:	{search:1,keyword:keyword},
					success	:	function(data){
						$("#get_product").html(data);
						if($("body").width() < 480){
							$("body").scrollTop(683);
						}
					}
				})
			}
		} else {
			//console.log('Ce pula mea');
			var keyword = $("#search").val();
			window.location = 'store.php?keyword=' + keyword + '&search=1';
		}
	})
	//end


	/*
		Here #login is login form id and this form is available in index.php page
		from here input data is sent to login.php page
		if you get login_success string from login.php page means user is logged in successfully and window.location is 
		used to redirect user from home page to profile.php page
	*/
	$("#login").on("submit",function(event){
		event.preventDefault();
		$(".overlay").show();
		$.ajax({
			url	:	"login.php",
			method:	"POST",
			data	: $("#login").serialize(),
			success	:function(data){
				console.log("received answer from login.php: ")
				if(data == "login_success"){
					console.log("login_success")
                    document.cookie = "auth=1";
					window.location.href = "index.php";
				}else if(data == "cart_login"){
					window.location.href = "cart.php";
				}else{
					console.log("received undefined answer from login.php")
					$("#e_msg").html(data);
					//$(".overlay").hide();
				}
			},
			error: function(xhr, status, error){

				var errorMessage = xhr.status + ': ' + xhr.statusText
				alert('Error - ' + errorMessage);
			}
		})
	})
	//end

	//Get User Information before checkout
	$("#signup_form").on("submit",function(event){
		event.preventDefault();
		$(".overlay").show();
		$.ajax({
			url : "register.php",
			method : "POST",
			data : $("#signup_form").serialize(),
			success : function(data){
				$(".overlay").hide();
				if (data == "register_success") {
					window.location.href = "cart.php";
				}else{
					$("#signup_msg").html(data);
				}
				
			}
		})
	})
	
	
    $("#offer_form").on("submit",function(event){
		event.preventDefault();
		$(".overlay").show();
		$.ajax({
			url : "offersmail.php",
			method : "POST",
			data : $("#offer_form").serialize(),
			success : function(data){
				$(".overlay").hide();
				$("#offer_msg").html(data);
				
			}
		})
	})
    
    
    
	//Get User Information before checkout end here

	//Add Product into Cart
	$("body").on("click", "#product", function(event){
		event.preventDefault();
		var pid = $(this).attr("pid");

        if (document.cookie.split(';').filter((item) => item.includes('auth=1')).length) {
            console.log('product will be put into the cart')
            $(".overlay").show();
            $.ajax({
                url : "action.php",
                method : "POST",
                data : {addToCart:1,proId:pid,},
                success : function(data){
                    count_item();
                    getCartItem();
                    $('#product_msg').html(data);
                    $('.overlay').hide();
                }
            })
        }
        else {
			var str = "	<div class='alert alert-danger'>" +
					  "	<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> " +
					  "	<b>Trebuie sa fii autentificat pentru a adauga in cos!</b> </div>";
            $('#product_msg').html(str);
        }

	})

	//Add Product into Cart End Here
	//Count user cart items funtion
	count_item();
	function count_item(){
		$.ajax({
			url : "action.php",
			method : "POST",
			data : {count_item:1},
			success : function(data){
				$(".badge").html(data);
			}
		})
	}
	//Count user cart items funtion end

	//Fetch Cart item from Database to dropdown menu
	getCartItem();
	function getCartItem(){
		$.ajax({
			url : "action.php",
			method : "POST",
			data : {Common:1,getCartItem:1},
			success : function(data){
				$("#cart_product").html(data);
                net_total();
                
			}
		})
	}

	//Fetch Cart item from Database to dropdown menu

	/*
		Whenever user change qty we will immediate update their total amount by using keyup funtion
		but whenever user put something(such as ?''"",.()''etc) other than number then we will make qty=1
		if user put qty 0 or less than 0 then we will again make it 1 qty=1
		('.total').each() this is loop funtion repeat for class .total and in every repetation we will perform sum operation of class .total value 
		and then show the result into class .net_total
	*/
	$("body").delegate(".qty","keyup",function(event){
		event.preventDefault();
		var row = $(this).parent().parent();
		var price = row.find('.price').val();
		var qty = row.find('.qty').val();
		if (isNaN(qty)) {
			qty = 1;
		};
		if (qty < 1) {
			qty = 1;
		};
		var total = price * qty;
		row.find('.total').val(total);
		var net_total=0;
		$('.total').each(function(){
			net_total += ($(this).val()-0);
		})
		$('.net_total').html("Total : " +net_total + " LEI");

	})
	//Change Quantity end here 

	/*
		whenever user click on .remove class we will take product id of that row 
		and send it to action.php to perform product removal operation
	*/
    
	   
    $("body").delegate(".remove","click",function(event){
        var remove = $(this).parent().parent().parent();
        var remove_id = remove.find(".remove").attr("remove_id");
        $.ajax({
            url	:	"action.php",
            method	:	"POST",
            data	:	{removeItemFromCart:1,rid:remove_id},
            success	:	function(data){
                $("#cart_msg").html(data);
                checkOutDetails();
                }
            })
    })
    
    
	/*
		whenever user click on .update class we will take product id of that row 
		and send it to action.php to perform product qty updation operation
	*/
	$("body").delegate(".update","click",function(event){
		var update = $(this).parent().parent().parent();
		var update_id = update.find(".update").attr("update_id");
		var qty = update.find(".qty").val();
		$.ajax({
			url	:	"action.php",
			method	:	"POST",
			data	:	{updateCartItem:1,update_id:update_id,qty:qty},
			success	:	function(data){
				$("#cart_msg").html(data);
				checkOutDetails();
			}
		})


	})
	checkOutDetails();
	net_total();
	/*
		checkOutDetails() function work for two purposes
		First it will enable php isset($_POST["Common"]) in action.php page and inside that
		there is two isset funtion which is isset($_POST["getCartItem"]) and another one is isset($_POST["checkOutDetials"])
		getCartItem is used to show the cart item into dropdown menu 
		checkOutDetails is used to show cart item into Cart.php page
	*/
	function checkOutDetails(){
	 $('.overlay').show();
		$.ajax({
			url : "action.php",
			method : "POST",
			data : {Common:1,checkOutDetails:1},
			success : function(data){
				$('.overlay').hide();
				$("#cart_checkout").html(data);
					net_total();
			}
		})
	}
	/*
		net_total function is used to calcuate total amount of cart item
	*/
	function net_total(){
		var net_total = 0;
		$('.qty').each(function(){
			var row = $(this).parent().parent();
			var price  = row.find('.price').val();
			var total = price * $(this).val()-0;
			row.find('.total').val(total);
		})
		$('.total').each(function(){
			net_total += ($(this).val()-0);
		})
		$('.net_total').html("Total : " +net_total + " LEI");
	}

	//remove product from cart

	page();
	function page(){
		$.ajax({
			url	:	"action.php",
			method	:	"POST",
			data	:	{page:1},
			success	:	function(data){
				$("#pageno").html(data);
			}
		})
	}
	$("body").delegate("#page","click",function(){
		var pn = $(this).attr("page");
		$.ajax({
			url	:	"action.php",
			method	:	"POST",
			data	:	{getProduct:1,setPage:1,pageNumber:pn},
			success	:	function(data){
				$("#get_product").html(data);
			}
		})
	})
})






















