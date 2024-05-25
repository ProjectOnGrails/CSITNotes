<div class="row row-cols-1 row-cols-md-3 g-4">
    <g:each in="${semesters}" var="temp">
        <div class="col">
            <div class="card">
                <g:link controller="resource" action="index" params="[semesterId: temp.id]">
                    <img src="${createLink(action: 'showPicture', id: temp.id)}" style="width: 100%" alt="Semester Image">
                </g:link>
                <div class="card-footer text-center">
                    <g:link action="edit" class="btn btn-success mr-3 editBtn" data-bs-toggle="modal" data-semester-id="${temp.id}">Update</g:link>
                    <g:link action="delete" id="${temp.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this semester?')">Delete</g:link>
                </div>
            </div>
        </div>
    </g:each>
</div>