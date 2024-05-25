<div class="modal fade" id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-header">
                        Question Information
                    </div>
                    <div class="card-body">
                        <p><strong>Question ID:</strong> ${question.id}</p>
                        <p><strong>Question Name:</strong> ${question.name}</p>
                        <p><strong>Question Year:</strong> ${question.year}</p>
                        <p><strong>Subject:</strong> ${question.subject.name}</p>
                        <p><strong>Created Date:</strong> ${question.dateCreated}</p>
                        <p><strong>Created By:</strong> ${question.createdBy}</p>
                        <p><strong>Updated Date:</strong> ${question.lastUpdated}</p>
                        <p><strong>Updated By:</strong> ${question.updatedBy}</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
