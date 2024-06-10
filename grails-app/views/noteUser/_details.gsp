<div class="container-fluid">
    <div class="row mb-2">
        <div class="col-4">
            <div><strong>ID:</strong> ${userInstance.id}</div>
        </div>
        <div class="col">
            <div><strong>Full Name:</strong> ${userInstance.fullName}</div>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-4">
            <div><strong>Gender:</strong> ${userInstance.gender}</div>
        </div>
        <div class="col">
            <div><strong>Email:</strong> ${userInstance.email}</div>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-4">
            <div><strong>Username:</strong> ${userInstance.user.username}</div>
        </div>
        <div class="col-4">
            <div><strong>Phone:</strong> ${userInstance.phone}</div>
        </div>
    </div>
    <div class="row">
        <div><strong>Authority:</strong> ${userInstance.user.authorities.authority}</div>
    </div>
</div>






