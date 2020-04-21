<!-- </section> -->
		<!-- js placed at the end of the document so the pages load faster -->
		<script src="resources/lib/jquery/jquery.min.js"></script>
		<script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
		<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
		<script class="include" type="text/javascript"
			src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
		<script src="resources/lib/jquery.scrollTo.min.js"></script>
		<script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="resources/lib/jquery.sparkline.js"></script>
		<!--common script for all pages-->
		<script src="resources/lib/common-scripts.js"></script>
		<script type="text/javascript" src="resources/lib/gritter/js/jquery.gritter.js"></script>
		<script type="text/javascript" src="resources/lib/gritter-conf.js"></script>
		<!--script for this page-->
		<script src="resources/lib/sparkline-chart.js"></script>
		<script src="resources/lib/zabuto_calendar.js"></script>
		
		<script type="text/javascript">
         $(document).ready(function() {
         $('.js-example-basic-multiple').select2();
         });
         
      </script>
		<script type="text/javascript">
         $("#e1").select2();
            
      </script>
		<script type="application/javascript">
         $(document).ready(function() {
           $("#date-popover").popover({
             html: true,
             trigger: "manual"
           });
           $("#date-popover").hide();
           $("#date-popover").click(function(e) {
             $(this).hide();
           });
         
           $("#my-calendar").zabuto_calendar({
             action: function() {
               return myDateFunction(this.id, false);
             },
             action_nav: function() {
               return myNavFunction(this.id);
             },
             ajax: {
               url: "show_data.php?action=1",
               modal: true
             },
             legend: [{
                 type: "text",
                 label: "Special event",
                 badge: "00"
               },
               {
                 type: "block",
                 label: "Regular event",
               }
             ]
           });
         });
         
         function myNavFunction(id) {
           $("#date-popover").hide();
           var nav = $("#" + id).data("navigation");
           var to = $("#" + id).data("to");
           console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
         }
      </script>
		<script type="text/javascript"
			src="resources/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
		<script type="text/javascript"
			src="resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script type="text/javascript"
			src="resources/lib/bootstrap-daterangepicker/date.js"></script>
		<script type="text/javascript"
			src="resources/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
		<script type="text/javascript"
			src="resources/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript"
			src="resources/lib/bootstrap-daterangepicker/moment.min.js"></script>
		<script type="text/javascript"
			src="resources/lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
		<script src="resources/lib/advanced-form-components.js"></script>
</body>
</html>