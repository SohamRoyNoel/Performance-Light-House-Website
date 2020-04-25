<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Contents/DashboardGeneralHeader.jsp" />
<%@page import="queryLibrary.Queries"%>
<%@page import="connectionFactory.Connections"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>

<%
   ResultSet resultset = null;
   %>
   
<script>
$(document).ready(function() { 
	// Creates application
	$('#RequestBtn').click(function(event) {
		var apName = $("input#apName").val();
		if(apName == ''){
			alert("Application can not be added when it is empty");
		}else{
			$.get('CreateApplicationController', {
		       	 ApplicationName : apName
		        }, function(response) {
		        	alert("Requested Application is Accepted, Waiting For Approval");    
		        });
		}
        
	});
	
	// Request Handler
	 $('.xx').click(function(event) {
		 var id = $(this).closest("tr").find(".appId").text();
		 var name = $(this).closest("tr").find(".apNm").text();
		 // alert("Id : " + id + " Name : " + name);
		 $.get('CreateRequestController', {
	       	 AppId : id, AppN : name,
	        }, function(response) {
		        alert("Request Accepted, Waiting For Approval");
	        });
      });
	
	
	 // Add Test Case Controller
	 $('#tcsm').click(function(event) {
		 var aNO = $("select#apps").val();
		 var TcName= $("input#tcnm").val(); 
		 
		 if (TcName != '') {
			 $.get('AddTestcaseController', {
		       	 ApNO : aNO, TcNM : TcName,
		        }, function(response) {
		        	$('body').append('<div style="display:none;">'+response+'</div>');
		            var r = confirm($('#pqId').val());
		            
	            	if ($('#pqId').val() == "Test Case Already Exists! Do You want to Override?" && r == true) {
	            		$.get('TestScenarioHistoryController', {
	           	       	 	
	           	        }, function(response) {
	           	        	alert("Test Scenario Owner Is Changed");
	           	        });
					}
		            
		            $("input[type='hidden']").remove();
		      });
		} else {
			alert("Test case name can not be added when it is empty");
		}
	 });
	 

	// Onchange Table Populate
	 $('#apps').change(function(event) {	
         var id = $("select#apps").val();
         
         $.get('PopulateTableController', {
        	 ApplicationId : id
         }, function(response) {
 				var ed = '';
 				$('.dels').remove();
 				response.forEach(json => {
 					let value = JSON.parse(json);
					  var x1 = value.id;var x2 = value.tsnm;var x3 = value.userId;var x4 = value.date;var x5 = value.Button;//console.log(x1);
					    ed += '<tr class="dels">';
	 					ed += '<td id="api">'+x1+'</td>';
	 					ed += '<td>'+x2+'</td>';
	 					ed += '<td>'+x3+'</td>';
	 					ed += '<td>'+x4+'</td>';
	 					ed += '<td>'+x5+'</td>';
	 					ed += '</tr>';
					});
 				$('.tabs').append(ed);
 				console.log(ed);
     });
     });
	
	// Test case name update Controller
	 $('#s').click(function(event) {
		 var updateTCName = $("input#t").val();
		 var row = _activeId;
		 var rowTC = _activeTCname;		
		 var rowOwner = _activeTCOwner;
		 var appid = $("select#apps").val();
		 var ov = "false";
		 $.get('UpdateTestCaseNameController', {
        	 TCname : updateTCName, tsID : row, tsName : rowTC, owner : rowOwner, ap:appid, flag : ov,
         }, function(response) {
        	 $('body').append('<div style="display:none;">'+response+'</div>');
        	var r = confirm($('#pqIds').val());
        	console.log("R : " + r);
        	var c = $('#pqIds').val();
        	var x ="It Seems The Test Scenario Has Other Owner. Do You Want To Take Ownership?";
        	var t = "true";
        	if($('#pqIds').val() == x && r == true){
        		$("input[type='hidden']").remove();
        		ov = "true";
        		
        		$.get('UpdateTestCaseNameController', {
        			TCname : updateTCName, tsID : row, tsName : rowTC, owner : rowOwner, ap:appid, flag : ov,
                }, function(response) {
                	$('body').append('<div style="display:none;">'+response+'</div>');
                	alert($('#pqIds').val());
                	$("#modalLoginForm").modal('hide');
                });
        	}else{
            	console.log("llll : ");
        	}        	
        	$("input[type='hidden']").remove();
        	$("#modalLoginForm").modal('hide');
     	});
	 });
	
	// Delete Test Case Name Controller
	
});

