<div class="container" >
    <div class="row">
        <!--Edit Modal Start-->
        <div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="editModalLabel">Update Note</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="editNote">

                    </div>
                </div>
            </div>
        </div>
        <!--Edit Modal End-->
        <!--View Modal Start-->
        <div class="modal fade" id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="detailModalLabel">Note Details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="viewNote">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--View Modal End-->
    </div>

    <div class="row d-flex justify-content-center">
        <div class="col-3">
            <g:if test="${subjects}">
                <g:select class="form-select fs-4 mb-3" id="subjectList" name="subjectId" from="${subjects}" optionKey="id" optionValue="name" data-semester-id="${semesterId}" noSelection="['':'Select Subject']" Required="true"/>
            </g:if>
        </div>
    </div>

    <div class="row mt-4" id="notesContainer">
        <g:render template="show"/>
    </div>
</div>


<script>
    $(document).ready(function() {
        // Event delegation for view buttons within #notesContainer
        $('#notesContainer').on('click', '.viewBtn', function() {
            let noteId = $(this).data('note-id');
            $.ajax({
                url: "${createLink(controller:'note', action:'details')}",
                type: "GET",
                data: { id: noteId },
                success: function(response) {
                    $('#viewNote').html(response);
                    $('#detailModal').modal('show');
                    console.log('Controller action called successfully.');
                },
                error: function(xhr, status, error) {
                    console.error('Error calling controller action:', error);
                }
            });
        });

        // Event delegation for edit buttons within #notesContainer
        $('#notesContainer').on('click', '.editBtn', function() {
            let noteId = $(this).data('note-id');
            let semesterId = $(this).data('semester-id');
            $.ajax({
                url: "${createLink(controller:'note', action:'edit')}",
                type: "POST",
                data: { noteId: noteId, semId: semesterId },
                success: function(response) {
                    $('#editNote').html(response);
                    $('#editModal').modal('show');
                    console.log('Controller action called successfully.');
                },
                error: function(xhr, status, error) {
                    console.error('Error calling controller action:', error);
                }
            });
        });

        $('#subjectList').change(function () {
            let selectedValue = $(this).val();
            let semId = $(this).data('semester-id');
            $.ajax({
                url: '${createLink(controller: 'note', action: 'getNotes')}',
                type: 'POST',
                data: { subjectId: selectedValue, semesterId: semId },
                success: function (response) {
                    $('#notesContainer').html(response);
                    console.log('Controller action called successfully.');
                    // No need to re-attach event handlers manually since we're using event delegation
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        });
    });
</script>