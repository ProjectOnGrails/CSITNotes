<!DOCTYPE html>
<html>
<head>
    <title>Roles</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container">
    <g:render template="/shared/errorMessage"/>
    <div class="row">
        <div class="col">
            <!-- Button trigger modal -->
            <button type="button" id="addRole" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Create Role
            </button>

            <!--Create Modal Start -->
            <div class="modal fade" id="exampleModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Add Role</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="modalBody">
                        </div>
                    </div>
                </div>
            </div>
            <!--Create Modal End -->
            <!--Edit Modal Start -->
            <div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="editModalLabel">Update Role</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="editRole">
                        </div>
                    </div>
                </div>
            </div>
            <!--Edit Modal End -->
        </div>
    </div>
    <div class="row">
        <g:render template="show"/>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#myTable').DataTable();
    });

    $("#addRole").click(function(){
        $.ajax({
            url: "${createLink(controller:'role',action:'create')}",
            type:"post",
            success: function(response) {
                $('#exampleModal').modal('show');
                $('#modalBody').html(response)
                console.log('Controller action called successfully.');
            },
            error: function(xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
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
</body>
</html>