function opener(ctl){
	
	if(!$("#myTable11 tbody").length == 0){
		$("#modalLoginForm").modal('show');	
		_row = $(ctl).parents("tr"); 

		var cols = _row.children("td");	 

		 var x = ctl.parentNode.parentNode.rowIndex;
		 var tab = document.getElementById('myTable11');
		 _activeId = tab.rows[x].cells[0].innerHTML;
		 _activeTCname = tab.rows[x].cells[1].innerHTML;
		 _activeTCOwner = tab.rows[x].cells[2].innerHTML;
	}	
}
</script>

<script>
var _nextId = 1;
var _activeId = 0;
var _activeTCname = 0;
var _activeTCOwner = 0;
var _row = null;

</script>
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
<!-- <popup Update> -->
<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Update Your TestCase Name and Application Name</h4>
      </div>
      <div class="modal-body mx-3">
        
        <div class="md-form mb-4">
          <input type="text" id="t" class="form-control validate">
          <label data-error="wrong" data-success="right" for="defaultForm-pass">Testcase Name</label>
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button id="s" class="btn btn-success">Update</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modalSureForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Are You Sure? You Should know the consequence! </h4>
      </div>
      <div class="modal-footer d-flex center">
      <center>
        <button class="btn btn-danger">Delete</button>
        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
        </center>
      </div>
    </div>
  </div>
</div>
<script>
    $(document).ready(function(){
        /*$("#opener").click(function(){
        	console.log("Modal");
            $("#modalLoginForm").modal('show');
        });*/
    });
    $(document).ready(function(){
        $("#sure").click(function(){
            $("#modalSureForm").modal('show');
        });
    });
</script>
<!-- </popup Update> -->

<section id="main-content">
	<section class="wrapper">
<br><br>
	<!-- Classic tabs -->
