<g:each in="${notes}" var="temp">
    <div class="row align-items-center mb-3">
        <div class="col-md-6 d-flex gap-3">
            <p>${temp.name}</p>
            <p>${temp.fileName}</p>
            <p>${temp.subject.name}</p>
        </div>
        <div class="col-md-3 text-center">
            <a href="${createLink(action:'downloadFile', params: [id: temp.id])}" class="btn btn-primary mx-1">Download</a>
            <a href="${createLink(action:'viewFile', params: [id: temp.id])}" class="btn btn-primary mx-1">View</a>
        </div>
        <div class="col-md-3 text-right">
            <g:link class="btn btn-primary mr-2 viewBtn" data-bs-toggle="modal" data-note-id="${temp.id}">View</g:link>
            <g:link class="btn btn-success mr-2 editBtn" data-bs-toggle="modal" data-note-id="${temp.id}" data-semester-id="${temp.subject.semester.id}">Update</g:link>
            <g:link action="delete" params="[id: temp.id, semesterId: semesterId]" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this Note?')">Delete</g:link>
        </div>
    </div>
    <hr class="border border-danger border-2 opacity-50">
</g:each>
