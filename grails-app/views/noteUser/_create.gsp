<%@ page import="user.NoteUser" %>
<g:form action="save">
    <div class="container">
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingName" name="fullName" placeholder="Enter FullName">
                    <label for="floatingName">Full Name</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <g:select class="form-select" id="floatingSelectGender" name="gender" from="${NoteUser.Gender}" noSelection="['':'Select Gender']"/>
                    <label for="floatingSelectGender">Gender</label>
                </div>

            </div>
        </div>
        <div class="row mb-3">
            <div class="form-floating">
                <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
                <label for="floatingInput">Email address</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingUser" name="user.username" placeholder="Enter Username"  autocomplete="off">
                    <label for="floatingUser">UserName</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="user.password" placeholder="Enter Password"  autocomplete="off">
                    <label for="floatingPassword">Password</label>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingPhone" name="phone" placeholder="Enter Phone Number">
                    <label for="floatingPhone">Contact Number</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <g:select class="form-select" id="floatingSelect" name="roleAuthority" from="${roles.authority}"  noSelection="['':'Assign Role']" />
                    <label for="floatingSelect">Role</label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save</button>
    </div>
</g:form>

