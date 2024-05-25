
<div class="modal-body" id="viewSubject"></div>
<div class="modal-body" id="editSubject"></div>

<g:render template="show"/>


<script>
    $('.viewBtn').click(function() {
        let subId = $(this).data('subject-id');
        $.ajax({
            url: "${createLink(controller:'subject', action:'details')}",
            type: "GET",
            data: { id: subId },
            success: function(response) {
                $('#viewSubject').html(response);
                $('#detailModal').modal('show');
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

    $('.editBtn').click(function() {
        let subjectId = $(this).data('subject-id');
        let semesterId = $(this).data('semester-id');
        $.ajax({
            url: "${createLink(controller:'subject', action:'edit')}",
            type: "POST",
            data: { id: subjectId,semesterId:semesterId },
            success: function(response) {
                $('#editSubject').html(response);
                $('#editModal').modal('show');
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });
</script>