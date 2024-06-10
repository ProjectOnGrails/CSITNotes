<%@ page import="user.NoteUser" %>
<g:form action="update" id="${userInstance.id}">
    <div class="container">
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingName" name="fullName" value="${userInstance.fullName}"  placeholder="Enter FullName">
                    <label for="floatingName">Full Name</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <g:select class="form-select" id="floatingSelectGender" name="gender" from="${NoteUser.Gender}" value="${userInstance.gender}"/>
                    <label for="floatingSelectGender">Gender</label>
                </div>

            </div>
        </div>
        <div class="row mb-3">
            <div class="form-floating">
                <input type="email" class="form-control" id="floatingInput" name="email" value="${userInstance.email}" placeholder="name@example.com">
                <label for="floatingInput">Email address</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingUser" name="user.username" value="${userInstance.user.username}" placeholder="Enter Username"  autocomplete="off">
                    <label for="floatingUser">UserName</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="user.password" value="${userInstance.user.password}" placeholder="Enter Password"  autocomplete="off">
                    <label for="floatingPassword">Password</label>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingPhone" name="phone" value="${userInstance.phone}" placeholder="Enter Phone Number">
                    <label for="floatingPhone">Contact Number</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <g:select class="form-select" id="floatingSelect" name="newRoleId" from="${roles}" optionKey="id" optionValue="authority" value="${userInstance.user.authorities.id}"/>
                    <label for="floatingSelect">Role</label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Update</button>
    </div>
</g:form>

