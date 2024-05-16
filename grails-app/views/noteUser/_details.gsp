
<!-- Modal -->
<div class="modal fade" id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="detailModalLabel">NoteUser Details</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div><strong>ID:</strong> ${userInstance.id}</div>
                        <div><strong>Full Name:</strong> ${userInstance.fullName}</div>
                        <div><strong>Gender:</strong> ${userInstance.gender}</div>
                        <div><strong>Email:</strong> ${userInstance.email}</div>
                        <div><strong>Username:</strong> ${userInstance.user.username}</div>
                        <div><strong>Phone:</strong> ${userInstance.phone}</div>
                        <div><strong>Authority:</strong> ${userInstance.user.authorities.authority}</div>
                    </div>
                </div>
                <g:link action="edit" class="btn btn-success mr-3 editBtn" data-bs-toggle="modal" data-user-id="${userInstance.id}">Update</g:link>
                <g:link action="delete" id="${userInstance.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this User?')">Delete</g:link>

            </div>
        </div>
    </div>
</div>
