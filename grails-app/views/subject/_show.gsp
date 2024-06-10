<g:each in="${subjects}" var="subject">
    <div class="row align-items-center mb-3">
        <div class="col-md-3">
            <p>${subject.name}</p>
        </div>
        <div class="col-md-6 text-center">
            <g:link action="downloadFile" params="[id: subject.id]" class="btn btn-primary">
                <i class="bi bi-file-earmark-arrow-down-fill"></i>
            </g:link>
            <g:link action="viewFile" params="[id: subject.id]" class="btn btn-warning" target="_blank">
                <i class="bi bi-eye"></i>
            </g:link>
        </div>
        <div class="col-md-3 text-right">
            <g:link class="btn btn-primary mr-2 viewBtn" data-bs-toggle="modal" data-subject-id="${subject.id}">
                <i class="bi bi-eye-fill"></i>
            </g:link>
            <g:link class="btn btn-success mr-2 editBtn" data-bs-toggle="modal" data-subject-id="${subject.id}" data-semester-id="${subject.semester.id}">
                <i class="bi bi-pencil-square"></i>
            </g:link>
            <g:link action="delete" params="[id: subject.id, semesterId: semesterId]" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this subject?')">
                <i class="bi bi-trash3-fill"></i>
            </g:link>
        </div>
    </div>
    <hr class="border border-danger border-2 opacity-50">
</g:each>
