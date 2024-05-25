<div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editModalLabel">Update Note</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form controller="note" action="update" enctype="multipart/form-data" id="${noteInstance.id}">
                    <!-- Hidden field to pass semesterId -->
                    <input type="hidden" name="semesterId" value="${semesterId}" />

                    <div class="mb-3">
                        <label class="form-label">Subject:</label>
                        <g:select name="subject" from="${subjects}" optionKey="id" optionValue="name" value="${noteInstance.subject?.id}"/>
                    </div>

                    <div class="mb-6">
                        <label class="form-label">
                            <input type="text" class="form-control" name="name" placeholder="Enter Note Name" value="${noteInstance.name}">
                        </label>
                    </div>

                    <div class="mb-6">
                        <label class="form-label">Choose Note:</label>
                        <input type="file" class="form-control" name="fileEdit">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

