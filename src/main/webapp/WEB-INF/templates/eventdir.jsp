<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<title>Manage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/dropdown.css" rel="stylesheet" >

<style>
    .bgimg {
        background-size: auto;
        background: url("${pageContext.request.contextPath}/resources/images/manage.png") no-repeat center;
        min-height: 30%;
    }

    /* Set a style for the submit button */
    .btn {
        position: relative;
        background-color: #FF8724;
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

<script src="<c:url value="/resources/js/navbar.js" />"></script>
<script src="<c:url value="/resources/js/jquery-3.3.1.js" />"></script>
<script src="<c:url value="/resources/js/jquery.tablesorter.js" />"></script>

<script id="js">$(function() {
  $("#participants").tablesorter();
});
</script>


<body>

<header class="w3-container bgimg"></header>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-text-white" id="myNavbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button"><i class="fa fa-home"></i> Home</a>
        <a href="${pageContext.request.contextPath}/create" class="w3-bar-item w3-button"><i class="fa fa-group"></i> Create Event</a>

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


<div class="w3-main" style="margin-left:300px;margin-top:43px;">
        <h1 class="w3-xxxlarge"><b>Manage Event: ${name}</b></h1>


<div class="w3-row-padding w3-margin-bottom" >
    <div class="w3-third">
        <div class="btn w3-padding-16" onclick="changeTab('Info')" style="background-color: #FFC124">
            <div class="w3-center"><i class="fa fa-info-circle w3-xxlarge"></i><h3>Info</h3></div>
            <div class="w3-clear"></div>
        </div>
    </div>
    <div class="w3-third">
        <div class="btn w3-padding-16" onclick="changeTab('Parti')" style="background-color: #EE224A">
            <div class="w3-center"><i class="fa fa-users w3-xxlarge"></i><h3>List of Participants</h3></div>
            <div class="w3-clear"></div>
        </div>
    </div>
    <div class="w3-third">
        <div class="btn w3-padding-16" onclick="changeTab('InfoBoard')" style="background-color: #169E9E">
            <div class="w3-center"><i class="fa fa-file-text-o w3-xxlarge"></i><h3>Information board</h3></div>
            <div class="w3-clear"></div>
        </div>
    </div>
</div>

    <div id="Info" class="w3-container manage">
        <table class="w3-table-all w3-hoverable w3-centered w3-striped"width="50%"  align="center">
            <tr style="background-color: #FFC124" class="w3-text-white">
                <th>ID</th>
                <th>Name</th>
                <th>Date</th>
                <th>Start at</th>
                <th>End at</th>
                <th>Location</th>
                <th>About</th>
            </tr>
            <tr class="w3-form">
                <td>${id}</td>
                <td>${name}</td>
                <td>${date}</td>
                <td>${startTime}</td>
                <td>${endTime}</td>
                <td>${location}</td>
                <td>${about}</td>
            </tr>
        </table>
            <div class="w3-container  w3-large">
                <form action="${pageContext.request.contextPath}/eventdir" style="max-width:500px;margin:auto" method="GET">
                    <h2>Update Event</h2>
                    <div class="input-container" style="background-color: #FFC124">
                        <i class="fa fa-pencil-square-o icon" ></i>
                        <input class="input-field" type="text" placeholder="Name of the event?" name="name" id="name">
                    </div>

                    <div class="input-container" style="background-color: #FFC124">
                        <i class="fa fa-calendar icon"></i>
                        <input class="input-field" type="date" name="date" id="date">
                    </div>

                    <div class="input-container" style="background-color: #FFC124">
                        <i class="fa fa-clock-o icon"></i>
                        <input class="input-field" type="time"  name="startTime" id="startTime">
                    </div>

                    <div class="input-container" style="background-color: #FFC124">
                        <i class="fa fa-clock-o icon"></i>
                        <input class="input-field" type="time"  name="about" id="endTime">
                    </div>

                    <div class="input-container" style="background-color: #FFC124">
                        <i class="fa fa-globe icon"></i>
                        <input class="input-field" type="text"  placeholder="Location" name="about" id="location">
                    </div>

                    <div class="input-container" style="background-color: #FFC124">
                        <i class="fa fa-bullhorn icon"></i>
                        <input class="input-field" type="text"  placeholder="About this event..." name="about" id="about1">
                    </div>

                    <button class="btn" type="submit" name="update" value =${id} >Edit</button>
                </form>
            </div>
    </div>

    <div id="Parti" class="w3-container manage">
        <table id="participants" class="w3-table-all w3-hoverable w3-centered w3-striped"width="50%"  align="center">
        </table>
    </div>

    <div id="InfoBoard" class="w3-container manage">
        <form action="${pageContext.request.contextPath}/eventdir" style="max-width:500px;margin:auto" method="GET">
            <h2>Add Information</h2>
            <div class="input-container">
                <i class="fa fa-pencil-square-o icon" style="background-color:#169E9E "></i>
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

<script>
    var str = ${reg_form_format};
    var res = str.split(";");
    myFunction1(res);
    function myFunction1(res) {
        var table = document.getElementById("participants");
        var header = table.createTHead();
        var row = header.insertRow(0);
        for (i = res.length-1; i >= 0; i--) {
            var cell = row.insertCell(0);
            cell.innerHTML = res[i];
        }
    }

</script>
<c:forEach items="${data.participants}" var="p" varStatus="status">
    <script>
        str = ${p.data};
        res = str.split(";");
        var table = document.getElementById("participants");
        var row = table.insertRow(1);
        var i;
        for (i = res.length-1; i >= 0; i--) {
            var cell = row.insertCell(0);
            cell.innerHTML = res[i];
        }
    </script>
</c:forEach>

</body>
</html>
