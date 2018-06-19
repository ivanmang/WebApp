<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<title>Manage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/dropdown.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/buttons.css" rel="stylesheet" >

<style>
    .bgimg {
        background-size: auto;
        background: url("${pageContext.request.contextPath}/resources/images/manage.png") no-repeat center;
        min-height: 30%;
    }
</style>

<script src="<c:url value="/resources/js/navbar.js" />"></script>

<body>

<header class="w3-container bgimg"></header>

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
                        <a href="${pageContext.request.contextPath}/manage" class="w3-button"> Manage Events</a>
                        <a href="${pageContext.request.contextPath}/logout" class="w3-button"> Log Out</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-top:43px;">

    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> Current Events</b></h5>
    </header>
    <div class="w3-right">
        <form action="${pageContext.request.contextPath}/manage" style="max-width:500px;margin:auto" method="GET">
            <button type="submit" name="deleteall" value="0" class="w3-button w3-small w3-right w3-hover-red">DELETE ALL
                Events
            </button>
        </form>
    </div>
    <table class="w3-table w3-striped w3-white">
        <tr>
            <th>Event Name</th>
            <th>Date</th>
            <th>StartTime</th>
            <th>EndTime</th>
            <th>Location</th>
            <th>About</th>
        </tr>
        <c:forEach items="${eventList.events}" var="event" varStatus="status">
            <tr>
                <td>${event.name}</td>
                <td>${event.location}</td>
                <td>${event.date}</td>
                <td>${event.startTime}</td>
                <td>${event.endTime}</td>
                <td>${event.about}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/eventdir" style="max-width:100px;margin:auto"
                          method="GET">
                        <button type="submit" name="event" value=${event.id} class="btn-a">Manage</button>
                    </form>
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/upload" style="max-width:200px;margin:auto"
                          method="GET">
                        <button type="submit" name="eventid" value=${event.id} class="btn-a">Upload Icon</button>
                    </form>
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/manage" style="max-width:100px;margin:auto"
                          method="GET">
                        <button type="submit" name="delete" value=${event.id} class="btn-a">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>



</body>
</html>
