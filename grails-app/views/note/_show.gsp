<g:each in="${notes}" var="temp">
    <div class="row align-items-center mb-3">
        <div class="col-6 d-flex gap-3">
            <p>${temp.name}</p>
            <p>${temp.fileName}</p>
        </div>
        <div class="col">
            <g:link action="downloadFile" params="[id: temp.id]" class="btn btn-primary">
                <i class="bi bi-file-earmark-arrow-down-fill"></i>
            </g:link>
            <g:link action="viewFile" params="[id: temp.id]" class="btn btn-warning" target="_blank">
                <i class="bi bi-eye"></i>
            </g:link>
        </div>
        <sec:ifLoggedIn>
            <div class="col">
                <g:link class="btn btn-primary mr-2 viewBtn" data-bs-toggle="modal" data-note-id="${temp.id}">
                    <i class="bi bi-eye-fill"></i>
                </g:link>
                <g:link class="btn btn-success mr-2 editBtn" data-bs-toggle="modal" data-note-id="${temp.id}" data-semester-id="${temp.subject.semester.id}">
                    <i class="bi bi-pencil-square"></i>
                </g:link>
                <g:link action="delete" params="[id: temp.id, semesterId: semesterId]" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this Note?')">
                    <i class="bi bi-trash3-fill"></i>
                </g:link>
            </div>
        </sec:ifLoggedIn>
    </div>
    <hr class="border border-danger border-2 opacity-50">
</g:each>
