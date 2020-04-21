<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Performance Data Template</title>
<!-- Favicons -->
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=yes" />
<link href="resources/img/favicon.png" rel="icon">
<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Bootstrap core CSS -->
<link href="resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/lib/bootstrap/css/Custom.css" rel="stylesheet">
<!--external css-->
<link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="resources/lib/gritter/css/jquery.gritter.css" />
<!-- Custom styles for this template -->
<link href="resources/css/styleD.css" rel="stylesheet">
<link href="resources/css/style-responsive.css" rel="stylesheet">
<link href="resources/css/PopupStyle.css" rel="stylesheet">
<script src="resources/lib/chart-master/Chart.js"></script>
<script type="text/javascript" src="resources/js/js/fusioncharts.js"></script>
	
<script type="text/javascript"
	src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
<link
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/lib/bootstrap-daterangepicker/daterangepicker.css" />
<link rel="stylesheet" type="text/css"
	href="resources/lib/bootstrap-timepicker/compiled/timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="resources/lib/bootstrap-datetimepicker/datertimepicker.css" />
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.12/js/select2.min.js" integrity="sha256-wfVTTtJ2oeqlexBsfa3MmUoB77wDNRPqT1Q1WA2MMn4=" crossorigin="anonymous"></script>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.12/css/select2.min.css" integrity="sha256-FdatTf20PQr/rWg+cAKfl6j4/IY3oohFAJ7gVC3M34E=" crossorigin="anonymous" /> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q=" crossorigin="anonymous" />
         <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI=" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI=" crossorigin="anonymous"></script> -->
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css"
	rel="stylesheet" />
	<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
	<script src="resources/dist/dropzone.js"></script>
<link rel="stylesheet" href="resources/dist/dropzone.css">
</head>
<body>
<section id="container">
	<!--header start-->
         <header class="header black-bg">
            <div class="sidebar-toggle-box">
               <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
            </div>
            <!--logo start-->
            <a href="performance.jsp" class="logo"><b>Perfor<span>Mance</span></b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
               <!--  notification start -->
               <ul class="nav top-menu">
                  <!-- settings start -->
                  <li class="dropdown">
                     <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                     <i class="fa fa-download" title="Download Recent Performance Report"></i>
                     </a>
                  </li>
                  <!-- settings end -->
                  <!-- notification dropdown start-->
                  <li id="header_notification_bar" class="dropdown">
                     <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                     <i class="fa fa-bell-o"></i>
                     <span class="badge bg-warning">7</span>
                     </a>
                  </li>
                  <!-- notification dropdown end -->
                  
               </ul>
               <!--  notification end -->
            </div>
            <div class="top-menu">
               
            </div>
         </header>
         <!--header end-->

	<!-- **********************************************************************************************************************************************************
            MAIN SIDEBAR MENU
            *********************************************************************************************************************************************************** -->