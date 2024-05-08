<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>

<body>
<div class="sidebar">
    <div class="sidebar-title">CSITNotes</div>
    <a href="/"><i class="fas fa-home"></i> Home</a>
    <a href="/noteUser/index"><i class="fas fa-user"></i> NoteUser</a>
    <a href="/role/index"><i class="fas fa-user-tag"></i> Role</a>
    <a href="/semester/index"><i class="fas fa-calendar-alt"></i> Semester</a>
    <a href="/subject/index"><i class="fas fa-book"></i> Subject</a>
    <a href="/book/index"><i class="fas fa-book-open"></i> Book</a>
    <a href="/semester/index"><i class="fas fa-sticky-note"></i> Note</a>
    <a href="/semester/index"><i class="fas fa-question-circle"></i> Question</a>
    <sec:ifNotLoggedIn>
        <a href="/login/auth"><i class="fas fa-sign-in-alt"></i> Login</a>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
        <div class="sidebar-bottom">
            <div class="username"><i class="fas fa-user"></i>
                <sec:username/>!
            </div>
            <g:link controller="logout" action="index">
                <i class="fas fa-sign-out-alt"></i> Logout
            </g:link>
        </div>
    </sec:ifLoggedIn>
</div>

<div class="content">
    <g:layoutBody/>
</div>

</body>
</html>
