<g:form action="save" method="POST" enctype="multipart/form-data">
    <!-- Hidden field to pass semesterId -->
    <input type="hidden" name="semesterId" value="${semesterId}" />

    <div class="md-6">
        <label class="form-label">
            <input type="hidden" name="semester" value="${semesterId}" />
        </label>
    </div>
    <div class="mb-6">
        <label class="form-label">
            <input type="text" class="form-control" name="code" placeholder="Enter Subject Code">
        </label>
    </div>
    <div class="mb-6">
        <label class="form-label">
            <input type="text" class="form-control" name="name" placeholder="Enter Subject Name">
        </label>
    </div>
    <div class="mb-6">
        <label class="form-label">Choose Picture
            <input type="file" class="form-control" name="picture">
        </label>
    </div>
    <div class="mb-6">
        <label class="form-label">Choose Syllabus
            <input type="file" class="form-control" name="fileUpload">
        </label>
    </div>

    <div class="mb-6">
        <label class="form-label">
            <input type="text" class="form-control" name="description" placeholder="Enter Subject Description">
        </label>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit"  class="btn btn-primary">Save</button>
    </div>
</g:form>