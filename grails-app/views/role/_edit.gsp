
<!-- Modal -->
<div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editModalLabel">Update Role</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form action="update" id="${role.id}">
                    <div class="mb-3">
                        <label class="form-label">
                            <input type="hidden" name="id" value="${role.id}" disabled/>
                            <input type="text" class="form-control" name="authority" value="${role.authority}" placeholder="Enter Authority">
                        </label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>