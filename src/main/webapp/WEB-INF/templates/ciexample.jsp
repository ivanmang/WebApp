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

.homeimg {
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url("images/homepage.png");
    min-height: 100%;
}


.bgimg {
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url("images/background.jpg");
    min-height: 50%;
}

.bgimg1 {
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url("images/background1.jpg");
    min-height: 50%;
}


.input-container {
    display: -ms-flexbox; /* IE10 */
    display: flex;
    width: 100%;
    margin-bottom: 15px;
}

/*Set style for the icons*/
.icon {
    padding: 20px;
    background: orange;
    color: white;
    min-width: 50px;
    text-align: center;
}

.input-field {
    width: 100%;
    padding: 10px;
    outline: none;
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

<body>

<!-- Navbar (on top) -->
<div class="w3-top w3-hide-small">
  <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
    <a href="#" class="w3-bar-item w3-button">Home</a>
    <a href="#about" class="w3-bar-item w3-button">About</a>
    <a href="#create" class="w3-bar-item w3-button">Create a event</a>
    <a href="#find" class="w3-bar-item w3-button">Find a event</a>
  </div>
</div>

<!-- Header with background image -->
<header class="homeimg w3-display-container" id="home">
  <div class="w3-display-bottommiddle w3-center">
    <p><a href="#create" class="w3-button w3-round w3-text-white w3-xlarge w3-amber">Create a event</a></p>
    <p><a href="#find" class="w3-button w3-round w3-text-white w3-xlarge w3-amber">Look for a event</a></p>
  </div>
</header>


<!-- About -->
<div class="bgimg w3-text-white w3-container w3-padding-64 w3-xlarge w3-center" id="about">
  <h2><b>About</b></h2>
  <p>Evena is a personal event organiser aimed at connecting the student community.</p>
  <p>Unlike other Event organising platforms for business use, </p>
  <p>we focus on small groups and emphasis on the interaction between the event organiser and participants.</p>
  <p>No matter who you are, as long as you are passionate in organising an event,</p>
  <p><b>try Evena now to connect with the student community.</b></p>

</div>

<!-- Create events form -->
<div class="w3-container w3-padding-64 w3-large" id="create">
  <div class="container">
    <form action="/index.htm" style="max-width:500px;margin:auto" method="GET">
      <center><h2>Create a event</h2></center>
      <div class="input-container">
        <i class="fa fa-pencil-square-o icon"></i>
        <input class="input-field" type="text" placeholder="Name of the event?" name="ernm" id="ernm">
      </div>

      <div class="input-container">
        <i class="fa fa-calendar icon"></i>
        <input class="input-field" type="date" name="date" id="date">
      </div>

      <div class="input-container">
        <i class="fa fa-clock-o icon"></i>
        <input class="input-field" type="time"  name="Starting Time" id="time">
      </div>

      <div class="input-container">
        <i class="fa fa-user-o icon"></i>
        <input class="input-field" type="text"  placeholder="Maximum participants" name="eventcapacity" id="eventcapacity">
      </div>

      <div class="input-container">
        <i class="fa fa-bullhorn icon"></i>
        <input class="input-field" type="text"  placeholder="About this event..." name="About" id="about1">
      </div>

      <button type="submit" name="action" value="insert" class="btn">Submit</button>
    </form>
  </div>
</div>

<c:choose>
  <c:when test="${not empty result}" >
    <h3>Terrence = ${result}</h3>
    <br/>
  </c:when>
  <c:otherwise>
    <h3>Set query string parameters <b>a</b> and <b>b</b> to integers and <b>action</b> to <em>add</em> or <em>sub</em> to see a result.</h3>
  </c:otherwise>
</c:choose>



<!-- Find a event -->
<div class="bgimg1 w3-text-white w3-container w3-padding-64 w3-xlarge w3-center" id="find">
  <h2><b>Find a event</b></h2>
  <form class="find" action="/index.htm" style="margin:auto;max-width:300px" method="GET">
    <input type="text" placeholder="Search a event name..." name="search">
    <button type="submit" name="action" value="select"><i class="fa fa-search"></i></button>
  </form>
</div>


<!-- Footer -->
<footer class="w3-center w3-padding-48 w3-small">
  <p>Webapp-Evena</p>
</footer>


</body>
</html>