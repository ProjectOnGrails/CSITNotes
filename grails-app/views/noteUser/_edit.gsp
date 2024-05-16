<%@ page import="user.NoteUser" %>
<div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editModalLabel">Update NoteUser</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form action="update" id="${userInstance.id}">
                    <div class="mb-3">
                        <label class="form-label">
                            <input type="hidden" name="id" value="${userInstance.id}" disabled/>
                            <input type="text" class="form-control" name="fullName" value="${userInstance.fullName}" placeholder="Enter Authority">
                        </label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">
                            <select class="form-control" name="gender" required>
                                <g:each var="gender" in="${NoteUser.Gender.values()}">
                                    <option value="${gender}" ${gender == userInstance.gender ? 'selected' : ''}>${gender}</option>
                                </g:each>
                            </select>
                        </label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">
                            <input type="text" class="form-control" name="email" value="${userInstance.email}" placeholder="Enter Authority">
                        </label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">
                            <input type="text" class="form-control" name="user.username" value="${userInstance.user.username}" placeholder="Enter Username">
                        </label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">
                            <input type="password" class="form-control" name="user.password" value="${userInstance.user.username}" placeholder="Enter Password">
                        </label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">
                            <input type="text" class="form-control" name="phone" value="${userInstance.phone}" placeholder="Enter Authority">
                        </label>
                    </div>
                    <div class="mb-3">
                        <g:select name="newRoleId" from="${roles}" optionKey="id" optionValue="authority" value="${userInstance.user.authorities.id}" />
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