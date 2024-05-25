<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>NoteUser</title>
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
    <!-- Button trigger modal -->
    <button type="button" id="addNoteUser" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Create NoteUser
    </button>


    <!-- Modal -->
    <div class="modal fade" id="CreateModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Add NoteUser</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="modalBody">

                </div>
            </div>
        </div>
    </div>
    <g:render template="show"/>
    <div class="modal-body" id="viewNoteUser"></div>
    <div class="modal-body" id="editNoteUser"></div>

</div>
<script>
    $(document).ready(function() {
        $('#myTable').DataTable();
    });
    $("#addNoteUser").click(function(){
        $.ajax({
            url: "${createLink(controller:'noteUser',action:'create')}",
            type:"post",
            success: function(response) {
                $('#CreateModal').modal('show');
                $('#modalBody').html(response)
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

    $(".viewBtn").click(function(){
        let noteUserId=$(this).data('user-id')
        $.ajax({
            url: "${createLink(controller:'noteUser',action:'details')}",
            type:"get",
            data:{id:noteUserId},
            success: function(response) {
                $('#viewNoteUser').html(response)
                $('#detailModal').modal('show');
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

    $('#viewNoteUser').on("click", ".editBtn", function(){
        let userId=$(this).data('user-id')
        $.ajax({
            url: "${createLink(controller:'noteUser',action:'edit')}",
            type:"post",
            data:{id:userId},
            success: function(response) {
                $('#editNoteUser').html(response)
                $('#editModal').modal('show');
                console.log('Controller action called successfully.');
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
