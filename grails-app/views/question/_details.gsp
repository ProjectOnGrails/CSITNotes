<div class="modal fade" id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="detailModalLabel">Update Question</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-header">
                        Question Information
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <p><strong>Question ID:</strong> ${question.id}</p>
                                <p><strong>Question Name:</strong> ${question.name}</p>
                            </div>
                            <div class="col">
                                <p><strong>Question Year:</strong> ${question.year}</p>
                                <p><strong>Subject:</strong> ${question.subject.name}</p>
                            </div>
                            <div class="row">
                                <p><strong>Created Date:</strong> ${question.dateCreated}</p>
                                <p><strong>Created By:</strong> ${question.createdBy}</p>
                                <p><strong>Updated Date:</strong> ${question.lastUpdated}</p>
                                <p><strong>Updated By:</strong> ${question.updatedBy}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

