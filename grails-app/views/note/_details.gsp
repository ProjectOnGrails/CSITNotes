<div class="modal fade" id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-header">
                        Note Information
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Note ID:</strong> ${note.id}</p>
                                <p><strong>Note Name:</strong> ${note.name}</p>
                                <p><strong>Subject:</strong> ${note.subject.name}</p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Created Date:</strong> ${note.dateCreated}</p>
                                <p><strong>Created By:</strong> ${note.createdBy}</p>
                                <p><strong>Updated Date:</strong> ${note.lastUpdated}</p>
                                <p><strong>Updated By:</strong> ${note.updatedBy}</p>
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
