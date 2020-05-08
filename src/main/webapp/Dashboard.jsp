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
   var pageList = 0;
   var pagevalues = null;

   </script>
<script>
         $(document).ready(function() {        	
         
        	 // get page name
         $('#applicationName').change(function(event) {	
                 var applicationname = $("select#applicationName").val();
                 //console.log(applicationname);

                 $.get('PageController', {
                	 ApplicationName : applicationname
                 }, function(response) {               


         
                 var select = $('#page');
                 select.find('option').remove();
                   $.each(response, function(index, value) {
                	pageList = pageList+ ',' + index;
					pagevalues = pagevalues +','+ value;
                   $('<option>').val(index).text(value).appendTo(select);
               });
                 });
                 });
           
         // Get the Test Scenerio of choosen state
         $('#page').click(function(event) {
         	    var pageNO = $("select#page").val();
         	   var applicationname = $("select#applicationName").val();
         	   var pagevalue = document.getElementById('page');
         	    var pagevalue1 = pagevalue.options[pageNO-1].text;
                //console.log("PGval : " + pagevalue1);

                var xy=0;
                var pageIds = null;
                if(pagevalue1 == 'ALL'){
	               	 xy = pageList.substring(2, pageList.length-2);
	               	 
	               	$.get('TestCaseController', {
         	            pgNo : xy, apID:applicationname, pgType:pagevalue1,
         	    }, function(response) {
         	
         	    var select = $('#testCases');
         	    select.find('option').remove();
         	      $.each(response, function(index, value) {
         	      $('<option>').val(index).text(value).appendTo(select);
         	  });
         	    });
                }else{
                	pagevalue1 = 'None';
                	$.get('TestCaseController', {
                		
         	            pgNo : pageNO, apID:applicationname, pgType:pagevalue1,
         	    }, function(response) {
         	
         	    var select = $('#testCases');
         	    select.find('option').remove();
         	      $.each(response, function(index, value) {
         	      $('<option>').val(index).text(value).appendTo(select);
         	  });
         	    });
                }
                
                
                
         	    
                });
         
         $('#btns1').click(function(event) {	
        	 
             var applicationname = $("select#applicationName").val();
             var pageNO = $("select#page").val();
             var pagevalue = document.getElementById('page');
      	    var pagevalue1 = pagevalue.options[pageNO-1].text;
             /*console.log("PGval : " + pagevalue1);
             console.log("PageList : " + pageList);
             console.log("PageValues : " + pagevalues);
             console.log(pageNO);*/
             var xy=0;
             var tcs = 0;
             var pageIds = null;
             var NavGraph = 'NO';
        	 var PgGraph = 'NO';
        	 var elemtGraph = 'NO';
             if(pagevalue1 == 'ALL'){
            	 xy = pageList.substring(2, pageList.length-2);
            	 //console.log("Modified : " + xy);
            	 pageIds = xy.split(',');
            	 NavGraph = 'ALL';
            	 PgGraph = 'ALL';
            	 elemtGraph = 'ALL';
            	 
                	 var tcs = $("select#testCases").val().toString();
                	 //console.log("yammer : "+ tcs);
                     var dtStart = $("input#start").val();
                     var dtEnd = $("input#end").val();
                     //var pageNOs = pageIds[i];
                     // Navigation
                             	            	 //alert(tcs);
        	             $.get('NavigationGraphController', {
        					appNM : applicationname, pgNo : xy,tcNos : tcs, dts : dtStart,dte : dtEnd, flag : NavGraph,
        		  	    }, function(response) {
        		  	    	var x =response;
        		  	    	var arr = [];
        		  	    	$.each(x, function(index, value){
        		  	    	  var x = `${value}`;
        		  	    	  arr.push(x);
        		  	    	  
        		  	    	});
        		  	    	
        		  	    	// output array
        		  	    	var Nav_TTFB =arr.pop();
        		  	    	var Nav_RedirectEvent =arr.pop();
        		  	    	var Nav_ContentLoad =arr.pop();
        		  	    	var Nav_Processing =arr.pop();
        		  	    	var Nav_PageLoad =arr.pop();
        		  	    	var Nav_AppCache =arr.pop();
        		  	    	var Nav_UnloadEvent =arr.pop();
        		  	    	var Nav_DomInteractive =arr.pop();
        		  	    	var Nav_DomComplete =arr.pop();
        		  	    	
        		  	    	drawBasics(Nav_TTFB, Nav_RedirectEvent, Nav_ContentLoad, Nav_Processing, Nav_PageLoad, Nav_AppCache, Nav_UnloadEvent, Nav_DomInteractive, Nav_DomComplete);   	
        		  	    });
        	             
                     
        	          // Page Load Time
        	             $.get('PageLoadGraphController', {
        						appNM : applicationname, pgNo : xy,tcNo : tcs, dts : dtStart,dte : dtEnd, flag : PgGraph,
        			  	    }, function(response) {
        			  	    	var x =response;
        			  	    	var arr = [];
        			  	    	$.each(x, function(index, value){
        			  	    	  var x = `${value}`;
        			  	    	  arr.push(x);
        			  	    	  
        			  	    	});
        			  	    	
        			  	    	// output array
        			  	    	var avg =arr.pop();
        			  	    	var min =arr.pop();
        			  	    	var max =arr.pop();
        			  	    	
        			  	    	drawBasicss(max, min, avg);   	
        			  	    });
        	          
        	          // Element Wise Loading Time
        	            $.get('ElementLoadingTimeGraphController', {
        						appNM : applicationname, pgNo : xy,tcNo : tcs, dts : dtStart,dte : dtEnd, flag : elemtGraph,
        			  	    }, function(response) {
        			  	    //console.log(JSON.parse(response));
        		      	    	var x = response;
        		      	    	//console.log(x);
        		      	    	var topStores='';
        		      	    	FusionCharts.ready(function(x) {
        		      	    		//var FusionCharts = require('fusioncharts');  
        		      	    		var xx = x;
        		      	    		//console.log(xx);
        		      	    		var revenueChart = new FusionCharts({
        		                      type: 'scrollColumn2d',
        		                      renderAt: 'charter-container',
        		                      width: '1180',
        		                      height: '330',
        		                      dataFormat: 'json',
        		                      dataSource: response                   
        		                      
        		      	    }).render();
        		          });
        			  	    });
        	          
        	         // Page Wise Loading Time
        	            $.get('AllPageLoadGraphController', {
        						appNM : applicationname, pgNo : xy,tcNo : tcs, dts : dtStart,dte : dtEnd, flag : elemtGraph,
        			  	    }, function(response) {
        			  	    //console.log(JSON.parse(response));
        		      	    	var x = response;
        		      	    	//console.log(x);
        		      	    	var topStores='';
        		      	    	FusionCharts.ready(function(x) {
        		      	    		//var FusionCharts = require('fusioncharts');  
        		      	    		var xx = x;
        		      	    		//console.log(xx);
        		      	    		var revenueChart = new FusionCharts({
        		                      type: 'scrollbar2d',
        		                      renderAt: 'charter-containers1',
        		                      width: '600',
        		                      height: '455',
        		                      dataFormat: 'json',
        		                      dataSource: response                   
        		                      
        		      	    }).render();
        		          });
        			  	    });
                 
             }else{
            	 var testCsNO = $("select#testCases").val().toString();
            	 var testLength = testCsNO.length;
            	 //console.log("Ducking length : "+ testLength)
                 var dtStart = $("input#start").val();
                 var dtEnd = $("input#end").val();
                 
                 // Navigation
    	             $.get('NavigationGraphController', {
    					appNM : applicationname, pgNo : pageNO,tcNos : testCsNO, dts : dtStart,dte : dtEnd, flag : NavGraph,
    		  	    }, function(response) {
    		  	    	var x =response;
    		  	    	var arr = [];
    		  	    	$.each(x, function(index, value){
    		  	    	  var x = `${value}`;
    		  	    	  arr.push(x);
    		  	    	  
    		  	    	});
    		  	    	
    		  	    	// output array
    		  	    	var Nav_TTFB =arr.pop();
    		  	    	var Nav_RedirectEvent =arr.pop();
    		  	    	var Nav_ContentLoad =arr.pop();
    		  	    	var Nav_Processing =arr.pop();
    		  	    	var Nav_PageLoad =arr.pop();
    		  	    	var Nav_AppCache =arr.pop();
    		  	    	var Nav_UnloadEvent =arr.pop();
    		  	    	var Nav_DomInteractive =arr.pop();
    		  	    	var Nav_DomComplete =arr.pop();
    		  	    	
    		  	    	drawBasics(Nav_TTFB, Nav_RedirectEvent, Nav_ContentLoad, Nav_Processing, Nav_PageLoad, Nav_AppCache, Nav_UnloadEvent, Nav_DomInteractive, Nav_DomComplete);   	
    		  	    });
    	             
                 
    	          // Page Load Time
    	             $.get('PageLoadGraphController', {
    						appNM : applicationname, pgNo : pageNO,tcNo : testCsNO, dts : dtStart,dte : dtEnd, flag : NavGraph,
    			  	    }, function(response) {
    			  	    	var x =response;
    			  	    	var arr = [];
    			  	    	$.each(x, function(index, value){
    			  	    	  var x = `${value}`;
    			  	    	  arr.push(x);
    			  	    	  
    			  	    	});
    			  	    	
    			  	    	// output array
    			  	    	var avg =arr.pop();
    			  	    	var min =arr.pop();
    			  	    	var max =arr.pop();
    			  	    	
    			  	    	drawBasicss(max, min, avg);   	
    			  	    });
    	          
    	          // Element Wise Loading Time
    	            $.get('ElementLoadingTimeGraphController', {
    						appNM : applicationname, pgNo : pageNO,tcNo : testCsNO, dts : dtStart,dte : dtEnd, flag : NavGraph,
    			  	    }, function(response) {
    			  	    //console.log(JSON.parse(response));
    		      	    	var x = response;
    		      	    	//console.log(x);
    		      	    	var topStores='';
    		      	    	FusionCharts.ready(function(x) {
    		      	    		//var FusionCharts = require('fusioncharts');  
    		      	    		var xx = x;
    		      	    		//console.log(xx);
    		      	    		var revenueChart = new FusionCharts({
    		                      type: 'scrollColumn2d',
    		                      renderAt: 'charter-container',
    		                      width: '1180',
    		                      height: '330',
    		                      dataFormat: 'json',
    		                      dataSource: response                   
    		                      
    		      	    }).render();
    		          });
    			  	    });
    	          
    	         // Page Wise Loading Time
    	            $.get('AllPageLoadGraphController', {
    	            	appNM : applicationname, pgNo : pageNO,tcNo : testCsNO, dts : dtStart,dte : dtEnd, flag : NavGraph,
    			  	    }, function(response) {
    			  	    //console.log(JSON.parse(response));
    		      	    	var x = response;
    		      	    	//console.log(x);
    		      	    	var topStores='';
    		      	    	FusionCharts.ready(function(x) {
    		      	    		//var FusionCharts = require('fusioncharts');  
    		      	    		var xx = x;
    		      	    		//console.log(xx);
    		      	    		var revenueChart = new FusionCharts({
    		                      type: 'scrollbar2d',
    		                      renderAt: 'charter-containers1',
    		                      width: '600',
    		                      height: '455',
    		                      dataFormat: 'json',
    		                      dataSource: response                   
    		                      
    		      	    }).render();
    		          });
    			  	    });
             }
             
             
             
             
             
             
             });
         });
		 
      </script>




