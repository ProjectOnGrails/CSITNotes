<h1>NoteUser List</h1>
<div class="table-responsive mt-3">
    <table id="myTable" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${noteUsers}" var="temp">
            <tr>
                <th scope="row">${temp.id}</th>
                <td>${temp.fullName}</td>
                <td>${temp.gender}</td>
                <td>${temp.email}</td>
                <td class="text-center">
                    <g:link action="details" class="btn btn-success mr-3 viewBtn" data-bs-toggle="modal" data-user-id="${temp.id}">View</g:link>
                </td>
            </tr>
        </g:each>
        <!-- Add more rows as needed -->
        </tbody>
    </table>
</div>