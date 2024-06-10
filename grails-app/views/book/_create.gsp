<g:form action="save" method="POST" enctype="multipart/form-data">

    <div class="md-6">
        <label class="form-label">
            <select id="semesterSelect">
                <option value="">Select Semester</option>
                <g:each in="${semesters}" var="semester">
                    <option value="${semester.id}">${semester.name}</option>
                </g:each>
            </select>
        </label>
    </div>

    <div id="showSubject"></div>

    <div class="mb-6">
        <label class="form-label">
            <input type="text" class="form-control" name="name" placeholder="Enter Book Name">
        </label>
    </div>

    <div class="mb-6">
        <label class="form-label">Choose Books
            <input type="file" class="form-control" name="fileUpload">
        </label>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit"  class="btn btn-primary">Save</button>
    </div>
</g:form>

<script>
    $(document).ready(function() {
        $("#semesterSelect").change(function() {
            let semesterId = $(this).val(); // Get the selected semester ID
            $.ajax({
                url: "${createLink(controller:'book',action:'getSubjects')}",
                type: "post",
                data: {id: semesterId},
                success: function(response) {
                    $('#showSubject').html(response);
                    console.log('Subject options rendered successfully.');
                },
                error: function(xhr, status, error) {
                    console.error('Error calling controller action:', error);
                }
            });
        });
    });
</script>

