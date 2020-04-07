<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="Contents/DashboardGeneralHeader.jsp" />
<style>
* {
	box-sizing: border-box;
}

#myInput {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
}
</style>
<!-- <aside> -->
<div id="sidebar" style="visibility: visible;" class="">
	<!-- sidebar menu start-->
	<ul class="sidebar-menu" id="nav-accordion">
		<p class="centered">
			<a href="performance.jsp"><img width="190" height="110"
				src="https://kitconcept.com/blog/static/lighthouse-logo-af07c4b89f3fa49c62ef529afb647ac3-3067a.png"
				class="img-circle" width="80"></a>
		</p>
		<h5 class="centered">Performance LightHouse</h5>
		<li class="mt"><a class="active" href="performance.jsp"> <i
				class="fa fa-dashboard"></i> <span>Home</span>
		</a></li>
		<li class=""><a href="FAQ.jsp"> <i class="fa fa-question"></i>
				<span>FAQ</span>
		</a></li>
	</ul>
	<!-- sidebar menu end-->
</div>
<!-- </aside> -->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12 main-chart">
				<!--CUSTOM CHART START -->
				<div class="border-head" style="width: 1650px;">
					<h3>Create A New TestCase Here</h3>
				</div>
				<form class="form-horizontal" action="">
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">Enter
							Your Test Scenario Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="email"
								placeholder="Enter Your Test Scenario Name" name="email">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Enter Your
							Application Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="pwd"
								placeholder="Enter Your Application Name" name="pwd">
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">Check
								Availability Of Your Application Name</button>
						</div>
					</div>
				</form>
				<br>
				<div class="border-head" style="width: 1650px;">
					<h3>Update or Remove Your Old TestCase Here</h3>
				</div>


				<h2>Your TestCases</h2>

				<input type="text" id="myInput" onkeyup="myFunction()"
					placeholder="Search for names.." title="Type in a name">

				<table id="myTable">
					<tr>
						<th style="width: 1200px;">Select</th>
						<th style="width: 1200px;">TestCase Name</th>
						<th style="width: 1200px;">Application Name</th>
						<th style="width: 1200px;">Choose Actions</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>TC1</td>
						<td>Application 1</td>
						<td><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> &nbsp <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>TC2</td>
						<td>Application 1</td>
						<td><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> &nbsp <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>TC3</td>
						<td>Application 2</td>
						<td><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> &nbsp <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>TC4</td>
						<td>Application 2</td>
						<td><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> &nbsp <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>TC5</td>
						<td>Application 1</td>
						<td><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> &nbsp <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>TC6</td>
						<td>Application 3</td>
						<td><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> &nbsp <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>TC7</td>
						<td>Application 2</td>
						<td><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> &nbsp <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>TC8</td>
						<td>Application 1</td>
						<td><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> &nbsp <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
					</tr>
				</table>

				<script>
					function myFunction() {
						var input, filter, table, tr, td, i, txtValue;
						input = document.getElementById("myInput");
						filter = input.value.toUpperCase();
						table = document.getElementById("myTable");
						tr = table.getElementsByTagName("tr");
						for (i = 0; i < tr.length; i++) {
							td = tr[i].getElementsByTagName("td")[2];
							if (td) {
								txtValue = td.textContent || td.innerText;
								if (txtValue.toUpperCase().indexOf(filter) > -1) {
									tr[i].style.display = "";
								} else {
									tr[i].style.display = "none";
								}
							}
						}
					}
				</script>
			</div>
		</div>
		</div>
	</section>
</section>

<jsp:include page="Contents/DashboardGeneralFooter.jsp" />