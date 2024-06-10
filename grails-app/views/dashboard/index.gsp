<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container text-center">
    <div class="row">
        <div class="col">
            <h1>Dashboard</h1>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <div class="col">
            <div class="card h-100">
                <div class="card-body">
                    <i class="bi bi-book fs-1"></i>
                    <h5 class="card-title">Books:${bookCount}</h5>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <div class="card-body">
                    <i class="bi bi-file-earmark-ppt" style="font-size: 3rem;"></i>
                    <h5 class="card-title">Subjects:${subjectCount}</h5>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <div class="card-body">
                    <i class="bi bi-card-text fs-1"></i>
                    <h5 class="card-title">Notes:${noteCount}</h5>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <div class="card-body">
                    <i class="bi bi-question-square-fill fs-1"></i>
                    <h5 class="card-title">Questions:${questionCount}</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <canvas id="myChart"></canvas>
    </div>
</div>

<script>
    // Retrieve the data from the controller
    var subject = ${subjectCount};
    var note = ${noteCount};
    var question = ${questionCount};
    var book = ${bookCount};

    // Create the chart
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Subjects', 'Notes', 'Questions','Books'],
            datasets: [{
                label: '# of Resources',
                data: [subject,note, question,book],backgroundColor: [
                    'rgba(255, 99, 132, 0.2)', // Red
                    'rgba(54, 162, 235, 0.2)', // Blue
                    'rgba(255, 206, 86, 0.2)', // Yellow
                    'rgba(75, 192, 192, 0.2)'  // Green
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)', // Red
                    'rgba(54, 162, 235, 1)', // Blue
                    'rgba(255, 206, 86, 1)', // Yellow
                    'rgba(75, 192, 192, 1)'  // Green
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>
