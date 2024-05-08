<%@ page import="CSIT.Semester" %>
<!-- Button trigger modal -->
<button type="button" id="addRole" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Create Semester
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Semester</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form action="save">
                    <div class="mb-3">
                        <label class="form-label">
                            <input type="text" class="form-control" name="orderNumber" placeholder="Enter Order Number">
                        </label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">
                            <select class="form-control" name="name">
                                <option value="">Select Semester</option>
                                <g:each var="semesterName" in="${Semester.SemesterName.values()}">
                                    <option value="${semesterName}">${semesterName}</option>
                                </g:each>
                            </select>
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