<div class="accordion accordion-flush" id="accordionFlushExample">
    <g:each in="${subjects}" var="subject" status="index">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${index}" aria-expanded="false" aria-controls="flush-collapse${index}">
                    ${subject.name}
                </button>
            </h2>
            <div id="flush-collapse${index}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <g:if test="${subject.questions}">
                        <g:each in="${subject.questions}" var="temp">
                            <div class="row align-items-center mb-3">
                                <div class="col-md-3 d-flex gap-3">
                                    <p>${temp.name}</p>
                                    <p>${temp.year}</p>
                                </div>
                                <div class="col-md-6 text-center">
                                    <a href="${createLink(action:'downloadFile', params: [id: temp.id])}" class="btn btn-primary mx-1">Download Question</a>
                                    <a href="${createLink(action:'viewFile', params: [id: temp.id])}" class="btn btn-primary mx-1">View Question</a>
                                </div>
                                <div class="col-md-3 text-right">
                                    <g:link class="btn btn-primary mr-2 viewBtn" data-bs-toggle="modal" data-question-id="${temp.id}">View</g:link>
                                    <g:link class="btn btn-success mr-2 editBtn" data-bs-toggle="modal" data-question-id="${temp.id}" data-semester-id="${subject.semester.id}" >Update</g:link>
                                    <g:link action="delete" params="[id: temp.id, semesterId: semesterId]" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this question?')">Delete</g:link>
                                </div>
                            </div>
                            <hr class="border border-danger border-2 opacity-50">
                        </g:each>
                    </g:if>
                    <g:else>
                        <p>No questions available for this subject.</p>
                    </g:else>

                </div>
            </div>
        </div>
    </g:each>
</div>