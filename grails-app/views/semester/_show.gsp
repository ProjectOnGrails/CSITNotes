<h1>Semesters List</h1>
<div class="table-responsive mt-3">
    <table id="myTable" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>OderNumber</th>
            <th>Name</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${semesters}" var="temp">
            <tr>
                <th scope="row">${temp.id}</th>
                <td>${temp.orderNumber}</td>
                <td>${temp.name}</td>
                <td class="text-center">
                    <g:link action="edit" class="btn btn-success mr-3 editBtn" data-bs-toggle="modal" data-semester-id="${temp.id}">Update</g:link>
                    <g:link action="delete" id="${temp.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this semester?')">Delete</g:link>
                </td>
            </tr>
        </g:each>
        <!-- Add more rows as needed -->
        </tbody>
    </table>
</div>