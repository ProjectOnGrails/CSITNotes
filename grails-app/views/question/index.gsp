
<div class="modal-body" id="editQuestion"></div>
<g:render template="show"/>
<div class="modal-body" id="viewQuestion"></div>

<script>
    $('.viewBtn').click(function() {
        let questionId = $(this).data('question-id');
        $.ajax({
            url: "${createLink(controller:'question', action:'details')}",
            type: "GET",
            data: { id: questionId },
            success: function(response) {
                $('#viewQuestion').html(response);
                $('#detailModal').modal('show');
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

    $('.editBtn').click(function() {
        let questionId = $(this).data('question-id');
        let semesterId = $(this).data('semester-id');
        $.ajax({
            url: "${createLink(controller:'question', action:'edit')}",
            type: "POST",
            data: { queId: questionId,semId:semesterId},
            success: function(response) {
                $('#editQuestion').html(response);
                $('#editModal').modal('show');
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });
</script>