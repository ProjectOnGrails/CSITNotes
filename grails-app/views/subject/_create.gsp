<!-- Button trigger modal -->
<button type="button" id="addRole" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Create Subject
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Subject</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form action="save" method="POST" enctype="multipart/form-data">
                    <div class="md-6">
                        <label class="form-label">
                            <select name="semester">
                                <option value="">Select Semester</option>
                                <g:each in="${semesters}" var="semester">
                                    <option value="${semester.id}">${semester.name}</option>
                                </g:each>
                            </select>
                        </label>
                    </div>
                    <div class="mb-6">
                        <label class="form-label">
                            <input type="text" class="form-control" name="code" placeholder="Enter Subject Code">
                        </label>
                    </div>
                    <div class="mb-6">
                        <label class="form-label">
                            <input type="text" class="form-control" name="name" placeholder="Enter Subject Name">
                        </label>
                    </div>
                    <div class="mb-6">
                        <label class="form-label">Choose Picture
                            <input type="file" class="form-control" name="picture">
                        </label>
                    </div>
                    <div class="mb-6">
                        <label class="form-label">Choose Syllabus
                            <input type="file" class="form-control" name="fileUpload">
                        </label>
                    </div>

                    <div class="mb-6">
                        <label class="form-label">
                            <input type="text" class="form-control" name="description" placeholder="Enter Subject Description">
                        </label>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit"  class="btn btn-primary">Save</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>