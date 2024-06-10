<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="main" />
    <title>NoteUser</title>
</head>

<body>
<div class="container">
    <g:render template="/shared/errorMessage" />
    <div class="row">
        <div class="col">
            <!-- Button trigger modal -->
            <button type="button" id="addNoteUser" class="btn btn-primary" data-bs-toggle="modal"
                    data-bs-target="#exampleModal">
                Create NoteUser
            </button>
            <!--Create Modal Start-->
            <div class="modal fade" id="CreateModal" data-bs-backdrop="static" tabindex="-1"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Add NoteUser</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="modalBody">

                        </div>
                    </div>
                </div>
            </div>
            <!--Edit Modal Start-->
            <div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1"
                 aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="editModalLabel">Update NoteUser</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="editNoteUser">
                        </div>
                    </div>
                </div>
            </div>
            <!--Edit Modal End-->
            <!--View Modal End-->
            <div class="modal fade" id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="detailModalLabel">NoteUser Details</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="viewNoteUser">
                        </div>
                    </div>
                </div>
            </div>
            <!--View Modal End-->
        </div>
    </div>

    <div class="row">
        <g:render template="show" />
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#myTable').DataTable();
    });
    $("#addNoteUser").click(function () {
        $.ajax({
            url: "${createLink(controller:'noteUser',action:'create')}",
            type: "post",
            success: function (response) {
                $('#CreateModal').modal('show');
                $('#modalBody').html(response)
                console.log('Controller action called successfully.');
            },
            error: function (xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

    $(".viewBtn").click(function () {
        let noteUserId = $(this).data('user-id')
        $.ajax({
            url: "${createLink(controller:'noteUser',action:'details')}",
            type: "get",
            data: { id: noteUserId },
            success: function (response) {
                $('#viewNoteUser').html(response)
                $('#detailModal').modal('show');
                console.log('Controller action called successfully.');
            },
            error: function (xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

    $(".editBtn").click(function () {
        let userId = $(this).data('user-id')
        $.ajax({
            url: "${createLink(controller:'noteUser',action:'edit')}",
            type: "post",
            data: { id: userId },
            success: function (response) {
                $('#editNoteUser').html(response)
                $('#editModal').modal('show');
                console.log('Controller action called successfully.');
            },
            error: function (xhr, status, error) {
                console.error('Error calling controller action:', error);
            }
        });
    });

</script>
</body>
</html>