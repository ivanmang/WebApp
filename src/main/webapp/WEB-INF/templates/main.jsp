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
body {font-family:"Lato", sans-serif;}
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
    background: url("${pageContext.request.contextPath}/resources/images/concert.png") no-repeat;
    min-height: 70%;
    width: 100%;
}


.bgimg {
    background-size: cover;
    background: url("${pageContext.request.contextPath}/resources/images/background.jpg") no-repeat;
    min-height: 50%;
}
.bgimg1 {
    background-size: cover;
    background: url("${pageContext.request.contextPath}/resources/images/background1.jpg") no-repeat;
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
<div class="w3-top w3-hide-small w3-text-white">
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
    <p><form action="/create" style="max-width:500px;margin:auto" method="GET">
      <button type="submit" name = "action" value = "create" class="btn">Create</button>
  </form></p>
      <p><form action="/signin" style="max-width:500px;margin:auto" method="GET">
      <button type="submit" name = "action" value = "signin" class="btn">Sign in</button>
  </form></p>
  </div>
</header>


  <!-- About Section -->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="about">
    <h2 class="w3-wide">About</h2>
    <p class="w3-opacity"><i>Evena - a personal event organiser</i></p>
    <p class="w3-justify">Evena is a personal event organiser aimed at connecting the student community. Unlike other Event organising platforms for business use, we focus on small groups and emphasis on decreasing the workload of the organisers.
    No matter who you are, as long as you are passionate in organising an event,
    <b>Try Evena now to connect with the student community.</b></p>
  </div>

   <!-- The What you can do Section -->
    <div class="bgimg1" id="whatyoucando">
      <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
        <h2 class="w3-text-white w3-wide w3-center">What you can do</h2>
        <p class="w3-text-white w3-opacity w3-center"><i>These are what we have implemented so far!</i></p><br>

        <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
          <div class="w3-third w3-margin-bottom">
            <img src="${pageContext.request.contextPath}/resources/images/create.jpg" alt="Create" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
              <p><b>Create a event</b></p>
              <p>You can create a event and share it to others</p>
              <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Create</button>
            </div>
          </div>
          <div class="w3-third w3-margin-bottom">
            <img src="${pageContext.request.contextPath}/resources/images/join.jpg" alt="Join" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
              <p><b>Join a event</b></p>
              <p>You can join a event by a simple click</p>
              <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Join Tickets</button>
            </div>
          </div>
          <div class="w3-third w3-margin-bottom">
            <img src="${pageContext.request.contextPath}/resources/images/find.jpg" alt="Find" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
              <p><b>Find some interesting event</b></p>
              <p>You can find some upcoming cool events</p>
              <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Browse Event</button>
            </div>
          </div>
        </div>
      </div>
    </div>

<!-- Footer -->
<footer class="w3-center w3-padding-48 w3-small">
  <p>Webapp-Evena</p>
</footer>

</body>
</html>