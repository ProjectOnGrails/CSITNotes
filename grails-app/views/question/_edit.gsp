<div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editModalLabel">Update Book</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form action="update" enctype="multipart/form-data">
                    <!-- Hidden field to pass semesterId -->
                    <input type="hidden" name="semesterId" value="${semesterId}" />

                    <input type="hidden" name="id" value="${questionInstance.id}" />
                    <div class="md-6">
                        <label class="form-label">
                            Select Subject:
                            <select name="subject">
                                <g:each in="${subjects}" var="subject">
                                    <option value="${subject.id}" ${subject.id == questionInstance?.subject?.id ? 'selected' : ''}>${subject.name}</option>
                                </g:each>
                            </select>
                        </label>
                    </div>

                    <div class="mb-6">
                        <label class="form-label">
                            <input type="text" class="form-control" name="name" placeholder="Enter Question Name" value="${questionInstance.name}">
                        </label>
                    </div>

                    <div class="mb-6">
                        <label class="form-label">
                            <input type="number" class="form-control" name="year" placeholder="Enter Year" value="${questionInstance.year}">
                        </label>
                    </div>
                    <div class="mb-6">
                        <label class="form-label">Choose Question:</label>
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

