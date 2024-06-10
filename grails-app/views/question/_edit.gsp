<g:form action="update" enctype="multipart/form-data">
    <div class="container">
        <!-- Hidden field to pass semesterId -->
        <input type="hidden" name="semesterId" value="${semesterId}" />
        <input type="hidden" name="id" value="${questionInstance.id}" />
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <g:select class="form-select" name="subject" id="floatingSelect" from="${subjects}" optionKey="id" optionValue="name" value="${questionInstance.subject.id}"/>
                    <label for="floatingSelect">Select Subject</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <input type="number" class="form-control" id="floatingNumber" name="year" placeholder="Enter Year" value="${questionInstance.year}">
                    <label for="floatingNumber">Past Year</label>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" name="name" id="floatingInput" value="${questionInstance.name}" placeholder="Enter Question Name">
                    <label for="floatingInput">Question Name</label>
                </div>
            </div>

        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="file" class="form-control" id="floatingFile" name="fileEdit" placeholder="Choose Files">
                    <label for="floatingFile">Choose Question</label>
                </div>
            </div>
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Update</button>
    </div>
</g:form>



