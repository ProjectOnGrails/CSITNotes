<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>CSITNotes</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Hero Section Start-->
        <div class="col border d-flex flex-column justify-content-center">
            <h1>Unlimited Destination for IT Students</h1>
            <g:link controller="semester" action="index">
                <button type="button" class="btn btn-primary">Access Resources</button>
            </g:link>
        </div>
        <div class="col border">
            <!-- Carousel Start -->
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <asset:image src="img.jpg" class="d-block w-100" alt="Image1"/>
                    </div>
                    <div class="carousel-item">
                        <asset:image src="img1.jpg" class="d-block w-100" alt="Image2"/>
                    </div>
                    <div class="carousel-item">
                        <asset:image src="img3.jpg" class="d-block w-100" alt="Image3"/>
                    </div>
                </div>
            </div>
            <!-- Carousel End -->
        </div>
        <!-- Hero Section End-->
    </div>
    <div class="b-example-divider"></div>
    <div class="row">
        <h1><u>Our Services</u></h1>
    </div>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <div class="col">
            <div class="card h-100">
                <asset:image src="img3.jpg" class="card-img-top" alt="..."/>
                <div class="card-body">
                    <h5 class="card-title">Syllabus</h5>
                    <p class="card-text">Stay updated with the latest syllabus for your courses.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <asset:image src="img1.jpg" class="card-img-top" alt="..."/>
                <div class="card-body">
                    <h5 class="card-title">Notes</h5>
                    <p class="card-text">Comprehensive notes covering all key topics for CSIT students.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <asset:image src="about.jpg" class="card-img-top" alt="..."/>
                <div class="card-body">
                    <h5 class="card-title">Old Questions</h5>
                    <p class="card-text">Access past examination papers to help you prepare effectively.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <asset:image src="img2.jpg" class="card-img-top" alt="..."/>
                <div class="card-body">
                    <h5 class="card-title">Solutions</h5>
                    <p class="card-text">Detailed solutions to help you understand and solve problems better.</p>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
