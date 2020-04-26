<jsp:include page="Contents/AdminHeaderContent.jsp" />
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function() {
    $('#example').DataTable();
    
    $('#apper').click(function(event) {
 	    var ap = $("input#exampleInputEmail1").val();
 	    if (ap == '') {
			alert("Application Name Can Not Remain Blank.")
		}else {
			 $.get('../AdminAddAppController', {
	 	            apNM : ap,
	 	    }, function(response) {
	 	    	alert($('#pqId').val());
	 	    	$("input[type='hidden']").remove();
	 	    });
		}
 	   
     });
    
} );
</script>
<p class="home"><a href="#">Home</a> > <strong> Add Applications</strong></p>
<br>
<form>
  <div class="form-group">
    <label for="exampleInputEmail1">Add Application</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Application">
    <small id="emailHelp" class="form-text text-muted">This Application will be created but, User has to raise request to use it.</small>
  </div>
  <button type="submit" id="apper" class="btn btn-primary">Submit Your Application</button>
</form>
<br>
<table id="example" class="display" style="width:100%; height:700px">
        <thead>
            <tr>
            	<th>Application ID</th>
                <th>Application Name</th>
                <th>Application Created By</th>
                <th>Application Creation Time</th>
                <th>Delete An Application</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Tiger Nixon</td>
                <td>System Architect</td>
                <td>Edinburgh</td>
                <td>2011/04/25</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>2011/07/25</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Ashton Cox</td>
                <td>Junior Technical Author</td>
                <td>San Francisco</td>
                <td>2009/01/12</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Cedric Kelly</td>
                <td>Senior Javascript Developer</td>
                <td>Edinburgh</td>
                <td>2012/03/29</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Airi Satou</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>2008/11/28</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Brielle Williamson</td>
                <td>Integration Specialist</td>
                <td>New York</td>
                <td>2012/12/02</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Herrod Chandler</td>
                <td>Sales Assistant</td>
                <td>San Francisco</td>
                <td>2012/08/06</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Rhona Davidson</td>
                <td>Integration Specialist</td>
                <td>Tokyo</td>
                <td>2010/10/14</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Colleen Hurst</td>
                <td>Javascript Developer</td>
                <td>San Francisco</td>
                <td>2009/09/15</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Sonya Frost</td>
                <td>Software Engineer</td>
                <td>Edinburgh</td>
                <td>2008/12/13</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Jena Gaines</td>
                <td>Office Manager</td>
                <td>London</td>
                <td>2008/12/19</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Quinn Flynn</td>
                <td>Support Lead</td>
                <td>Edinburgh</td>
                <td>2013/03/03</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Charde Marshall</td>
                <td>Regional Director</td>
                <td>San Francisco</td>
                <td>2008/10/16</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Haley Kennedy</td>
                <td>Senior Marketing Designer</td>
                <td>London</td>
                <td>2012/12/18</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <tr>
                <td>Tatyana Fitzpatrick</td>
                <td>Regional Director</td>
                <td>London</td>
                <td>2010/03/17</td>
                <td><button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Edit AppName <i class="fas fa-edit"></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'>Delete Application <i class="fas fa-trash-alt"></i></button></td>
            </tr>
            
        </tbody>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Start date</th>
                <th>ACTIONS</th>
            </tr>
        </tfoot>
    </table>
    </body>
    </html>