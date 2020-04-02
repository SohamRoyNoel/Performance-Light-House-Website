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
         
        	 // get application name
         $('#applicationName').change(function(event) {	
                 var applicationname = $("select#applicationName").val();
                 
                 $.get('PageController', {
                	 ApplicationName : applicationname
                 }, function(response) {
         
                 var select = $('#page');
                 select.find('option').remove();
                   $.each(response, function(index, value) {
                   $('<option>').val(index).text(value).appendTo(select);
               });
                 });
                 });
           
         // Get the Test Scenerio of choosen state
         $('#page').click(function(event) {
         	    var pageNO = $("select#page").val();
         	    //alert(pageNO);
         	    $.get('TestCaseController', {
         	            pgNo : pageNO
         	    }, function(response) {
         	
         	    var select = $('#testCases');
         	    select.find('option').remove();
         	      $.each(response, function(index, value) {
         	      $('<option>').val(index).text(value).appendTo(select);
         	  });
         	    });
             });
         
         $('#btns1').click(function(event) {	
        	 
             var applicationname = $("select#applicationName").val();
             var pageNO = $("select#page").val();
             var testCsNO = $("select#testCases").val();
             var dtStart = $("input#start").val();
             var dtEnd = $("input#end").val();
             
             // Navigation
	             $.get('NavigationGraphController', {
					appNM : applicationname, pgNo : pageNO,tcNo : testCsNO, dts : dtStart,dte : dtEnd,
		  	    }, function(response) {
		  	    	// alert("dick");
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
						appNM : applicationname, pgNo : pageNO,tcNo : testCsNO, dts : dtStart,dte : dtEnd,
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
								<script type="text/javascript">
                                    FusionCharts.ready(function() {
                                    var revenueChart = new FusionCharts({
                                      type: 'scrollColumn2d',
                                      renderAt: 'charter-container',
                                      width: '1180',
                                      height: '330',
                                      dataFormat: 'json',
                                      dataSource: {
                                        "chart": {
                                          "theme": "fusion",
                                          "yaxisname": "Loading Times (MiliSeconds)",
                                          "showvalues": "1",
                                          "placeValuesInside": "1",
                                          "rotateValues": "1",
                                          "valueFontColor": "#ffffff",
                                          "numberprefix": "",
                                          //number of visible plots
                                          "numVisiblePlot": "15",
                                          "showLabels": "0",
                                          //Cosmetics
                                          "labeldisplay": "WRAP",
                                          "linethickness": "3",
                                          "scrollheight": "10",
                                          "flatScrollBars": "1",
                                          "scrollShowButtons": "0",
                                          "scrollColor": "#cccccc",
                                          "showHoverEffect": "1"
                                        },
                                        "categories": [{
                                          "category": [{
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.png"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            },
                                            {
                                              "label": "https://mvnrepository.com/assets/images/6a606fcf7b8526f25d1fc9b3fe8f39ad-growth.jpg"
                                            }
                                          ]
                                        }],
                                        "dataset": [{
                                          "data": [{
                                              "value": "15"
                                            },
                                            {
                                              "value": "29"
                                            },
                                            {
                                              "value": "25"
                                            },
                                            {
                                              "value": "26"
                                            },
                                            {
                                              "value": "29"
                                            },
                                            {
                                              "value": "32"
                                            },
                                            {
                                              "value": "31"
                                            },
                                            {
                                              "value": "31"
                                            },
                                            {
                                              "value": "31"
                                            },
                                            {
                                              "value": "37"
                                            },
                                            {
                                              "value": "31"
                                            },
                                            {
                                              "value": "31"
                                            },
                                            {
                                              "value": "31"
                                            },
                                            {
                                              "value": "36"
                                            },
                                            {
                                              "value": "45"
                                            },
                                            {
                                              "value": "33"
                                            },
                                            {
                                              "value": "36"
                                            },
                                            {
                                              "value": "32"
                                            },
                                            {
                                              "value": "37"
                                            },
                                            {
                                              "value": "38"
                                            },
                                            {
                                              "value": "35"
                                            },
                                            {
                                              "value": "23"
                                            },
                                            {
                                              "value": "33"
                                            },
                                            {
                                              "value": "38"
                                            }
                                          ]
                                        }]
                                      }
                                    });
                                    
                                    revenueChart.render();
                                    });
                                    
                                 </script>
								<div style="width: 1000px" id="charter-container"></div>
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
										<option value="">Select Page Name</option>
									</select>
								</div>
							</td>
						</tr>
						<tr style="height: 70px;">
							<td>
								<div style="font-family: 'Courier New', Courier, monospace;">
									Select Test Cases
									 <select id="testCases" class="js-example-basic-multiple" style="width: 350px;" name="states[]" aria-placeholder="Select Test Case">
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
							<script type="text/javascript">
                                 FusionCharts.ready(function(){
                                     var chartObj = new FusionCharts({
                                   type: 'scrollbar2d',
                                   renderAt: 'chart-containers',
                                   width: '600',
                                   height: '455',
                                   dataFormat: 'json',
                                                        bgcolor: 'sky',
                                   dataSource: {
                                       "chart": {
                                           "theme": "fusion",
                                           "subCaption": "",
                                           "plottooltext": "$datavalue Miliseconds",
                                           "YAxisname": "Webpage Loading Time(MiliSeconds)",
                                           "XAxisname": "",
                                       },
                                       "categories": [{
                                           "category": [{
                                                   "label": "https://www.google.com/"
                                               },
                                               {
                                                   "label": "https://www.google.com/el.js"
                                               },
                                               {
                                                   "label": "https://www.google.com/index.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/index1.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/index2.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/indexer.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/indexX.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/dom.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/p.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/json.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/repo.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/mnp.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/abc.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/np.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/mango.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/orange.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/carrot.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/cts.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/tcs.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/NoWork.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/kl.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/ngp.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/pug.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/indexNN.html"
                                               },
                                               {
                                                   "label": "https://www.google.com/Petrol.html"
                                               }
                                 
                                           ]
                                       }],
                                       "dataset": [{
                                           "data": [{
                                                   "value": "79.4205"
                                               },
                                               {
                                                   "value": "98.2197"
                                               },
                                               {
                                                   "value": "62.4172"
                                               },
                                               {
                                                   "value": "30.18247"
                                               },
                                               {
                                                   "value": "36.5028"
                                               },
                                               {
                                                   "value": "98.4878"
                                               },
                                               {
                                                   "value": "29.1784"
                                               },
                                               {
                                                   "value": "11.733"
                                               },
                                               {
                                                   "value": "12.215"
                                               },
                                               {
                                                   "value": "13.8161"
                                               },
                                               {
                                                   "value": "70.888"
                                               },
                                               {
                                                   "value": "77.519"
                                               },
                                               {
                                                   "value": "69.395"
                                               },
                                               {
                                                   "value": "53.1933"
                                               },
                                               {
                                                   "value": "44.3888"
                                               },
                                               {
                                                   "value": "34.090"
                                               },
                                               {
                                                   "value": "25.5188"
                                               },
                                               {
                                                   "value": "21.761"
                                               },
                                               {
                                                   "value": "21.272"
                                               },
                                               {
                                                   "value": "21.511"
                                               },
                                               {
                                                   "value": "12..1149"
                                               },
                                               {
                                                   "value": "13.996"
                                               },
                                               {
                                                   "value": "12.832"
                                               },
                                               {
                                                   "value": "17.422"
                                               },
                                               {
                                                   "value": "12.206"
                                               },
                                 
                                           ]
                                       }]
                                   }
                                 }
                                 );
                                     chartObj.render();
                                 });
                              </script>
							<div id="chart-containers" style="width: 770px; height: 500px;">FusionCharts
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
                                 	data.addColumn('number', 'Best');
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
							<center><div id="columns_div" style="width: 675px; height: 475px;"></div></center>
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