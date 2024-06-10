<g:form action="save" method="POST" enctype="multipart/form-data">
    <div class="container">
        <!-- Hidden field to pass semesterId -->
        <input type="hidden" name="semesterId" value="${semesterId}" />
        <input type="hidden" name="semester" value="${semesterId}" />

        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" name="code" placeholder="Enter Subject Code">
                    <label for="floatingInput">Subject Code</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingName" name="name" placeholder="Enter Subject Name">
                    <label for="floatingName">Subject Name</label>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="form-floating">
                <input type="file" class="form-control" id="floatingPicture" name="picture" placeholder="Choose Picture">
                <label for="floatingPicture">Choose Picture</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="form-floating">
                <input type="file" class="form-control" id="floatingFile" name="fileUpload" placeholder="Choose Files">
                <label for="floatingFile">Choose Syllabus</label>
            </div>
        </div>
        <div class="row">
            <div class="form-floating">
                <textarea class="form-control" name="description" placeholder="Enter Subject Description" id="floatingTextarea"></textarea>
                <label for="floatingTextarea">Subject Description</label>
            </div>
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit"  class="btn btn-primary">Save</button>
    </div>
</g:form>