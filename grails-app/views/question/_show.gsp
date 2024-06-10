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
                                <div class="col-md-6 d-flex gap-3">
                                    <p>${temp.name}</p>
                                    <p>${temp.year}</p>
                                </div>
                                <div class="col-md-3 text-center">
                                    <g:link action="downloadFile" params="[id: temp.id]" class="btn btn-primary">
                                        <i class="bi bi-file-earmark-arrow-down-fill"></i>
                                    </g:link>
                                    <g:link action="viewFile" params="[id: temp.id]" class="btn btn-warning" target="_blank">
                                        <i class="bi bi-eye"></i>
                                    </g:link>
                                </div>

                                <div class="col-md-3 text-right">
                                    <g:link class="btn btn-primary mr-2 viewBtn" data-bs-toggle="modal" data-question-id="${temp.id}">
                                        <i class="bi bi-eye-fill"></i>
                                    </g:link>
                                    <g:link class="btn btn-success mr-2 editBtn" data-bs-toggle="modal" data-question-id="${temp.id}" data-semester-id="${subject.semester.id}" >
                                        <i class="bi bi-pencil-square"></i>
                                    </g:link>
                                    <g:link action="delete" params="[id: temp.id, semesterId: semesterId]" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this question?')">
                                        <i class="bi bi-trash3-fill"></i>
                                    </g:link>
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