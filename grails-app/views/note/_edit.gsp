<g:form action="update" enctype="multipart/form-data" id="${noteInstance.id}">
    <div class="container">
        <!-- Hidden field to pass semesterId -->
        <input type="hidden" name="semesterId" value="${semesterId}" />
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <g:select class="form-select" name="subject" id="floatingSelect" from="${subjects}" optionKey="id" optionValue="name" value="${noteInstance.subject.id}"/>
                    <label for="floatingSelect">Select Subject</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" name="name" id="floatingInput" value="${noteInstance.name}" placeholder="Enter Note Name">
                    <label for="floatingInput">Note Name</label>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="file" class="form-control" id="floatingFile" name="fileEdit" multiple placeholder="Choose Files">
                    <label for="floatingFile">Choose Files</label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Update</button>
    </div>
</g:form>


