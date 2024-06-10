<div class="table-responsive mt-3">
    <table id="myTable" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Full Name</th>
            <th>Gender</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${noteUsers}" var="temp">
            <tr>
                <td>${temp.fullName}</td>
                <td>${temp.gender}</td>
                <td>${temp.user.authorities.authority}</td>
                <td class="text-center">
                    <g:link class="btn btn-primary mr-2 viewBtn" data-bs-toggle="modal" data-user-id="${temp.id}">
                        <i class="bi bi-eye-fill"></i>
                    </g:link>
                    <g:link class="btn btn-success mr-2 editBtn" data-bs-toggle="modal" data-user-id="${temp.id}">
                        <i class="bi bi-pencil-square"></i>
                    </g:link>
                    <g:link action="delete" params="[id: temp.id]" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this User?')">
                        <i class="bi bi-trash3-fill"></i>
                    </g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>