
<div class="container mt-5">
    <g:each in="${subjects}" var="subject">
        <div class="row align-items-center mb-3">
            <div class="col-md-3">
                <p>${subject.name}</p>
            </div>
            <div class="col-md-6 text-center">
                <a href="${createLink(action:'downloadFile', params: [id: subject.id])}" class="btn btn-primary mx-1">Download Syllabus</a>
                <a href="${createLink(action:'viewFile', params: [id: subject.id])}" class="btn btn-primary mx-1">View Syllabus</a>
            </div>
            <div class="col-md-3 text-right">
                <g:link class="btn btn-primary mr-2 viewBtn" data-bs-toggle="modal" data-subject-id="${subject.id}">View</g:link>
                <g:link class="btn btn-success mr-2 editBtn" data-bs-toggle="modal" data-subject-id="${subject.id}" data-semester-id="${subject.semester.id}">Update</g:link>
                <g:link action="delete" params="[id: subject.id, semesterId: semesterId]" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this subject?')">Delete</g:link>
            </div>
        </div>
        <hr class="border border-danger border-2 opacity-50">
    </g:each>
</div>
