<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <g:layoutHead/>
    <!-- Include BootStrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Include jQuery and DataTables JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <!-- Include DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
    <asset:stylesheet src="main.css"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-auto min-vh-100 bg-dark d-flex flex-column border">
            <div class="pt-4 pb-1 px-2">
                <a href="/" class="text-white text-decoration-none">
                    <i class="bi bi-book-fill fs-4 me-2"></i>
                    <h2 class="fs-4 d-none d-sm-inline">CSITNotes</h2>
                </a>
            </div>
            <hr class="text-white">
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="/dashboard/index" class="nav-link text-white">
                        <i class="bi bi-speedometer2 fs-4 me-2"></i>
                        <span class="d-none d-sm-inline">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/role/index" class="nav-link text-white ${controllerName == 'role' ? 'active' : ''}">
                        <i class="bi bi-person-add fs-4 me-2"></i>
                        <span class="d-none d-sm-inline">Role</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/noteUser" class="nav-link text-white ${controllerName == 'noteUser' ? 'active' : ''}">
                        <i class="bi bi-person fs-4 me-2"></i>
                        <span class="d-none d-sm-inline">NoteUser</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/semester/index" class="nav-link text-white ${controllerName == 'semester' ? 'active' : ''}">
                        <i class="bi bi-calendar2-plus-fill fs-4 me-2"></i>
                        <span class="d-none d-sm-inline">Semester</span>
                    </a>
                </li>

                <sec:ifNotLoggedIn>
                    <li class="nav-item">
                        <a href="/login/auth" class="nav-link text-white">
                            <i class="bi bi-box-arrow-in-right fs-4 me-2"></i>
                            <span class="d-none d-sm-inline">Login</span>
                        </a>
                    </li>
                </sec:ifNotLoggedIn>
            </ul>
            <sec:ifLoggedIn>
                <div class="mt-auto">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a href="" class="nav-link text-white">
                                <i class="bi bi-person-circle fs-4 me-2"></i>
                                <span class="d-none d-sm-inline"><sec:username/>!</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/logout/index" class="nav-link text-white">
                                <i class="bi bi-box-arrow-left fs-4 me-2"></i>
                                <span class="d-none d-sm-inline">Logout</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </sec:ifLoggedIn>
        </div>
        <div class="col border mt-3">
            <g:layoutBody/>
        </div>
    </div>
</div>
<!-- Include Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
