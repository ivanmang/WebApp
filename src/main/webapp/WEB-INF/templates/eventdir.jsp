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
        background-color: orangered;
        color: white;
        padding: auto;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    .btn:hover {
        opacity: 2;
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
        color: white;
        min-width: 50px;
        text-align: center;
    }

    .input-field {
        width: 100%;
        padding: 10px;
        outline: none;
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


<div class="w3-row-padding w3-margin-bottom" >
    <div class="w3-third">
        <div class="btn w3-blue w3-padding-16" onclick="changeTab('Info')">
            <div class="w3-center"><i class="fa fa-info-circle w3-xxlarge"></i><h3>Info</h3></div>
            <div class="w3-clear"></div>
        </div>
    </div>
    <div class="w3-third">
        <div class="btn w3-purple w3-padding-16" onclick="changeTab('Parti')">
            <div class="w3-center"><i class="fa fa-users w3-xxlarge"></i><h3>List of Participants</h3></div>
            <div class="w3-clear"></div>
        </div>
    </div>
    <div class="w3-third">
        <div class="btn w3-teal w3-padding-16" onclick="changeTab('InfoBoard')">
            <div class="w3-center"><i class="fa fa-file-text-o w3-xxlarge"></i><h3>Information board</h3></div>
            <div class="w3-clear"></div>
        </div>
    </div>
</div>

    <div id="Info" class="w3-container manage">
        <table class="w3-table-all w3-hoverable w3-centered w3-striped"width="50%"  align="center">
            <tr class="w3-blue">
                <th>ID</th>
                <th>Name</th>
                <th>Date</th>
                <th>About</th>
            </tr>
            <tr class="w3-form">
                <td>${id}</td>
                <td>${name}</td>
                <td>${date}</td>
                <td>${about}</td>
            </tr>
        </table>
            <div class="w3-container  w3-large">
                <form action="${pageContext.request.contextPath}/eventdir" style="max-width:500px;margin:auto" method="GET">
                    <h2>Update Event</h2>
                    <div class="input-container w3-blue">
                        <i class="fa fa-pencil-square-o icon" ></i>
                        <input class="input-field" type="text" placeholder="Name of the event?" name="name" id="name">
                    </div>

                    <div class="input-container w3-blue">
                        <i class="fa fa-calendar icon"></i>
                        <input class="input-field" type="date" name="date" id="date">
                    </div>

                    <div class="input-container w3-blue">
                        <i class="fa fa-bullhorn icon"></i>
                        <input class="input-field" type="text"  placeholder="About this event..." name="about" id="about1">
                    </div>

                    <button class="btn" type="submit" name="update" value =${id} >Edit</button>
                </form>
            </div>
    </div>

    <div id="Parti" class="w3-container manage" style="display:none">
        <table class="w3-table-all w3-hoverable w3-centered w3-striped"width="50%"  align="center">
            <tr class="w3-purple">
                <th>ID</th>
                <th>Name</th>
            </tr>
            <c:forEach items="${p_list.participants}" var="p" varStatus="status">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div id="InfoBoard" class="w3-container manage" style="display:none">
        <form action="${pageContext.request.contextPath}/eventdir" style="max-width:500px;margin:auto" method="GET">
            <h2>Add Informations</h2>
            <div class="input-container">
                <i class="fa fa-pencil-square-o icon w3-teal"></i>
                <input class="input-field" type="text" placeholder="Info?" name="info">
            </div>
            <button type="submit" name="event" value=${event} class="btn">Edit</button>
        </form>
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
