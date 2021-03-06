<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<title>Upcoming Events</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/dropdown.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/color.css" rel="stylesheet" >

<html>

<style>
  .bgimg {
    background-size: auto;
    background: url("${pageContext.request.contextPath}/resources/images/browse.png") no-repeat center;
    min-height: 30%;
  }

  input[type=text] {
    width: 120px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-size: auto;
    background: url("${pageContext.request.contextPath}/resources/images/searchicon.png");
    background-position: 10px 10px;
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
  }

  input[type=text]:focus {
    width: 100%;
  }

  /* Set a style for the search button */
  .btn {
    background-color: #FF8724;
    color: white;
    padding: auto;
    border: none;
    cursor: pointer;
    width: 50%;
    opacity: 0.9;
  }
  .btn-t {
    background-color: transparent;
    padding: auto;
    border: none;
    width: 50%;
    opacity: 0.9;
  }

  .btn:hover {
    opacity: 2;
  }

  .grid-container {
      display: grid;
      grid-template-columns: auto auto auto;
      background-color: #ffffff;
      padding: 10px;

  }
  .grid-item {
      background-color: rgba(255, 255, 255, 0.8);
      padding: 20px;
      font-size: 20px;
      text-align: center;
  }

</style>

<script src="<c:url value="/resources/js/navbar.js" />"></script>


<body class="w3-content" style="max-width:1200px">

<header class="w3-container bgimg"></header>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-text-white" id="myNavbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button"><i class="fa fa-home"></i> Home</a>

        <c:choose>
            <c:when test = "${empty username}">

                <div class="dropdown">
                    <form action="${pageContext.request.contextPath}/user_register" method="GET">
                        <button class="dropbtn" >Register
                            <i class="fa fa-user-circle"></i>
                        </button>
                    </form>
                </div>

                <div class="dropdown">
                    <form action="${pageContext.request.contextPath}/signin" method="GET">
                        <button class="dropbtn" >Sign in
                            <i class="fa fa-pencil"></i>
                        </button>
                    </form>
                </div>

            </c:when>
            <c:when test = "${username == 'out'}">

                <div class="dropdown">
                    <form action="${pageContext.request.contextPath}/user_register" method="GET">
                        <button class="dropbtn" >Register
                            <i class="fa fa-user-circle"></i>
                        </button>
                    </form>
                </div>

                <div class="dropdown">
                    <form action="${pageContext.request.contextPath}/signin" method="GET">
                        <button class="dropbtn" >Sign in
                            <i class="fa fa-pencil"></i>
                        </button>
                    </form>
                </div>

            </c:when>
            <c:otherwise>
                <div class="dropdown" id="dropDown">
                    <button class="dropbtn" >${username}
                        <i class="fa fa-user-circle"></i>
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/d_create" class="w3-button"> Create Event</a>
                        <a href="${pageContext.request.contextPath}/manage" class="w3-button"> Manage Events</a>
                        <a href="${pageContext.request.contextPath}/logout" class="w3-button"> Log Out</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white" style="z-index:3;width:250px;" id="mySidebar"><br>

  <div class="w3-bar-block">
    <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button">Home  <i class="fa fa-home"></i></a>
      <form action="${pageContext.request.contextPath}/browse" style="max-width:500px;margin:auto" method="GET">
          <button type="submit" name="academic" class="w3-bar-item w3-button" value="on">Academic Related <i class="fa fa-graduation-cap"></i> </button>
          <button type="submit" name="music" class="w3-bar-item w3-button" value="on">Arts & Music <i class="fa fa-music"></i> </button>
          <button type="submit" name="charity" class="w3-bar-item w3-button" value="on">Charitable <i class="fa fa-signing"></i> </button>
          <button type="submit" name="cultural" class="w3-bar-item w3-button" value="on">Cultural <i class="fa fa-globe"></i> </button>
          <button type="submit" name="indoor" class="w3-bar-item w3-button" value="on">Indoor <i class="fa fa-home"></i> </button>
          <button type="submit" name="outdoor" class="w3-bar-item w3-button" value="on">Outdoor <i class="fa fa-tree"></i> </button>
          <button type="submit" name="social" class="w3-bar-item w3-button" value="on">Social <i class="fa fa-handshake-o"></i> </button>
          <button type="submit" name="sport" class="w3-bar-item w3-button" value="on">Sports <i class="fa fa-soccer-ball-o"></i> </button>
          <button type="submit" name="misc" class="w3-bar-item w3-button" value="on">Other Events <i class="fa fa-sticky-note"></i> </button>
      </form>

    <div class="container">
      <form action="${pageContext.request.contextPath}/browse" style="max-width:500px;margin:auto" method="GET">
        <div class="input-container">
          <input class="input-field" type="text" placeholder="Search for event ?" name="evnm" id="evnm">
        </div>
        <button type="submit" name= "search" value="word" class="btn-t"></button>
        <button type="submit" class="btn">Show All</button>
      </form>
    </div>

  </div>
</nav>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>


<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>

    <div class="grid-container">
        <c:forEach items="${eventList.events}" var="event" varStatus="status">
            <div class="display-container">
        <div class="grid-item"> <img src="/uploads/${event.id}.png" style="width:100%">

        </div>
                <p>${event.name}<br><b>${event.location}</b><br>${event.date} - ${event.startTime} <br> <b> ${event.endTime}</b> <br>${event.about}</p>
                <div class="w3-right w3-text-white" style="background-color: #FF8724">
                    <form action="${pageContext.request.contextPath}/event" style="max-width:500px;margin:auto" method="GET">
                        <button type="submit" name="event" value=${event.id} class="w3-button" >Join Now <i class="fa fa-edit"></i></button>
                    </form>
                </div>
            </div>

        </c:forEach>
    </div>

</div>

</body>
</html>
