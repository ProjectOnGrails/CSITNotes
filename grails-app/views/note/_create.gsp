<g:form controller="note" action="save" method="POST" enctype="multipart/form-data">
    <div class="container">
        <!-- Hidden field to pass semesterId -->
        <input type="hidden" name="semesterId" value="${semesterId}" />
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <g:select class="form-select" from="${subjects}" name="subject" optionKey="id" optionValue="name" id="floatingSelect" Required="true"/>
                    <label for="floatingSelect">Select Subject</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" name="name" id="floatingInput" placeholder="Enter Note Name">
                    <label for="floatingInput">Note Name</label>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="file" class="form-control" id="floatingFile" name="fileUpload" multiple placeholder="Choose Files">
                    <label for="floatingFile">Choose Files</label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit"  class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    </div>
</g:form>