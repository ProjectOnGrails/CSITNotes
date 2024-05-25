<%@ page import="CSIT.Semester" %>

<!-- Modal -->
<div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editModalLabel">Update Role</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form action="update" id="${semester.id}" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label">
                            <input type="hidden" name="id" value="${semester.id}">
                        </label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">
                            <input type="text" class="form-control" name="orderNumber" value="${semester.orderNumber}" placeholder="Enter Order Number">
                        </label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">
                            <select class="form-control" name="name" required>
                                <g:each var="semesterName" in="${Semester.SemesterName.values()}">
                                    <option value="${semesterName}" ${semesterName==semester.name ? 'selected' : ''}>${semesterName}</option>
                                </g:each>
                            </select>
                        </label>
                    </div>

                    <div class="mb-6">
                        <label class="form-label">Choose Picture
                            <input type="file" class="form-control" name="pictureEdit">
                        </label>
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