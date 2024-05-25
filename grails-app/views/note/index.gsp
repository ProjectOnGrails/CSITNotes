
<div class="modal-body" id="viewNote"></div>
<div class="modal-body" id="editNote"></div>

<g:if test="${subjects}">
    <g:select id="subjectList" name="subjectId" from="${subjects}" optionKey="id" optionValue="name" data-semester-id="${semesterId}" noSelection="['':'Select Subject']" Required="true"/>
</g:if>
<g:else>
    <p>No subjects available.</p>
</g:else>


<div class="container mt-5" id="notesContainer">
    <h3>Notes</h3>
    <g:render template="show"/>
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