<!doctype html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>semester</title>
</head>

<body>
<div class="container">
    <g:render template="/shared/errorMessage"/>
    <div class="row">
        <div class="col">
            <button type="button" id="addBook" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Create Book
            </button>
            <!--Create Modal Start-->
            <div class="modal fade" id="exampleModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Add Book</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        </div>
                    </div>
                </div>
            </div>
            <!--Create Modal End-->

            <!--Edit Modal Start-->
            <div class="modal fade" id="editModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="editModalLabel">Update Book</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="editBook">
                        </div>
                    </div>
                </div>
            </div>
            <!--Edit Modal End-->
        </div>
    </div>
    <div class="row">
        <div class="col">
            <h1>Semester List</h1>
            <g:each in="${semesters}" var="semester">
                <button class="btn btn-success semesterBtn" data-semester-id="${semester.id}">${semester.name}</button>
            </g:each>
        </div>
    </div>
    <div class="row">
        <div class="col" id="books-container">
        </div>
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