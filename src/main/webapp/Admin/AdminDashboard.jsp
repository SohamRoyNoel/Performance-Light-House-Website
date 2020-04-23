<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Performance Admin Panel</title>
<link href="resources/css/bootstrap.css" rel="stylesheet" type='text/css' />
<!-- Custom Theme files -->
<link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/font-awesome.css">
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Metro Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  	ga('create', 'UA-48014931-1', 'codyhouse.co');
  	ga('send', 'pageview');

  	jQuery(document).ready(function($){
  		$('.close-carbon-adv').on('click', function(){
  			$('#carbonads-container').hide();
  		});
  	});
</script>
	<script src="resources/js/zingchart.min.js"></script>
	<script src="resources/js/zingchart.jquery.js"></script>
	<script src="resources/js/jquery.easydropdown.js"></script>
	<script src="resources/js/jquery.nicescroll.js"></script>
	
					 <link href="css/jqvmap.css" media="screen" rel="stylesheet" type="text/css" />
					 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery.vmap.js" type="text/javascript"></script>
    <script src="resources/js/jquery.vmap.world.js" type="text/javascript"></script>
	<script src="resources/js/jquery.vmap.sampledata.js" type="text/javascript"></script>
    
	<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery('#vmap').vectorMap({
		    map: 'world_en',
		    backgroundColor: '#333333',
		    color: '#ffffff',
		    hoverOpacity: 0.7,
		    selectedColor: '#666666',
		    enableZoom: true,
		    showTooltip: true,
		    values: sample_data,
		    scaleColors: ['#C8EEFF', '#006491'],
		    normalizeFunction: 'polynomial'
		});
	});
	</script>
<!----Calender -------->
  <link rel="stylesheet" href="css/clndr.css" type="text/css" />
  <script src="js/underscore-min.js"></script>
  <script src= "js/moment-2.2.1.js"></script>
  <script src="js/clndr.js"></script>
  <script src="js/site.js"></script>
<!----End Calender -------->
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab,#horizontalTab1,#horizontalTab2').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
			   </script>
<link href="css/nav.css" rel="stylesheet" type="text/css" media="all"/>
<script src="js/main.js"></script> <!-- Resource jQuery -->
					<!-- chart -->
					<script src="js/Chart1.js"></script>
					<!-- //chart -->

