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


	<script src="resources/js/jquery.nicescroll.js"></script>
	
	 <link href="css/jqvmap.css" media="screen" rel="stylesheet" type="text/css" />
	   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>  -->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
					<li><a href="AllUsers.jsp"><i class="fas fa-users fa-2x"></i></a></li> &nbsp&nbsp
					<li><a href="AllUsers.jsp">Users</a></li>
				</ul>
				<ul>
					<li><a href="NewAdmin.jsp"><i class="fas fa-crown fa-2x"></i></a></li> &nbsp
					<li><a href="NewAdmin.jsp">Make General Admin</a></li>
				</ul>
				<ul>
					<li><a href="AddApplication.jsp"><i class="fas fa-plus fa-2x"></i></a></li> &nbsp&nbsp&nbsp&nbsp&nbsp
					<li><a href="AddApplication.jsp">Add Application</a></li>
				</ul>
				<ul>
					<!-- Application User Mapper -->
					<li><a href="AccessDetails.jsp"><i class="fas fa-universal-access fa-2x"></i></a></li> &nbsp&nbsp&nbsp&nbsp
					<li><a href="AccessDetails.jsp">Application Access Details</a></li>
				</ul>
				<ul>
					<li><a href="UserRequests.jsp"><i class="fas fa-bell fa-2x"></i></a></li> &nbsp&nbsp&nbsp&nbsp
					<li><a href="UserRequests.jsp">Application Access Requests</a></li>
				</ul>
			</div>
			<div class="navigation">
				<h3>Navigation</h3>
				<ul>
					<li><a href="TestCases.jsp"><i class="fas fa-vials fa-2x"></i></a></li> &nbsp&nbsp
					<li><a href="TestCases.jsp">TestCases</a></li>
				</ul>
				<ul>
					<li><a href="TSHistory.jsp"><i class="fas fa-history fa-2x"></i></a></li>&nbsp&nbsp&nbsp&nbsp&nbsp
					<li><a href="TSHistory.jsp">TestCase History</a></li>
				</ul>
				<ul>
					<li><a href="Pages.jsp"><i class="fas fa-pager fa-2x"></i></a></li>&nbsp&nbsp&nbsp&nbsp&nbsp
					<li><a href="Pages.jsp">Available Pages</a></li>
				</ul>
			</div>
			<div class="navigation">
				<h3>All Others</h3>
				<ul>
					<li><a href="UserRemover.jsp"><i class="fas fa-user-minus fa-2x"></i></a></li>&nbsp&nbsp&nbsp
					<li><a href="UserRemover.jsp">Remove Users</a></li>
				</ul>
				<ul>
					<li><a href="FAQ.jsp"><i class="fas fa-question fa-2x"></i></a></li> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<li><a href="FAQ.jsp">FAQ</a></li>
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
<%@page import="queryLibrary.Queries"%>
<%@page import="connectionFactory.Connections"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%
   ResultSet resultset = null;
	ResultSet resultset1 = null;
	ResultSet resultset2 = null;
	ResultSet resultset3 = null;
   %>
			<p class="home"><a href="#">Home</a> > <strong> Dashboard</strong></p>
			<div class="list_of_members">
				
				<div class="new-users">
					<div class="icon">
						<i class="user1"></i>
					</div>
					<div class="icon-text">
					<%
			         try {
			        	
			         	Connection connection = Connections.getConnection();
			         	Statement statement = connection.createStatement();
			         	resultset = statement.executeQuery(Queries.getUserCountForAdmin);
			         	while (resultset.next()) {
			         %>
						<h3><%=resultset.getString(1)%></h3>
						<%
			            }
				         
			            %>
						<p>Users</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="sales">
					<div class="icon">
						<img src="https://img.icons8.com/nolan/64/cloudflare.png"/>
					</div>
					<div class="icon-text">
					<%
					resultset1 = statement.executeQuery(Queries.getApplicationCountForAdmin);
					while (resultset1.next()) {
					%>
						<h3><%=resultset1.getString(1)%></h3>
						<%
			            }
			            %>
						<p>Applications</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="orders">
					<div class="icon">
						<img src="https://img.icons8.com/dusk/64/000000/domain.png"/>
					</div>
					<div class="icon-text">
					<%
					resultset2 = statement.executeQuery(Queries.getPageCountForAdmin);
					while (resultset2.next()) {
					%>
						<h3><%=resultset2.getString(1)%></h3>
						<%
			            }
			            %>
						<p>Web pages</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="visitors">
					<div class="icon">
						<img src="https://img.icons8.com/cotton/64/000000/test-tube-1.png"/>
					</div>
					<div class="icon-text">
					<%
					resultset3 = statement.executeQuery(Queries.getTSCountForAdmin);
					while (resultset3.next()) {
					%>
						<h3><%=resultset3.getString(1)%></h3>
						<%
			            }
			            %>
						<p>Test Cases</p>
						
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			 	
			<%
			         } catch (Exception e) {
				         	out.println("wrong entry" + e);
				         }
						%>
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