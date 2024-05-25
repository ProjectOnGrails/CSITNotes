<%@ page import="CSIT.Semester" %>

<g:form action="save" enctype="multipart/form-data">
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
    <div class="mb-6">
        <label class="form-label">Choose Picture
            <input type="file" class="form-control" name="picture">
        </label>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit"  class="btn btn-primary">Save</button>
    </div>
</g:form>