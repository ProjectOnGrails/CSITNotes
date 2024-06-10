<%@ page import="CSIT.Semester" %>

<g:form action="update" id="${semester.id}" enctype="multipart/form-data">
    <div class="row">
        <div class="col-5">
            <div class="form-floating mb-3">
                <input type="number" class="form-control" id="floatingInput" name="orderNumber" value="${semester.orderNumber}">
                <label for="floatingInput">Order Number</label>
            </div>
        </div>
        <div class="col">
            <div class="form-floating">
                <g:select class="form-select" name="name" id="floatingSelect" from="${Semester.SemesterName}"
                          value="${semester.name}"/>
                <label for="floatingSelect">Select Semester</label>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col mb-3">
            <div class="form-floating">
                <input type="file" class="form-control" id="floatingFile" name="pictureEdit"/>
                <label for="floatingFile">Choose Picture</label>
            </div>
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Update</button>
    </div>
</g:form>



