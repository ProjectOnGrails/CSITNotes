<div class="container">
    <div class="row">
        <!--Edit Modal Start-->
        <div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="editModalLabel">Update Question</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="editQuestion">
                    </div>
                </div>
            </div>
        </div>
        <!--Edit Modal End-->

        <!--View Modal End-->
        <div id="viewQuestion"></div>
        <!--View Modal End-->

    </div>
    <div class="row">
        <g:render template="show"/>
    </div>
</div>

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
