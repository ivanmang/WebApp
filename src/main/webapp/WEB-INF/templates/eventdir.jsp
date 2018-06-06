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
        background-color: transparent;
        color: white;
        padding: auto;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    .btn:hover {
        opacity: 2;
        background-color: orange;
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
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
           onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw"></i> Profile</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i> Events You Organized</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-pencil fa-fw"></i> Events You Joined</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bell fa-fw"></i> Announcement</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Past Events</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i> Settings</a><br><br>
    </div>
</nav>

<div class="w3-main" style="margin-left:300px;margin-top:43px;">
        <h1 class="w3-xxxlarge"><b>Manage Event: ${name}</b></h1>


<div class="w3-row-padding w3-margin-bottom">
    <div class="w3-third">
        <div class="w3-container w3-blue w3-padding-16">
            <div class="w3-center"><i class="fa fa-info-circle w3-xxlarge"></i></div>
            <button type="submit" name="event" value=${event} class="btn" onclick="changeTab('Info')">Info</button>
            <div class="w3-clear"></div>
        </div>
    </div>
    <div class="w3-third">
        <div class="w3-container w3-purple w3-padding-16">
            <div class="w3-center"><i class="fa fa-users w3-xxlarge"></i></div>
                <button type="submit" name="event" value=${event} class="btn" onclick="changeTab('Parti')">Parti List</button>
            <div class="w3-clear"></div>
        </div>
    </div>
    <div class="w3-third">
        <div class="w3-container w3-teal w3-padding-16">
            <div class="w3-center"><i class="fa fa-file-text-o w3-xxlarge"></i></div>
                <button type="submit" name="event" value=${event} class="btn" onclick="changeTab('InfoBoard')">Info Board</button>
            <div class="w3-clear"></div>
        </div>
    </div>
</div>

    <div id="Info" class="w3-container manage">
        <h2>This is info</h2>
    </div>

    <div id="Parti" class="w3-container manage" style="display:none">
        <h2>This is Parti</h2>
    </div>

    <div id="InfoBoard" class="w3-container manage" style="display:none">
        <h2>This is info board</h2>
    </div>




    <script>
        function changeTab(manage) {
            var i;
            var x = document.getElementsByClassName("manage");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            document.getElementById(manage).style.display = "block";
        }
    </script>


</div>
</body>
</html>
