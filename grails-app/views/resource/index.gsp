<!DOCTYPE html>
<html>

<head>
    <title>Resources</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container text-center">
    <g:render template="/shared/errorMessage"/>
    <div class="row">
        <div class="col">
            <!-- Include breadcrumbs using taglib -->
            <nav class="d-inline-flex justify-content-center" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">
                        <breadcrumb:breadcrumbs currentPage="Question" semesterId="${semesterId}"/>
                    </li>
                </ol>
            </nav>
        </div>
    </div>
    <sec:ifLoggedIn>
        <div class="row">
            <div class="col">
                <!-- Button trigger modal -->
                <div class="dropdown">
                    <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Add Resource
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#" id="addSubject" data-bs-toggle="modal" data-bs-target="#exampleModal">Subject</a></li>
                        <li><a class="dropdown-item" href="#" id="addNote" data-bs-toggle="modal" data-bs-target="#exampleModal">Note</a></li>
                        <li><a class="dropdown-item" href="#" id="addQuestion" data-bs-toggle="modal" data-bs-target="#exampleModal">Question</a></li>
                    </ul>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Resource</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="modalBody">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </sec:ifLoggedIn>

    <div class="row">
        <div class="col">
            <h2>Resources Are:</h2>
            <button type="button" id="viewQuestion" class="btn btn-success mr-5">Questions</button>
            <button type="button" id="viewSyllabus" class="btn btn-info mr-5">Syllabus</button>
            <button type="button" id="viewNotes" class="btn btn-warning">Notes</button>
        </div>
    </div>

    <div class="row mt-5" id="showData">
        <p>Loading content...</p>
    </div>

</div>

<script>
    $("#addNote").click(function(){
        let semesterId = '${semesterId}';
        $.ajax({
            url: "${createLink(controller:'note',action:'create')}",
            type:"post",
            data: { semesterId: semesterId },
            success: function(response) {
                $('#modalBody').html(response)
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

    $("#addQuestion").click(function(){
        let semesterId = '${semesterId}';
        $.ajax({
            url: "${createLink(controller:'question',action:'create')}",
            type:"post",
            data: { semesterId: semesterId },
            success: function(response) {
                $('#modalBody').html(response)
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

    $("#addSubject").click(function(){
        let semesterId = '${semesterId}';
        $.ajax({
            url: "${createLink(controller:'subject',action:'create')}",
            type:"post",
            data: { semesterId: semesterId },
            success: function(response) {
                $('#modalBody').html(response)
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

    // Function to load questions
    function loadQuestions(semesterId) {
        $.ajax({
            url: '${createLink(controller: 'question', action: 'index')}',
            type: "GET",
            data: { semesterId: semesterId },
            success: function(data) {
                $('#showData').html(data);
            },
            error: function() {
                $('#showData').html('<p>Error loading content.</p>');
            }
        });
    }

    // Document ready function
    $(document).ready(function() {
        let semesterId = '${semesterId}';
        loadQuestions(semesterId);
    });


    // Click handler for #viewQuestion button
    $('#viewQuestion').click(function() {
        let semesterId = '${semesterId}';
        $('#currentResource').text("Question");
        loadQuestions(semesterId);
    });



    $('#viewNotes').click(function() {
        $('#currentResource').text("Note");
        let semesterId = '${semesterId}';
        $.ajax({
            url: '${createLink(controller: 'note', action: 'index')}',
            type: "GET",
            data: { semesterId: semesterId },
            success: function(data) {
                $('#showData').html(data);
            },
            error: function() {
                $('#templateDiv').html('<p>Error loading content.</p>');
            }
        });
    });


    $('#viewSyllabus').click(function() {
        $('#currentResource').text("Syllabus");
        let semesterId = '${semesterId}';
        $.ajax({
            url: '${createLink(controller: 'subject', action: 'index')}',
            type: "GET",
            data: { semesterId: semesterId },
            success: function(data) {
                $('#showData').html(data);
            },
            error: function() {
                $('#templateDiv').html('<p>Error loading content.</p>');
            }
        });
    });

</script>
</body>
</html>