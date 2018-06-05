<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>WebApps-Evena</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, html {height: 100%}
body {font-family: Tahoma, Geneva, sans-serif;}
table, td, th {
    border: 1px solid #ddd;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 40px;
}

th {
    background-color: orange;
}

.homeimg {
    background-size: cover;
    background: url("/resources/images/homepage.png") no-repeat;
    min-height: 100%;
    width: 100%;
}


.bgimg {
    background-size: cover;
    background: url("/resources/images/background.jpg") no-repeat;
    min-height: 50%;
}

/* Set a style for the submit button */
.btn {
    background-color: orange;
    color: white;
    padding: 15px 20px;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

.btn:hover {
    opacity: 2;
}

form.find input[type=text] {
    padding: 10px;
    font-size: 17px;
    border: 1px solid grey;
    float: left;
    width: 80%;
    background: #f1f1f1;
}

form.find button {
    float: left;
    width: 20%;
    padding: 10px;
    background: orange;
    color: white;
    font-size: 17px;
    border: 1px solid grey;
    border-left: none;
    cursor: pointer;
}

form.find button:hover {
    background: orange;
}

form.find::after {
    content: "";
    clear: both;
    display: table;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    function disableF5(e) {
        if (e.which === 116 || e.keyCode === 116) {
            e.preventDefault();
            window.location = window.location.pathname
        }
    }

    $(function() {
        $(document).on("keydown", disableF5);
    });
</script>

<body>

<!-- Navbar (on top) -->
<div class="w3-top w3-hide-small">
  <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
    <a href="#" class="w3-bar-item w3-button">Home</a>
    <a href="#about" class="w3-bar-item w3-button">About</a>
    <a href="#create" class="w3-bar-item w3-button">Create an Event</a>
    <a href="#find" class="w3-bar-item w3-button">List of Events</a>
  </div>
</div>

<!-- Header with background image -->
<header class="homeimg w3-display-container" id="home">
  <div class="w3-display-bottommiddle w3-center">
      <p>
      <form action="/browse" style="max-width:500px;margin:auto" method="GET">
      <button type="submit" class="btn">Browse Events</button>
        </form>
      </p>
    <p><form action="/signin" style="max-width:500px;margin:auto" method="GET">
      <button type="submit" name = "action" value = "create" class="btn">Create</button>
  </form></p>
      <p><form action="/signin" style="max-width:500px;margin:auto" method="GET">
      <button type="submit" name = "action" value = "signin" class="btn">Sign in</button>
  </form></p>
  </div>
</header>


<!-- About -->
<div class="bgimg w3-text-white w3-container w3-padding-64 w3-xlarge w3-center" id="about">
  <h2><b>About</b></h2>
  <p>Evena is a personal event organiser aimed at connecting the student community.
  Unlike other Event organising platforms for business use,
  we focus on small groups and emphasis on decreasing the workload of the organisers.
  No matter who you are, as long as you are passionate in organising an event,
  <b>Try Evena now to connect with the student community.</b></p>

</div>

<!-- Footer -->
<footer class="w3-center w3-padding-48 w3-small">
  <p>Webapp-Evena</p>
</footer>

</body>
</html>