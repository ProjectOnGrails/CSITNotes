<!doctype html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>semester</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Include jQuery and DataTables JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <!-- Include DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
</head>

<body>
<div class="container mt-5">
    <g:render template="/shared/errorMessage"/>
    <g:render template="create"/>
    <div class="modal-body" id="editBook"></div>
    <div class="mt-3">
        <h1>Semester List</h1>
        <g:each in="${semesters}" var="semester">
            <button class="btn btn-success semesterBtn" data-semester-id="${semester.id}">${semester.name}</button>
        </g:each>
    </div>
    <div id="books-container" class="mt-3">
        <!-- Books will be displayed here -->
    </div>
</div>

<script>
    $(document).ready(function() {
        $('.semesterBtn').click(function() {
            let semesterId = $(this).data('semester-id');
            $.ajax({
                url: "${createLink(controller:'book',action:'getBooks')}",
                type:"get",
                data:{semesterId:semesterId},
                success: function(response) {
                    // Replace the books container with the fetched books
                    $('#books-container').html(response);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching books:', error);
                }
            });
        });
    });

</script>
<!-- Include Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>