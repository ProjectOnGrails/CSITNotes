<div class="table-responsive mt-3">
    <table id="myTable" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Authority</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${roles}" var="role">
            <tr>
                <td>${role.authority}</td>
                <td class="text-center">
                    <g:link action="edit" class="btn btn-success mr-3 editBtn" data-bs-toggle="modal" data-role-id="${role.id}">Update</g:link>
                    <g:link action="delete" id="${role.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this role?')">Delete</g:link>
                </td>
            </tr>
        </g:each>
        <!-- Add more rows as needed -->
        </tbody>
    </table>
</div>