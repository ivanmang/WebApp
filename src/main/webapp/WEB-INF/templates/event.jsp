<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<title>WebApps-Evena</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    body, html {height: 100%}
    body {font-family: Tahoma, Geneva, sans-serif;}

    .homeimg {
        background-size: cover;
        background: url("/resources/images/homepage.png") no-repeat;
        min-height: 100%;
    }

    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
    th, td {
        padding: 5px;
        text-align: center;
    }

</style>

<body>

<!-- Navbar (on top) -->
<div class="w3-top w3-hide-small">
    <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
        <a href="#" class="w3-bar-item w3-button">Home</a>
        <a href="#about" class="w3-bar-item w3-button">About</a>
        <a href="#create" class="w3-bar-item w3-button">Create an Event</a>
    </div>
</div>

<!-- Header with background image -->
<header class="homeimg w3-container w3-padding-64 w3-large " id="home">
    <table style="width:75%">
        <tr>
            <th>Event ID:</th>
            <td>${id}</td>
        </tr>
        <tr>
            <th>Event Name:</th>
            <td>${name}</td>
        </tr>
        <tr>
            <th>Date:</th>
            <td>${date}</td>
        </tr>
        <tr>
            <th>About:</th>
            <td>${about}</td>
        </tr>
    </table>
    <form action="/register" style="max-width:500px;margin:auto" method="GET">
        <button type="submit" class="btn">Event</button>
    </form>
</header>



<!-- Footer -->
<footer class="w3-center w3-padding-48 w3-small">
    <p>Webapp-Evena</p>
</footer>

</body>
</html>
