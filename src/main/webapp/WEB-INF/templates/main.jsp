<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>WebApps-Evena</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--<link href="${pageContext.request.contextPath}/resources/css/navbar.css" rel="stylesheet" >-->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
body, html {height: 100%}
body {font-family:"Lato", sans-serif;}

.homeimg {
    background-size: cover;
    background: url("${pageContext.request.contextPath}/resources/images/concert2.png") no-repeat center;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    min-height: 75%;
    width: 100%;
}

.bgimg1 {
    background-size: cover;
    background: url("${pageContext.request.contextPath}/resources/images/background1.jpg") no-repeat center;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    min-height: 30%;
    width: 100%;

}
.dropdown {
  float: right;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;
  border: none;
  outline: none;
  color: white;
  padding: 4.5px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.dropdown-content {
  right: 0;
  opacity: 0.7;
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

/* Set a style for the buttons */
.btn {
    background-color: #ffc315;
    color: white;
    padding: 15px 30px;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    width: 100%;
    opacity: 0.8;
}

.btn:hover {
    opacity: 2;
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

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-text-white" id="myNavbar">
    <a href="#home" class="w3-bar-item w3-button"><i class="fa fa-home"></i> Home</a>
    <a href="#about" class="w3-bar-item w3-button"><i class="fa fa-user"></i> About</a>
    <a href="${pageContext.request.contextPath}/create" class="w3-bar-item w3-button"><i class="fa fa-group"></i> Create Event</a>

    <div class="dropdown" id="dropDown">
      <button class="dropbtn" >Users
        <i class="fa fa-user-circle"></i>
        <i class="fa fa-caret-down"></i>
      </button>
      <div class="dropdown-content">
        <a href="${pageContext.request.contextPath}/manage" class="w3-button"> Profile</a>
        <a href="${pageContext.request.contextPath}/manage" class="w3-button"> Manage Events</a>
      </div>
    </div>
  </div>
</div>

<script>
    window.onscroll = function() {myFunction()};
    function myFunction() {
        var navbar = document.getElementById("myNavbar");
        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
            navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white" ;
            dropdown.className = "dropbtn" + " w3-text-black";
            document.getElementById('dropDown').style.visibility = 'hidden';
        } else {
            navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-white", "");
            navbar.className = "w3-bar w3-text-white";
            document.getElementById('dropDown').style.visibility = 'visable';
        }
    }
</script>

<!-- Header with background image -->
<header class="homeimg w3-display-container" id="home">
  <div class="w3-display-bottommiddle w3-center">
      <p>
      <form action="${pageContext.request.contextPath}/browse" style="max-width:500px;margin:auto" method="GET">
      <button type="submit" class="btn">Browse Events</button>
        </form>
      </p>
    <p><form action="${pageContext.request.contextPath}/signin" style="max-width:500px;margin:auto" method="GET">
      <button type="submit" name = "action" value = "create" class="btn">Create Events</button>
  </form></p>
      <p><form action="${pageContext.request.contextPath}/signin" style="max-width:500px;margin:auto" method="GET">
      <button type="submit" name = "action" value = "manage" class="btn">Manage Events</button>
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
            <img src="${pageContext.request.contextPath}/resources/images/maincreate.jpg" alt="Create" style="width:100%" class="w3-hover-opacity">
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
              <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Join</button>
            </div>
          </div>
          <div class="w3-third w3-margin-bottom">
            <img src="${pageContext.request.contextPath}/resources/images/find.jpg" alt="Find" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
              <p><b>Find some interesting event</b></p>
              <p>You can find some upcoming cool events</p>
              <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Browse Events</button>
            </div>
          </div>
        </div>
      </div>
    </div>

<!-- Footer -->
<footer class="w3-container w3-light-grey w3-center w3-padding-48 w3-small">
  <p>Webapp-Evena @2018</p>
</footer>

</body>
</html>