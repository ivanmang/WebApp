<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/dropdown.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/buttons.css" rel="stylesheet" >

<html>
<style>
    .bgimg {
        background-size: auto;
        background: url("${pageContext.request.contextPath}/resources/images/create.png") no-repeat center;
        min-height: 45%;
    }

</style>

<script src="<c:url value="/resources/js/navbar.js" />"></script>

<head>
    <title>Create</title>
</head>

<body>
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



<!-- Top header -->
<header class="w3-container bgimg"></header>

<div class="w3-container w3-padding-64 w3-large">
    <div class="container">
        <form action="${pageContext.request.contextPath}/d_create_done" style="max-width:500px;margin:auto" method="GET">
            <h2>Create a new event</h2>
            <div class="input-container">
                <i class="fa fa-pencil-square-o icon"></i>
                <input class="input-field" type="text" placeholder="Name of the event?" name="name" id="ernm">
            </div>

            <div class="input-container">
                <i class="fa fa-calendar icon"></i>
                <input class="input-field" type="date" name="date" id="date">
            </div>

            <div class="input-container">
                <i class="fa fa-bullhorn icon"></i>
                <input class="input-field" type="text"  placeholder="About this event..." name="About" id="about1">
            </div>

            <div class="input-container">
                <div>
                <br />
                Field Name
                <input class="input-field" type="text" id="member" name="member" value=""><br />
                <a href="#" id="filldetails" onclick="addFields()">Add Field</a>
                </div>
            </div>

            <div>
                <div>
                <div id="field_container"/>

                </div>
            </div>
            <button type="submit" id="create" name = "create" value = "" class="btn">Done</button>
        </form>
    </div>
</div>

<script type='text/javascript'>
    var number = 1
    function addFields(){
        var s = document.getElementById("create");
        if (number===1) {
            s.value += document.getElementById("member").value;
        } else {
            s.value += ";";
            s.value += document.getElementById("member").value;
        }
        // Container <div> where dynamic content will be placed
        var container = document.getElementById("field_container");
        // Clear previous contents of the container
        // Append a node with a random text
        container.appendChild(document.createTextNode("Field "+number + " : " + document.getElementById("member").value));
        // Append a line break
        container.appendChild(document.createElement("br"));
        number = number + 1;

    }
</script>

<!-- Footer -->
<footer class="w3-container w3-light-grey w3-center w3-padding-48 w3-small">
    <p>Webapp-Evena @2018</p>
</footer>

</body>
</html>
