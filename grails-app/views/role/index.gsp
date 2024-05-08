<!DOCTYPE html>
<html>
<head>
    <title>Roles</title>
    <meta name="layout" content="main"/>
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
    <div class="modal-body" id="editRole"></div>
    <g:render template="show"/>
</div>

<script>

    $(document).ready(function() {
        $('#myTable').DataTable();
    });

    $(".editBtn").click(function(){
        var roleId=$(this).data('role-id')
        $.ajax({
            url: "${createLink(controller:'role',action:'edit')}",
            type:"post",
            data:{id:roleId},
            success: function(response) {
                $('#editRole').html(response)
                $('#editModal').modal('show');
                console.log('Controller action called successfully.');
                console.log(response);
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });
</script>

<!-- Include Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>