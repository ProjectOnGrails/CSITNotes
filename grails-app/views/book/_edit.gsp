<g:form action="update" enctype="multipart/form-data" id="${bookInstance.id}">
    <input type="hidden" name="id" value="${bookInstance.id}" />

    <div class="md-6">
        <label class="form-label">
            <select id="selectSemester" name="semester">
                <option value="">Select Semester</option>
                <g:each in="${semesters}" var="semester">
                    <option value="${semester.id}" ${semester.id == bookInstance.subject.semester.id ? 'selected' : ''}>${semester.name}</option>
                </g:each>
            </select>
        </label>
    </div>

    <div class="mb-6" id="selectSubject">
        <label class="form-label">
            <select name="subject">
                <option value="${bookInstance.subject.id}">${bookInstance.subject.name}</option>
                <!-- Options will be dynamically added here -->
            </select>
        </label>
    </div>


    <div class="mb-6">
        <label class="form-label">
            <input type="text" class="form-control" name="name" placeholder="Enter Book Name" value="${bookInstance.name}">
        </label>
    </div>

    <div class="mb-6">
        <label class="form-label">Choose Book:</label>
        <input type="file" class="form-control" name="fileEdit">
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Update</button>
    </div>
</g:form>



<script>
    $(document).ready(function() {
        $("#selectSemester").change(function() {
            let semesterId = $(this).val(); // Get the selected semester ID
            $.ajax({
                url: "${createLink(controller:'book',action:'getSubjects')}",
                type: "post",
                data: {id: semesterId},
                success: function(response) {
                    $('#selectSubject').html(response);
                    console.log('Controller action called successfully.');
                },
                error: function(xhr, status, error) {
                    console.error('Error calling controller action:', error);
                }
            });
        });
    });
</script>
