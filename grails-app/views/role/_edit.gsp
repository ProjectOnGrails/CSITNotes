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