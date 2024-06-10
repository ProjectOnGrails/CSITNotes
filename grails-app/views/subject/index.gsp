<div class="container">
    <div class="row">
        <!-- Edit Modal Start -->
        <div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="editModalLabel">Update Subject</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="editSubject">
                    </div>
                </div>
            </div>
        </div>
        <!-- Edit Modal End -->
        <!-- View Modal Start -->
        <div class="modal fade" id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="card">
                            <div class="card-header">
                                Subject Information
                            </div>
                            <div class="card-body" id="viewSubject">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- View Modal End -->
    </div>

    <div class="row">
        <g:render template="show"/>
    </div>
</div>



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