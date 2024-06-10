<g:form controller="question" action="save" method="POST" enctype="multipart/form-data">
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
                    <input type="number" class="form-control" id="floatingNumber" name="year" placeholder="Enter Year">
                    <label for="floatingNumber">Past Year</label>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" name="name" id="floatingInput" placeholder="Enter Question Name">
                    <label for="floatingInput">Question Name</label>
                </div>
            </div>

        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="file" class="form-control" id="floatingFile" name="fileUpload" placeholder="Choose Files">
                    <label for="floatingFile">Choose Question</label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit"  class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    </div>
</g:form>