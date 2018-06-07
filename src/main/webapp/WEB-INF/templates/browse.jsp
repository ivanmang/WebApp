<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<title>Upcoming Events</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/dropdown.css" rel="stylesheet" >

<html>

<style>
  .bgimg {
    background-size: auto;
    background: url("${pageContext.request.contextPath}/resources/images/browse.png") no-repeat center;
    min-height: 30%;
  }


</style>

<script src="<c:url value="${pageContext.request.contextPath}/resources/js/navbar.js" />"></script>


<body class="w3-content" style="max-width:1200px">

<header class="w3-container bgimg"></header>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-text-white" id="myNavbar">
    <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button"><i class="fa fa-home"></i> Home</a>
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

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white" style="z-index:3;width:250px;" id="mySidebar"><br>
  <div class="w3-bar-block">
    <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button">Home  <i class="fa fa-home"></i></a>
    <a href="#" class="w3-bar-item w3-button">Most Recent Events  <i class="fa fa-clock-o"></i> </a>
    <a href="#" class="w3-bar-item w3-button">Popular Events <i class="fa fa-heart"></i> </a>
    <a href="#" class="w3-bar-item w3-button">Music Events <i class="fa fa-music"></i> </a>
    <a href="#" class="w3-bar-item w3-button">Sports Events <i class="fa fa-child"></i> </a>
    <a href="#" class="w3-bar-item w3-button">Other Events <i class="fa fa-sticky-note"></i> </a>
  </div>
</nav>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>


<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>

  <!-- Top header -->
  <header class="w3-container w3-xlarge">
    <p class="w3-center">Upcoming Events</p>
    <p class="w3-right">
      <i class="fa fa-search"></i>
    </p>
  </header>


 <!-- Events grid -->
<c:forEach items="${eventList.events}" var="event" varStatus="status">
    <div class="w3-col l3 s8">
      <div class="w3-container">
        <div class="w3-display-container">
          <img src="${pageContext.request.contextPath}/resources/images/photoinvalid.jpeg" style="width:100%">
            <div class="w3-display-middle w3-display-hover w3-orange">
              <form action="${pageContext.request.contextPath}/event" style="max-width:500px;margin:auto" method="GET">
              <button type="submit" name="event"value=${event.id} class="w3-button" >Join Now <i class="fa fa-edit"></i></button>
              </form>
             </div>
        </div>
        <p>${event.name}<br><b>${event.date}</b><br>${event.about}</p>
      </div>
    </div>
</c:forEach>

</div>

</body>
</html>
