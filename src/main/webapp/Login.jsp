<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>LightHouse Login</title>
<!-- for-mobile-apps -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Account Login Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //for-mobile-apps -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,700,900,300'
	rel='stylesheet' type='text/css'>
<link href="resources/css/styleLOGIN.css" rel="stylesheet"
	type="text/css" media="all" />
<script src="resources/js/jquery-1.11.1.min.js"></script>

<!-- //js -->
<!-- chart -->

<!-- //chart -->
<script src="resources/js/easyResponsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
		
		// Register User
		$('#btnSub').click(function(event) {
			 var fname = $("input#Fnm").val();
			 var lname = $("input#Lnm").val();
             var uname = $("input#Unm").val();
             var email = $("input#email").val();
             var password = $("input#password").val();
             var secQus = $("select#seqQus").val();
             var secQusAns = $("input#ans").val();
             
             if(fname == '' || lname == '' || uname == '' || email == '' || password == '' || secQus == '' || secQusAns == ''){
            	 alert("All fields should be filled.");
            	 
             }

			$.get('RegistrationController', {
				fn : fname, ln : lname,un : uname, em : email,ps : password, secQ : secQus,secAns : secQusAns,
			}, function(response) {
				var x =response;
	  	    	alert(x);
			});
		});
		
		
		// Login User
		$('#loginer').click(function(event) {
			 var emails = $("input#ems").val();
             var passwords = $("input#pss").val();
             
             if(emails == '' || password == ''){
            	 alert("Email Address or Password can not remain blank.");
             }

			$.get('LoginController', {
				ps : passwords, em : emails,
			}, function(response) {
				
				if(response){
		  	    	alert("Incorrect Credentials");
				}				
	  	    	
			});
		});

	});
</script>
<style>
	.select-css {
	display: block;
	font-size: 16px;
	font-family: sans-serif;
	font-weight: 700;
	color: #444;
	line-height: 1.3;
	padding: .6em 1.4em .5em .8em;
	width: 91%;
	max-width: 91%;
	box-sizing: border-box;
	margin: 0;
	border: 1px solid #aaa;
	box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
	border-radius: .5em;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	background-color: #fff;
	background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
	  linear-gradient(to bottom, #ffffff 0%,#e5e5e5 100%);
	background-repeat: no-repeat, repeat;
	background-position: right .7em top 50%, 0 0;
	background-size: .65em auto, 100%;
}
.select-css::-ms-expand {
	display: none;
}
.select-css:hover {
	border-color: #888;
}
.select-css:focus {
	border-color: #aaa;
	box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
	box-shadow: 0 0 0 3px -moz-mac-focusring;
	color: #222;
	outline: none;
}
.select-css option {
	font-weight:normal;
}
</style>
</head>
	<%@page import="queryLibrary.Queries"%>
<%@page import="connectionFactory.Connections"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%
   ResultSet resultset = null;
   %>
<body>
	<div class="content">
		<h1>Welcome To Cognizant Performance LightHouse</h1>
		<div class="main">
			<div class="profile-left wthree">
				<div class="sap_tabs">
					<div id="horizontalTab"
						style="display: block; width: 100%; margin: 0px;">
						<ul class="resp-tabs-list">
							<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>
									Sign in</span></li>
							<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><h2>
									<span>Sign Up</span>
								</h2></li>
							<div class="clear"></div>
						</ul>
						<div class="resp-tabs-container">
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
								<div class="got">
									<h6>Got an account? Enter your details below to login</h6>
								</div>
								<div class="login-top">
									<form>
										<input type="text" class="email" id="ems" placeholder="Email"
											required="" /> <input type="password" id="pss" class="password"
											placeholder="Password" required="" /> 
									</form>
									<div class="login-bottom">
										<ul>
											<li>
												<form>
													<input type="submit" id="loginer" value="LOGIN" />
												</form>
											</li>
											<li><a href="#">Forgot password?</a></li>
											<ul>
												<div class="clear"></div>
									</div>
								</div>
							</div>
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
								<div class="login-top sign-top">
									<form action="#" method="post">
										<input type="text" name="name" id="Fnm" class="name active" placeholder="First Name" required="" />
										<input type="text" name="name" id="Lnm" class="name active" placeholder="Last Name" required="" />
										<input type="text" name="name" id="Unm" class="name active" placeholder="User Name" required="" /> 
										<input type="text" name="email" class="email" id="email" placeholder="Your Cognizant Email" required="" />
										<input type="password" name="password" id="password" class="password" placeholder="Password" required="" />
										<%
								         try {
								        	
								         	Connection connection = Connections.getConnection();
								         	Statement statement = connection.createStatement();
								         	resultset = statement.executeQuery(Queries.askSecurityQuestion);
								         %>
										<select class="select-css" id="seqQus">
										<option>Select Your Security Question</option>
										<%
							            	while (resultset.next()) {
							            %>
											<option value="<%=resultset.getInt(1)%>"><%=resultset.getString(2)%></option>
										<%
								            }
								            %>
									</select>
									<%
								         } catch (Exception e) {
								         	out.println("wrong entry" + e);
								         }
							         %>
										<input type="text" name="name" id="ans" class="name active" placeholder="Answer of your security question" required="" /> 
									</form>
									<div class="login-bottom">
										<ul>
											<li>
												<form action="#" method="post">
													<input type="submit" id="btnSub" value="SIGN UP" />
												</form>
											</li>
											<ul>
												<div class="clear"></div>
									</div>
									<div id="ajaxGetUserServletResponse"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>

			</div>
			<div class="clear"></div>
		</div>
		<p class="footer">
			&copy; 2016 Account Login Widget. All Rights Reserved | Design by <a
				href=""> Soham Roy</a>
		</p>
	</div>
</body>
</html>