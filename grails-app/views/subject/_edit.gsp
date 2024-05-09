
<!-- Modal -->
<div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editModalLabel">Update Subject</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form action="update" method="POST" enctype="multipart/form-data" id="${subject.id}">

                    <div class="mb-6">
                        <label class="form-label">
                            <input type="text" class="form-control" name="id" value="${subject.id}" disabled>
                        </label>
                    </div>
                    <div class="mb-6">
                        <label class="form-label">
                            <input type="text" class="form-control" name="code" value="${subject.code}" placeholder="Enter Subject Code">
                        </label>
                    </div>
                    <div class="mb-6">
                        <label class="form-label">
                            <input type="text" class="form-control" name="name" value="${subject.name}" placeholder="Enter Subject Name">
                        </label>
                    </div>
                    <div class="mb-6">
                        <label class="form-label">Choose Picture
                            <input type="file" class="form-control" name="pictureEdit">
                        </label>
                    </div>
                    <div class="mb-6">
                        <label class="form-label">Choose Syllabus
                            <input type="file" class="form-control" name="fileEdit">
                        </label>
                    </div>

                    <div class="mb-6">
                        <label class="form-label">
                            <input type="text" class="form-control" value="${subject.description}" name="description" placeholder="Enter Subject Description">
                        </label>
                    </div>
                    <div class="md-6">
                        <label class="form-label">
                            <select class="form-control" name="semester" required>
                                <g:each in="${semesters}" var="semester">
                                    <option value="${semester.id}" ${semester.id == subject.semester.id ? 'selected' : ''}>${semester.name}</option>
                                </g:each>
                            </select>
                        </label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit"  class="btn btn-primary">Update</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>