<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<title>Manage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    .bgimg {
        background-size: auto;
        background: url("${pageContext.request.contextPath}/resources/images/manage.png") no-repeat center;
        min-height: 30%;
    }

    /* Set a style for the submit button */
    .btn {
        position: relative;
        background-color: #ffde40;
        color: white;
        padding: 10px 10px;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    .btn:hover {
        opacity: 2;
        background-color: darkorange;
    }

</style>

<body>

<header class="w3-container bgimg"></header>

<!-- Navbar (on top) -->
<div class="w3-top w3-hide-small w3-text-white">
    <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button">Home</a>
        <a href="${pageContext.request.contextPath}/create" class="w3-bar-item w3-button">Create an Event</a>
        <a href="${pageContext.request.contextPath}/manage" class="w3-bar-item w3-button">Manage Your Events</a>
    </div>
</div>


<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s8 w3-bar">
            <span>Welcome, <strong>User</strong></span><br>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
        </div>
    </div>
    <hr>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"  title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw"></i> Profile</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i> Events You Organized</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-pencil fa-fw"></i> Events You Joined</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bell fa-fw"></i> Announcement</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Past Events</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i> Settings</a><br><br>
    </div>
</nav>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

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
            <th>About</th>
        </tr>
        <c:forEach items="${eventList.events}" var="event" varStatus="status">
            <tr>
                <td>${event.name}</td>
                <td>${event.date}</td>
                <td>${event.about}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/eventdir" style="max-width:100px;margin:auto"
                          method="GET">
                        <button type="submit" name="event" value=${event.id} class="btn">Manage</button>
                    </form>
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/manage" style="max-width:100px;margin:auto"
                          method="GET">
                        <button type="submit" name="delete" value=${event.id} class="btn">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>



</body>
</html>
