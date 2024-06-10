<div class="table-responsive mt-3">
    <table id="myTable" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Book Name</th>
            <th>File</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${books}" var="temp">
            <tr>
                <th scope="row">${temp.id}</th>
                <td>${temp.name}</td>
                <td>${temp.fileName}</td>
                <td>
                    <g:link action="downloadFile" id="${temp.id}" class="mr-3">Download</g:link>
                    <g:link action="viewFile" id="${temp.id}">View</g:link>
                </td>
                <td class="text-center">
                    <g:link action="edit" class="btn btn-success mr-3 editBtn" data-bs-toggle="modal" data-book-id="${temp.id}">Update</g:link>
                    <g:link action="delete" id="${temp.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this book?')">Delete</g:link>
                </td>
            </tr>
        </g:each>
        <!-- Add more rows as needed -->
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function() {
        $('#myTable').DataTable();

        $(".editBtn").click(function(){
            let bookId=$(this).data('book-id')
            $.ajax({
                url: "${createLink(controller:'book',action:'edit')}",
                type:"post",
                data:{id:bookId},
                success: function(response) {
                    $('#editBook').html(response)
                    $('#editModal').modal('show');
                    console.log('Controller action called successfully.');
                    console.log(response);
                },
                error: function(xhr, status, error) {
                    console.error('Error calling controller action:', error);
                }
            });
        });
    });

</script>