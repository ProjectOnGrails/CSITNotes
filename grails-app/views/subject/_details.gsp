<div class="container">
    <div class="row">
        <div class="col-md-6">
            <p><strong>Subject ID:</strong> ${subject.id}</p>
            <p><strong>Subject Code:</strong> ${subject.code}</p>
            <p><strong>Subject Name:</strong> ${subject.name}</p>
            <p><strong>Semester:</strong> ${subject.semester.name}</p>
        </div>
        <div class="col-md-6">
            <img src="${createLink(action:'showPicture', params: [id: subject.id])}" height="150px" alt="Subject Image">
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <p><strong>Syllabus Name:</strong> ${subject.syllabusName}</p>
            <p><strong>Description:</strong> ${subject.Description}</p>
            <p><strong>Created By:</strong> ${subject.createdBy}</p>
        </div>
        <div class="col-6">
            <p><strong>Updated By:</strong> ${subject.updatedBy}</p>
            <p><strong>Created Date:</strong> ${subject.dateCreated}</p>
            <p><strong>Updated Date:</strong> ${subject.lastUpdated}</p>
        </div>
    </div>
</div>


