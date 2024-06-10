<%@ page import="CSIT.Semester" %>

<g:form action="save" enctype="multipart/form-data">
    <div class="row mb-2">
        <div class="col-5">
            <div class="form-floating mb-3">
                <input type="number" class="form-control" id="floatingInput" name="orderNumber" placeholder="1">
                <label for="floatingInput">Order Number</label>
            </div>
        </div>
        <div class="col">
            <div class="form-floating">
                <g:select class="form-select" name="name" id="floatingSelect" from="${Semester.SemesterName}"/>
                <label for="floatingSelect">Select Semester</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col mb-3">
            <div class="form-floating">
                <input type="file" class="form-control" id="floatingFile" name="picture" placeholder="Choose Picture">
                <label for="floatingFile">Choose Picture</label>
            </div>
        </div>
    </div>
</g:form>