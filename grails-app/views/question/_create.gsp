<g:form action="save" method="POST" enctype="multipart/form-data">

    <!-- Hidden field to pass semesterId -->
    <input type="hidden" name="semesterId" value="${semesterId}" />

    <div class="md-6">
        <g:select from="${subjects}" name="subject" optionKey="id" optionValue="name" noSelection="['':'Select Subject']" Required="true"/>
    </div>
    <br>
    <div class="mb-6">
        <label class="form-label">
            <input type="text" class="form-control" name="name" placeholder="Enter Question Name">
        </label>
    </div>

    <div class="mb-6">
        <label class="form-label">
            <input type="number" class="form-control" name="year" placeholder="Enter Year">
        </label>
    </div>

    <div class="mb-6">
        <label class="form-label">Choose Question
            <input type="file" class="form-control" name="fileUpload">
        </label>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit"  class="btn btn-primary">Save</button>
    </div>
</g:form>