</head>
<body>
<div class="total-content">
		<div class="col-md-3 side-bar">
			<div class="logo text-center">
				<a href="#"><img src="images/logo.png" alt="" /></a>
			</div>
			<div class="navigation">
				<h3>Featured</h3>
				<ul>
					<li><a href="#"><i class="chat"></i></a></li>
					<li><a href="#">Charts</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="art"></i></a></li>
					<li><a href="#">Articals</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="user"></i></a></li>
					<li><a href="#">Users</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="fat"></i></a></li>
					<li><a href="#">Favorites</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="speed"></i></a></li>
					<li><a href="#">Speed</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="setting"></i></a></li>
					<li><a href="#">Settings</a></li>
				</ul>
			</div>
			<div class="navigation">
				<h3>Navigation</h3>
				<ul>
					<li><a href="#"><i class="dash"></i></a></li>
					<li><a href="#">Dashboard</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="mail"></i></a></li>
					<li><a href="#">Emails</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="cal"></i></a></li>
					<li><a href="#">Calendar</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="page"></i></a></li>
					<li><a href="#">Pages</a></li>
				</ul>
			</div>
			<div class="navigation">
				<h3>All Others</h3>
				<ul>
					<li><a href="#"><i class="rev"></i></a></li>
					<li><a href="#">Revenue</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="pic"></i></a></li>
					<li><a href="#">Pictures</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="faq"></i></a></li>
					<li><a href="#">FAQs</a></li>
				</ul>
			</div>
		</div>
		<div class="col-md-9 content">
			<div class="home-strip">
				<div class="view">
					<ul>
						<li><a href="index.html"><i class="refresh"></i></a></li>
						<!--<li class="messages"><a href="#"><i class="msgs"></i><span class="red">3</span></a></li>-->
						<li>
								  <div id="dd1" class="wrapper-dropdown-1"><i class="msgs"></i><span class="red">3</span>
									<ul class="dropdown">
										<div class="notification_header">
											<h3>You have 3 new messages</h3>
										</div>
										<li><a href="#">
										   <div class="user_img"><img src="images/avatar2.jpg" alt=""></div>
										   <div class="notification_desc">
										   	<p>Lorem ipsum dolor sit amet</p>
										   	<p><span>1 hour ago</span></p>
										   	</div>
										   <div class="clear"> </div>
										 </a></li>
										 <li class="odd"><a href="#">
										    <div class="user_img"><img src="images/avatar.jpg" alt=""></div>
										   <div class="notification_desc">
										   	<p>Lorem ipsum dolor sit amet </p>
										   	<p><span>1 hour ago</span></p>
										   	</div>
										   <div class="clear"> </div>
										 </a></li>
										 <li><a href="#">
										   <div class="user_img"><img src="images/avatar1.jpg" alt=""></div>
										   <div class="notification_desc">
										   	<p>Lorem ipsum dolor sit amet </p>
										   	<p><span>1 hour ago</span></p>
										   	</div>
										   <div class="clear"> </div>
										 </a></li>
										<div class="notification_bottom">
											<h3><a href="#">See all messages</a></h3>
										</div> 
									</ul>
							   </div>
							   <!-----start-script---->
			<script type="text/javascript">
							function DropDown(el) {
								this.dd1 = el;
								this.initEvents();
							}
							DropDown.prototype = {
								initEvents : function() {
									var obj = this;
				
									obj.dd.on('click', function(event){
										$(this).toggleClass('active');
										event.stopPropagation();
									});	
								}
							}
							$(function() {
				
								var dd1 = new DropDown( $('#dd1') );
				
								$(document).click(function() {
									// all dropdowns
									$('.wrapper-dropdown-1').removeClass('active');
								});
				
							});
			</script>
						   </li>
						<!--<li class="notifications"><a href="#"><i class="bell"></i><span class="blue">7</span></a></li>-->
						<li>
								  <div id="dd3" class="wrapper-dropdown-3"><i class="bell"></i><span class="blue">5</span>
									<ul class="dropdown">
										<div class="notification_header">
											<h3>You have 5 notifications</h3>
										</div>
										<li><a href="#">
										   <div class="user_icon1"><i class="nur"></i></div>
										   <div class="notification_desc">
										   	<p>New user registered</p>
										   	<p><span>2 minutes ago</span></p>
										   	</div>
										   <div class="clear"> </div>
										 </a></li>
										 <li class="odd"><a href="#">
										    <div class="user_icon2"><i class="cancel"></i></div>
										   <div class="notification_desc">
										   	<p>Lorem ipsum dolor sit amet </p>
										   	<p><span>6 minutes ago</span></p>
										   	</div>
										   <div class="clear"> </div>
										 </a></li>
										 <li><a href="#">
										   <div class="user_icon3"><i class="lock"></i></div>
										   <div class="notification_desc">
										   	<p>Lorem ipsum dolor sit amet </p>
										   	<p><span>10 minutes ago</span></p>
										   	</div>
										   <div class="clear"> </div>
										 </a></li>
										<div class="notification_bottom">
											<h3><a href="#">See all notifications</a></h3>
										</div> 
									</ul>
							   </div>
							   <!-----start-script---->
			<script type="text/javascript">
							function DropDown(el) {
								this.dd3 = el;
								this.initEvents();
							}
							DropDown.prototype = {
								initEvents : function() {
									var obj = this;
				
									obj.dd.on('click', function(event){
										$(this).toggleClass('active');
										event.stopPropagation();
									});	
								}
							}
							$(function() {
				
								var dd3 = new DropDown( $('#dd3') );
				
								$(document).click(function() {
									// all dropdowns
									$('.wrapper-dropdown-3').removeClass('active');
								});
				
							});
			</script>
						   </li>
					</ul>
				</div>
				<div class="search">
					<div class="search2">
					  <form>
						<input type="submit" value="">
						 <input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
					  </form>
					</div>
				</div>
				<div class="member">
					<p><a href="#"><i class="men"></i></a><a href="#">Username</a></p>
					<div id="dd" class="wrapper-dropdown-2" tabindex="1"><span><img src="images/settings.png"/></span>
							<ul class="dropdown">
							
									<li><a href="#">View Profile </a></li>
									<li><a href="#">Lists</a></li>
									<li><a href="#">Help</a></li>
									<li><a href="#">Activity log</a></li>
									<li><a href="#">Report a problem</a></li>
									<li><a href="#">Log out</a></li>
							</ul>
					</div>
			<!-----end-wrapper-dropdown-2---->
			<!-----start-script---->
			<script type="text/javascript">
							function DropDown(el) {
								this.dd = el;
								this.initEvents();
							}
							DropDown.prototype = {
								initEvents : function() {
									var obj = this;
				
									obj.dd.on('click', function(event){
										$(this).toggleClass('active');
										event.stopPropagation();
									});	
								}
							}
							$(function() {
				
								var dd = new DropDown( $('#dd') );
				
								$(document).click(function() {
									// all dropdowns
									$('.wrapper-dropdown-2').removeClass('active');
								});
				
							});
			</script>
			<div class="clearfix"></div>			
			</div>
			<div class="clearfix"></div>	
				</div>
				<div class="clearfix"></div>
			<p class="home"><a href="#">Home</a> > <strong> Dashboard</strong></p>
			<div class="list_of_members">
				<div class="sales">
					<div class="icon">
						<i class="dollar"></i>
					</div>
					<div class="icon-text">
						<h3>15896</h3>
						<p>Sales</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="new-users">
					<div class="icon">
						<i class="user1"></i>
					</div>
					<div class="icon-text">
						<h3>5356</h3>
						<p>New Users</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="orders">
					<div class="icon">
						<i class="order"></i>
					</div>
					<div class="icon-text">
						<h3>26856</h3>
						<p>New Orders</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="visitors">
					<div class="icon">
						<i class="visit"></i>
					</div>
					<div class="icon-text">
						<h3>85k</h3>
						<p>Visits</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
					
			
			<div class="cd-tabs">
</div> 

		</div>
		<div class="clearfix"></div>
	</div>
	<div class="footer">
			<div class="copyright text-center">
					<p>&copy; 2015 All rights reserved | Template by  <a href="http://w3layouts.com">  W3layouts</a></p>
			</div>		
		</div>
</body>
</html>