<!--sidebar start-->
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
<!--sidebar end-->
<!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<!--CUSTOM CHART START -->
				<div class="border-head" style="width: 1650px;">
					<h3>Performance HighLights</h3>
				</div>
				<div class="custom-bar-chart" style="height: 400px; width: 1200px;">
					<div class="panel panel-primary">
						<div class="panel-heading">Element Wise Average Loading
							Times</div>
						<div class="panel-body">
							<frameset cols="30%, 40%, 30%">
								
								<div style="width: 1000px; height: 330px"  id="charter-container" alt="Data Will be loaded here"><p style="text-align: center; vertical-align: middle; line-height: 275px; column-width: 720px;  ">Data will be loaded here</p></div>
							</frameset>
						</div>
					</div>
				</div>
				<!--custom chart end-->
				<!-- /row -->
			</div>
			<!-- /col-lg-9 END SECTION MIDDLE -->
			<!-- **********************************************************************************************************************************************************
                     RIGHT SIDEBAR CONTENT
                     *********************************************************************************************************************************************************** -->
			<div class="col-lg-3 ds"
				style="margin-top: 85px; height: 400px; width: 388px;">
				<!--COMPLETED ACTIONS DONUTS CHART-->
				<div class="donut-main">
					<h4>Reporting Criteria</h4>
					<table>

						<tr style="height: 70px;">
							<td>
								<div style="font-family: 'Courier New', Courier, monospace;">

									Select Application:&nbsp;
									<%
								         try {
								        	
								         	Connection connection = Connections.getConnection();
								         	Statement statement = connection.createStatement();
								         	resultset = statement.executeQuery(Queries.askApplicationname);
								         %>
										<select id="applicationName" class="btn btn-default" name="ApplicationNameDTO" style="width: 250px;">
										<option>Select Application Name</option>
										<%
							            	while (resultset.next()) {
							            %>
											<option value="<%=resultset.getString(1)%>"><%=resultset.getString(2)%></option>
										<%
								            }
								            %>
									</select>
									<%
								         } catch (Exception e) {
								         	out.println("wrong entry" + e);
								         }
							         %>
								</div>
							</td>
						</tr>
						<span></span>
						<tr style="height: 70px;">
							<td>
								<div style="font-family: 'Courier New', Courier, monospace;">
									<b>Select Web Page</b> 
									<select id="page" class="btn btn-default" style="width: 250px;">
										<option value="" disabled selected>Select Page Name</option>
										
									</select>
								</div>
							</td>
						</tr>
						<tr style="height: 70px;">
							<td>
								<div style="font-family: 'Courier New', Courier, monospace;">
									Select Test Cases
									 <select id="testCases" class="js-example-basic-multiple" style="width: 350px;" name="states[]" multiple="multiple" aria-placeholder="Select Test Case">
												<option value="">Select Test Case Name</option>
									</select>
								</div>
							</td>
						</tr>
						<tr style="height: 80px;">
							<td><b>Select a DateRage To Get More Detailed
									Performance Report</b>
								<div class="input-group input-large" data-date="01/01/2014"
									data-date-format="mm/dd/yyyy">
									<input id="start" type="text" class="form-control dpd1" name="from" placeholder="From Date">
									<span class="input-group-addon"></span>
									<input id="end" type="text" class="form-control dpd2" name="to" placeholder="To Date">
								</div></td>
						</tr>

					</table>
				</div>
				<!--NEW EARNING STATS -->
				<div class="panel terques-chart">
					<button type="submit" id="btns1" type="button" class="btn btn-warning btn-block">Get Analysis</button>
				</div>
				<!--new earning end-->
			</div>
			<!-- /col-lg-3 -->
		</div>
		<!-- /row -->
	</section>
	<div style="margin-left: 25px; margin-top: -60px;">
		<TABLE>
			<tr>
				<td>
					<div class="panel panel-primary">
						<div class="panel-heading">Average Page Rendering Milestones</div>
						<div class="panel-body">
							<script type="text/javascript">
                                 google.charts.load('current', {packages: ['corechart', 'bar']});
                                 google.charts.setOnLoadCallback(drawBasics);
                                 
                                 function drawBasics(Nav_TTFB, Nav_RedirectEvent, Nav_ContentLoad, Nav_Processing, Nav_PageLoad, Nav_AppCache, Nav_UnloadEvent, Nav_DomInteractive, Nav_DomComplete) {
                                	 var nvTT, nvR, nvC, nvP, nvPL, nvAC, nvUE, nvDI, nvDC = 0;
                                	 nvTT = Nav_TTFB;nvR = Nav_RedirectEvent;nvC = Nav_ContentLoad;nvP = Nav_Processing;nvPL = Nav_PageLoad;nvAC = Nav_AppCache;nvUE = Nav_UnloadEvent;nvDI = Nav_DomInteractive;nvDC = Nav_DomComplete;
                                 	var data = new google.visualization.DataTable();
                                 	data.addColumn('string', 'col_name');
                                 	data.addColumn('number', 'Loading Time');
                                 	data.addRows(9);
                                 	data.setCell(0,0,'Nav_TTFB');data.setCell(0,1,nvTT);
                                 	data.setCell(1,0,'Nav_RedirectEvent');data.setCell(1,1,nvR);  
                                 	data.setCell(2,0,'Nav_ContentLoad');data.setCell(2,1,nvC);  
                                 	data.setCell(3,0,'Nav_Processing');data.setCell(3,1,nvP);  
                                 	data.setCell(4,0,'Nav_PageLoad');data.setCell(4,1,nvPL);  
                                 	data.setCell(5,0,'Nav_AppCache');data.setCell(5,1,nvAC);  
                                 	data.setCell(6,0,'Nav_UnloadEvent');data.setCell(6,1,nvUE);  
                                 	data.setCell(7,0,'Nav_DomInteractive');data.setCell(7,1,nvDI);  
                                 	data.setCell(8,0,'Nav_DomComplete');data.setCell(8,1,nvDC);  
                                                                  	
                                 
                                   var options = {
                                      chartArea: {width: '50%'},
                                      hAxis: {
                                        title: '',
                                        minValue: 0
                                      },
                                      vAxis: {
                                        title: ''
                                      }
                                      
                                    };
                                 
                                    var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                                 
                                    chart.draw(data, options);
                                  }
                              </script>
							<div id="chart_div" style="width: 775px; height: 500px;"></div>
						</div>
					</div>
				</td>
				<td style="padding: 30px;">
					<div class="panel panel-primary">
						<div class="panel-heading">Webpage Loading Times</div>
						<div class="panel-body">
							
							<div id="charter-containers1" style="width: 770px; height: 500px;">FusionCharts
								XT will load here!</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="margin-top: 10px;">
					<div class="panel panel-primary">
						<div class="panel-heading">Max, Mean, Min Loading Times (for
							the selected time period)</div>
						<div class="panel-body">
							<script type="text/javascript">
                                 google.charts.load('current', {packages: ['corechart', 'bar']});
                                 google.charts.setOnLoadCallback(drawBasic);
                                 
                                 function drawBasicss(max, min, avg) {
                                 
                                	 var maxx, minn, avgg = 0;
                                	 maxx = max;minn = min;avgg = avg;
                                	 
                                 	var data = new google.visualization.DataTable();
                                 	data.addColumn('string', 'col_name');
                                 	data.addColumn('number', 'Value');
                                 	data.addRows(3);
                                 	data.setCell(0,0,'Best');data.setCell(0,1,minn);
                                 	data.setCell(1,0,'Mean');data.setCell(1,1,avgg);  
                                 	data.setCell(2,0,'Worst');data.setCell(2,1,maxx); 
                                  
                                 
                                    var options = {
                                    		width: 700,
                                            height: 400,
                                            bar: {groupWidth: "55%"},
                                    };
                                 
                                    var chart = new google.visualization.ColumnChart(document.getElementById('columns_div'));
                                 
                                    chart.draw(data, options);
                                  }
                              </script>
							<center><div id="columns_div" style="width: 675px; height: 475px;"><p style="text-align: center; vertical-align: middle; line-height: 410px; column-width: 720px;  ">Data will be loaded here</p></div></center>
						</div>
					</div>
				</td>
				<td style="padding: 30px;">
					<div class="panel panel-primary">
						<div class="panel-heading">Overall Report</div>
						<div class="panel-body">
							<div class="donut-main">
								<div id="barchart_values" style="width: 770px; height: 475px;"></div>
							</div>
							<script type="text/javascript">
                                 google.charts.load("current", {packages:["corechart"]});
                                 google.charts.setOnLoadCallback(drawChart);
                                 function drawChart() {
                                  var data = google.visualization.arrayToDataTable([
                                    ['Genre', 'TestCases 1', 'TestCases 2', 'TestCases 3', 'TestCases 4',
                                    'TestCases 5', 'TestCases 6', { role: 'annotation' } ],
                                    ['TC1', 10, 24, 20, 32, 18, 5, ''],
                                    ['TC2', 16, 22, 23, 30, 16, 9, ''],
                                    ['TC3', 28, 19, 29, 30, 12, 13, '']
                                  ]);

                                  var options = {
                                    width: 700,
                                    height: 480,
                                    legend: { position: 'top', maxLines: 3 },
                                    bar: { groupWidth: '75%' },
                                    isStacked: true
                                  };
                                 
                                  var chart = new google.visualization.BarChart(document.getElementById('barchart_values'));
                                   chart.draw(data, options);
                                 }
                              </script>
						</div>
					</div>
				</td>
			</tr>
		</TABLE>
	</div>
	<!-- </section> -->
</section>
<!--main content end-->
<jsp:include page="Contents/DashboardGeneralFooter.jsp" />