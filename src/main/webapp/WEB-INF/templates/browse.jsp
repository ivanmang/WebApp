<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<title>Upcoming Events</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<html>
<style>

    .w3-sidebar a {font-family: "Roboto", sans-serif}
    body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
    </style>


<body class="w3-content" style="max-width:1200px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-light-grey w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="#" class="w3-bar-item w3-button">Home  <i class="fa fa-home"></i></a>
    <a href="#" class="w3-bar-item w3-button">Most Recent Events</a>
    <a href="#" class="w3-bar-item w3-button">Popular Events</a>
    <a href="#" class="w3-bar-item w3-button">Music Events</a>
    <a href="#" class="w3-bar-item w3-button">Sports Events</a>
    <a href="#" class="w3-bar-item w3-button">Other Events</a>
  </div>
</nav>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>


<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>

  <!-- Top header -->
  <header class="w3-container w3-xlarge">
    <p class="w3-left">Upcoming Events</p>
    <p class="w3-right">
      <i class="fa fa-search"></i>
    </p>
  </header>


 <!-- Events grid -->
<c:forEach items="${eventList.events}" var="event" varStatus="status">
    <div class="w3-col l3 s6">
      <div class="w3-container">
        <div class="w3-display-container">
          <img src="${pageContext.request.contextPath}/resources/images/photoinvalid.jpeg" style="width:100%">
            <div class="w3-display-middle w3-display-hover w3-orange">
              <form action="${pageContext.request.contextPath}/event" style="max-width:500px;margin:auto" method="GET">
              <button type="submit" name="event"value=${event.name} class="w3-button" >Join Now <i class="fa fa-edit"></i></button>
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
