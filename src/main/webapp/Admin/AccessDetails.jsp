<jsp:include page="Contents/AdminHeaderContent.jsp" />
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
<p class="home"><a href="#">Home</a> > <strong>User Application Access Details</strong></p>
<br>

<table id="example" class="display" style="width:100%; height:700px">
        <thead>
            <tr>
            	<th>ID</th>
                <th>Application Name</th>
                <th>User Id</th>
                <th>Revoke Access Access</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Tiger Nixon</td>
                <td>System Architect</td>
                <td>Edinburgh</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Ashton Cox</td>
                <td>Junior Technical Author</td>
                <td>San Francisco</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Cedric Kelly</td>
                <td>Senior Javascript Developer</td>
                <td>Edinburgh</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Airi Satou</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Brielle Williamson</td>
                <td>Integration Specialist</td>
                <td>New York</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Herrod Chandler</td>
                <td>Sales Assistant</td>
                <td>San Francisco</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Rhona Davidson</td>
                <td>Integration Specialist</td>
                <td>Tokyo</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Colleen Hurst</td>
                <td>Javascript Developer</td>
                <td>San Francisco</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Sonya Frost</td>
                <td>Software Engineer</td>
                <td>Edinburgh</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Jena Gaines</td>
                <td>Office Manager</td>
                <td>London</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Quinn Flynn</td>
                <td>Support Lead</td>
                <td>Edinburgh</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Charde Marshall</td>
                <td>Regional Director</td>
                <td>San Francisco</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Haley Kennedy</td>
                <td>Senior Marketing Designer</td>
                <td>London</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            <tr>
                <td>Tatyana Fitzpatrick</td>
                <td>Regional Director</td>
                <td>London</td>
                <td> <button type='button' onClick='opener(this);' id='opener' class='btn btn-warning'>Revoke User Access <i class="fas fa-user-slash"></i></button></td>
            </tr>
            
        </tbody>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>ACTION</th>
            </tr>
        </tfoot>
    </table>
    </body>
    </html>