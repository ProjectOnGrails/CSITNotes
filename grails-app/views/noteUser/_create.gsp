<%@ page import="user.NoteUser" %>
<g:form action="save">
    <div class="mb-3">
        <label class="form-label">
            <input type="text" class="form-control" name="fullName" placeholder="Enter FullName">
        </label>
    </div>
    <div class="mb-3">
        <label class="form-label">
            <select class="form-control" name="gender">
                <option value="">Select Gender</option>
                <g:each var="gender" in="${NoteUser.Gender.values()}">
                    <option value="${gender}">${gender}</option>
                </g:each>
            </select>
        </label>
    </div>
    <div class="mb-3">
        <label class="form-label">
            <input type="email" class="form-control" name="email" placeholder="Enter Email">
        </label>
    </div>
    <div class="mb-3">
        <label class="form-label">
            <input type="text" class="form-control" name="user.username" value="" placeholder="Enter Username"  autocomplete="off">
        </label>
    </div>
    <div class="mb-3">
        <label class="form-label">
            <input type="password" class="form-control" name="user.password" value="" placeholder="Enter Password"  autocomplete="off">
        </label>
    </div>
    <div class="mb-3">
        <label class="form-label">
            <input type="text" class="form-control" name="phone" placeholder="Enter Phone Number">
        </label>
    </div>
    <div class="mb-3">
        <g:select name="roleAuthority" from="${roles.authority}"  noSelection="['':'Assign Role']" />
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit"  class="btn btn-primary">Save</button>
    </div>
</g:form>

