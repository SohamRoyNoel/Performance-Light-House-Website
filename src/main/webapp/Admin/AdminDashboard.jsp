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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" integrity="sha256-KzZiKy0DWYsnwMF+X1DvQngQ2/FxF7MF3Ff72XcpuPs=" crossorigin="anonymous"></script>
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
				<a href="#"><img width="190" height="110"
				src="https://kitconcept.com/blog/static/lighthouse-logo-af07c4b89f3fa49c62ef529afb647ac3-3067a.png"
				class="img-circle" width="80"></a>
				<h3 style="color: white; font-family: Lucida Calligraphy;"><b>Performance LightHouse</b></h3>
			</div>
			<div class="navigation">
				<h3>Featured</h3>
				<ul>
					<li><a href="#"><i class="fas fa-users fa-2x"></i></a></li> &nbsp&nbsp
					<li><a href="#">Users</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="fas fa-crown fa-2x"></i></a></li> &nbsp
					<li><a href="#">Make General Admin</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="fas fa-plus fa-2x"></i></a></li> &nbsp&nbsp&nbsp&nbsp&nbsp
					<li><a href="#">Add Application</a></li>
				</ul>
				<ul>
					<!-- Application User Mapper -->
					<li><a href="#"><i class="fas fa-universal-access fa-2x"></i></a></li> &nbsp&nbsp&nbsp&nbsp
					<li><a href="#">Application Access Details</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="fas fa-bell fa-2x"></i></a></li> &nbsp&nbsp&nbsp&nbsp
					<li><a href="#">Application Access Requests</a></li>
				</ul>
			</div>
			<div class="navigation">
				<h3>Navigation</h3>
				<ul>
					<li><a href="#"><i class="fas fa-vials fa-2x"></i></a></li> &nbsp&nbsp
					<li><a href="#">TestCases</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="fas fa-history fa-2x"></i></a></li>&nbsp&nbsp&nbsp&nbsp&nbsp
					<li><a href="#">TestCase History</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="fas fa-pager fa-2x"></i></a></li>&nbsp&nbsp&nbsp&nbsp&nbsp
					<li><a href="#">Available Pages</a></li>
				</ul>
			</div>
			<div class="navigation">
				<h3>All Others</h3>
				<ul>
					<li><a href="#"><i class="fas fa-user-minus fa-2x"></i></a></li>&nbsp&nbsp&nbsp
					<li><a href="#">Remove Users</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="fas fa-question fa-2x"></i></a></li> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<li><a href="#">FAQ</a></li>
				</ul>
			</div>
		</div>
		<div class="col-md-9 content">
			<div class="home-strip">
				
				<div class="member" style="float: right;">
					<p><a href="#"><i class="men"></i></a><a href="#">Username</a></p>
					
			<!-----end-wrapper-dropdown-2---->
			<br>
			<div class="clearfix"></div>
			</div>
			
			<div class="clearfix"></div>	
				</div>
				<div class="clearfix"></div>
				<br>
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