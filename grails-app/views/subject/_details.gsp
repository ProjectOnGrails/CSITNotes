<div class="modal fade" id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-header">
                        Subject Information
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Subject ID:</strong> ${subject.id}</p>
                                <p><strong>Subject Code:</strong> ${subject.code}</p>
                                <p><strong>Subject Name:</strong> ${subject.name}</p>
                                <p><strong>Syllabus Name:</strong> ${subject.syllabusName}</p>
                                <p><strong>Semester:</strong> ${subject.semester.name}</p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Picture:</strong></p>
                                <img src="${createLink(action:'showPicture', params: [id: subject.id])}" height="150px" alt="Subject Image">
                            </div>
                        </div>
                        <p><strong>Description:</strong> ${subject.Description}</p>
                    </div>
                    <div class="card-footer">
                        <a href="${createLink(action:'downloadFile', params: [id: subject.id])}" class="btn btn-primary">Download Syllabus</a>
                        <a href="${createLink(action:'viewFile', params: [id: subject.id])}" class="btn btn-primary">View Syllabus</a>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
