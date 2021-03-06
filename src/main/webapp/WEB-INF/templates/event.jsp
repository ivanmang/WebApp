<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<title>WebApps-Evena</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/dropdown.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/buttons.css" rel="stylesheet" >

<style>
    body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
    body {font-size: 16px;}
    .eventSlides {display: none;}

</style>
<body class="w3-content w3-black" style="max-width:1500px;">

<script src="<c:url value="/resources/js/navbar.js" />"></script>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-text-white" id="myNavbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button"><i class="fa fa-home"></i> Home</a>

        <c:choose>
            <c:when test = "${empty username}">
                <form action="${pageContext.request.contextPath}/signin" method="GET">
                    <div class="dropdown">
                        <button class="dropbtn" >Sign in
                            <i class="fa fa-user-circle"></i>
                        </button>
                    </div>
                </form>
            </c:when>
            <c:when test = "${username == 'out'}">
                <form action="${pageContext.request.contextPath}/signin" method="GET">
                    <div class="dropdown">
                        <button class="dropbtn" >Sign in
                            <i class="fa fa-user-circle"></i>
                        </button>
                    </div>
                </form>
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

<!-- Header with Slideshow -->
<header class="w3-display-container w3-center">
    <div class="eventSlides w3-animate-opacity">
        <img src="/uploads/${id}.png" style="width:100%">
    </div>
</header>

<!-- The Event Section -->
<div class="w3-padding-64 w3-white">
    <div class="w3-row-padding">
        <div class="w3-col l8 m6">
            <h1 class="w3-jumbo"><b>${name}</b></h1>
            <h1 class="w3-xxlarge w3-text-orange"><b>${date}</b></h1>
            <h2 class="w3-xlarge w3-text-amber"><b>${startTime} - ${endTime}</b></h2>
            <h2 class="w3-large"><b>${location}</b></h2>
            <p>${about}</p>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/register" style="max-width:500px;margin:auto" method="GET">
        <button type="submit" name="eventid" value ="${id}" class="btn">Join Event</button>
    </form>
</div>

<table class="w3-table-all w3-hoverable w3-table w3-centered"width="50%"  align="center">
    <tr class="w3-orange">
        <th class="w3-text-white">Info</th>
    </tr>
    <c:forEach items="${infoList.infos}" var="infos" varStatus="status">
        <tr>
            <td><span style="color: #000000; ">${infos.info}</span></td>
        </tr>
    </c:forEach>
</table>

<script src="<c:url value="/resources/js/sideshow.js" />"></script>

<!-- Footer -->
<footer class="w3-container w3-light-grey w3-center w3-padding-48 w3-small">
    <p>Webapp-Evena @2018</p>
</footer>

</body>
</html>