<div id="exTab2" class="">	
<ul class="nav nav-tabs">
			<li class="active">
        <a  href="#1" data-toggle="tab">Applications</a>
			</li>
			<li><a href="#2" data-toggle="tab">Test Cases</a>
			</li>
		</ul>

			<div class="tab-content ">
			  <div class="tab-pane active" id="1">
			  
			  <h3>Manage Application : Application View</h3>
			  <!-- 1 St part -->
          			<div class="form-group row">
					  </div>
					  <div class="form-group row">
					    <label for="inputPassword" style="font-size: 16px; color: black;" class="col-sm-3 col-form-label">Add New Application To The List:</label>
					    <div class="col-sm-7">
					      <input type="text" class="form-control" id="apName" placeholder="Application Name(EG: www.ABCApp.com)">
					    </div>
					     <div class="col-sm-2">
					    	<button type="button" id="RequestBtn" class="btn btn-warning">Raise Request</button>
					    </div>
					  </div>
				<!-- /1 St part -->
				<hr>
				<!-- 2nd part -->
					<h3>All Listed Applications here</h3>
					<div>
					<input type="text" id="myInput" onkeyup="myFunction1()" placeholder="Search for Application names.." title="Type in a name">
					<table style="width:100%; border: none;" id="myTable">
					  <tr>
					    <th>Application Id</th>
					    <th>Application Name</th>
					    <th>Application Status</th>
					    <th>Raise Request</th>
					  </tr>
					  <%
				         try {
				        	
				         	Connection connection = Connections.getConnection();
				         	Statement statement = connection.createStatement();
				         	HttpSession sessions=request.getSession(false);  
							String userID=(String)sessions.getAttribute("LoginID");
							
							int UID = Integer.parseInt(userID);
							System.out.println("Hello : "+UID);
				         	resultset = statement.executeQuery(Queries.getAppNameWithStatus(UID));
				         	System.out.println("Query : " + Queries.getAppNameWithStatus(UID) );
				         	while (resultset.next()) {
				         %>
					  <tr style="border: none;">
					    <td class="appId"><%=resultset.getInt(1)%></td>
					    <td class="apNm"><%=resultset.getString(2)%></td>
					    <td><%=resultset.getString(3)%></td>
					    <td><button type="button" id="reqs" class="btn btn-warning xx"><i class="fa fa-question-circle" aria-hidden="true"></i></button></td>
					  </tr>
					  <%
				            }
				         } catch (Exception e) {
					         	out.println("wrong entry" + e);
					         }
				            %>
					</table>
					
					</div>
				<!-- 2nd part -->
			  </div>
			  <script>
			  $(document).ready(function() {
				    $('.js-example-basic-multiple').select2();
				});
			  </script>
				<div class="tab-pane" id="2">
          			<h3 style="color:blue">Manage Application : Application View</h3>
				  <!-- 1 St part -->
	          			<div class="form-group row">
	          			<label style="font-size: 16px; color: black;" class="col-sm-3 col-form-label">Select An Application Name:</label>
	          			<div class="col-sm-7">
	          				 <select class="js-example-basic-multiple" style="width: 965px;" id="apps" name="states[]" aria-placeholder="Select Test Case">
	          				 <option value="#" selected disabled>Select Your Application</option> 
	          				 	<%
							         try {
							        	
							         	Connection connection = Connections.getConnection();
							         	Statement statement = connection.createStatement();
							         	HttpSession sessions=request.getSession(false);  
										String userID=(String)sessions.getAttribute("LoginID");
										
										int UID = Integer.parseInt(userID);
							         	resultset = statement.executeQuery(Queries.getAllApplications(UID));
							         	while (resultset.next()) {
							         %>
	          				 
                                   <option value="<%=resultset.getInt(2)%>"><%=resultset.getString(1)%></option>
                                   <%
							            }
							         } catch (Exception e) {
								         	out.println("wrong entry" + e);
					        		 }
				            		%>
                             </select>
                             </div>
                             <div class="col-sm-2">
						    	<button type="button" id="xy" class="btn btn-warning">Check Existing Test Cases</button>
						    </div>
						  </div>
						  <div class="form-group row">
						    <label for="inputPassword" style="font-size: 16px; color: black;" class="col-sm-3 col-form-label">Add A Test Case Name For The Selected Application:</label>
							    <form action="AddTestcaseController" method="POST">
							    <div class="col-sm-7">
							      <input type="text" class="form-control" id="tcnm" placeholder="Test Case Name">
							    </div>
							     <div class="col-sm-2">
							    	<button type="button" style="width:192px" id="tcsm" class="btn btn-warning">Create Test Case</button>
							    </div>
						    	</form>
						    <br>
						 
						    <div class="col-sm-12">
						    <h3 style="color:blue">Drag And Drop Application Name And Test Case(.xlsx format only)</h3>
						    	<form action="UploadFileController" method="POST" class="dropzone" id="my-awesome-dropzone" enctype="multipart/form-data"></form>
						    </div>
						  </div>
					<!-- /1 St part -->
					<hr>
					 <h3 style="color:blue">All Test Cases Related To  </h3>
					<div>
					<input type="text" id="myInput11" class="inpt" onkeyup="myFunction()" placeholder="Search by User names.." title="Type in a name">
					<table style="width:100%; border: none;" class="tab" id="myTable11">
					<thead>
					  <tr>
					    <th>Test Case Id</th>
					    <th>Test Case Name</th>
					    <th>Created By</th>
					    <th>Creation or Updation Time</th>
					    <th>Edit Or Delete</th>
					  </tr>
					  </thead>
					  <tbody class="tabs">
					  </tbody>
					  
					</table>
					
					</div>
				</div>
			</div>
  </div>
<!-- Classic tabs -->
	</section>
</section>
<script>
// When the user scrolls down 20px from the top of the document, slide down the navbar
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("navbar").style.top = "0";
  } else {
    document.getElementById("navbar").style.top = "-50px";
  }
}
</script>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput11");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable11");
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
function myFunction1() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
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

<jsp:include page="Contents/DashboardGeneralFooter.jsp" />