<div class="row row-cols-1 row-cols-md-4 g-4">
    <g:each in="${semesters}" var="temp">
        <div class="col">
            <div class="card">
                <g:link controller="resource" action="index" params="[semesterId: temp.id]">
                    <div class="ratio ratio-1x1"> <!-- Using aspect ratio utility -->
                        <img src="${createLink(action: 'showPicture', id: temp.id)}" class="card-img-top img-fluid" alt="Semester Image">
                    </div>
                </g:link>
                <sec:ifLoggedIn>
                    <div class="card-footer text-center">
                        <g:link action="edit" class="btn btn-success editBtn me-3" data-bs-toggle="modal" data-semester-id="${temp.id}">
                            <i class="bi bi-pencil-square"></i>
                        </g:link>
                        <g:link action="delete" id="${temp.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this semester?')">
                            <i class="bi bi-trash3-fill"></i>
                        </g:link>
                    </div>
                </sec:ifLoggedIn>
            </div>
        </div>
    </g:each>
</div>