<html>
<head>
    <meta name="layout" content="main"/>
    <title>subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Include jQuery and DataTables JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <!-- Include DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
</head>

<body>
<div class="container mt-3">
    <g:render template="/shared/errorMessage"/>
    <g:render template="create"/>
    <div class="modal-body" id="viewSubject"></div>
    <div class="modal-body" id="editSubject"></div>
    <g:each in="${semesters}" var="semester">
        <button class="btn btn-success semesterBtn" data-semester-id="${semester.id}">${semester.name}</button>
    </g:each>
    <div id="subjectList" class="mt-3">
        <!-- Subjects will be displayed here -->
    </div>
</div>

<script>
    $(document).ready(function() {
        $('.semesterBtn').click(function() {
            let semesterId = $(this).data('semester-id');
            $.ajax({
                url: "${createLink(controller:'subject', action:'getSubjects')}",
                type: "GET",
                data: { semesterId: semesterId },
                success: function(response) {
                    $('#subjectList').html(response);
                    $('#myTable').DataTable();
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching subjects:', error);
                }
            });
        });

        // Event delegation for .viewBtn and .editBtn
        $(document).on('click', '.viewBtn', function() {
            let subId = $(this).data('subject-id');
            $.ajax({
                url: "${createLink(controller:'subject', action:'details')}",
                type: "GET",
                data: { id: subId },
                success: function(response) {
                    $('#viewSubject').html(response);
                    $('#detailModal').modal('show');
                    console.log('Controller action called successfully.');
                },
                error: function(xhr, status, error) {
                    console.error('Error calling controller action:', error);
                }
            });
        });

        $(document).on('click', '.editBtn', function() {
            let subjectId = $(this).data('subject-id');
            $.ajax({
                url: "${createLink(controller:'subject', action:'edit')}",
                type: "POST",
                data: { id: subjectId },
                success: function(response) {
                    $('#editSubject').html(response);
                    $('#editModal').modal('show');
                    console.log('Controller action called successfully.');
                },
                error: function(xhr, status, error) {
                    console.error('Error calling controller action:', error);
                }
            });
        });
    });

</script>
<!-- Include Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>