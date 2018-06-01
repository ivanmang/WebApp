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
    background: url("/evena/resources/images/homepage.png") no-repeat;
    min-height: 100%;
}


.bgimg {
    background-size: cover;
    background: url("/evena/resources/images/background.jpg") no-repeat;
    min-height: 50%;
}

.bgimg1 {
    background-size: cover;
    background: url("/evena/resources/images/background1.jpg") no-repeat;
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
    <a href="#create" class="w3-bar-item w3-button">Create an Event</a>
    <a href="#find" class="w3-bar-item w3-button">List of Events</a>
  </div>
</div>

<!-- Header with background image -->
<header class="homeimg w3-display-container" id="home">
  <div class="w3-display-bottommiddle w3-center">
    <p><a href="#create" class="w3-button w3-round w3-text-white w3-xlarge w3-amber">Create an Event</a></p>
    <p><a href="#find" class="w3-button w3-round w3-text-white w3-xlarge w3-amber">Ongoing Events</a></p>
  </div>
</header>


<!-- About -->
<div class="bgimg w3-text-white w3-container w3-padding-64 w3-xlarge w3-center" id="about">
  <h2><b>About</b></h2>
  <p>Evena is a personal event organiser aimed at connecting the student community.</p>
  <p>Unlike other Event organising platforms for business use, </p>
  <p>we focus on small groups and emphasis on decreasing the workload of the organisers.</p>
  <p>No matter who you are, as long as you are passionate in organising an event,</p>
  <p><b>try Evena now to connect with the student community.</b></p>

</div>

<!-- Create events form -->
<div class="w3-container w3-padding-64 w3-large" id="create">
  <div class="container">
    <form action="/evena" style="max-width:500px;margin:auto" method="GET">
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
        <i class="fa fa-bullhorn icon"></i>
        <input class="input-field" type="text"  placeholder="About this event..." name="About" id="about1">
      </div>

      <button type="submit" name="action" value="insert" class="btn">Submit</button>
    </form>
  </div>
</div>


<div class="bgimg1 w3-text-white w3-container w3-padding-64 w3-xlarge w3-center" id="find">
    <table class="w3-table-all w3-hoverable w3-table w3-centered"width="50%"  align="center">
     <tr class="w3-orange">
        <th>Event Id</th>
        <th>Event Name</th>
        <th>Date</th>
         <th>About</th>
    </tr>
    <c:forEach items="${eventList.events}" var="event" varStatus="status">
        <tr>
            <td>${event.id}</td>
            <td>${event.name}</td>
            <td>${event.date}</td>
            <td>${event.about}</td>
        </tr>
    </c:forEach>
</table>
</div>



<!-- Footer -->
<footer class="w3-center w3-padding-48 w3-small">
  <p>Webapp-Evena</p>
</footer>

</body>
</html>