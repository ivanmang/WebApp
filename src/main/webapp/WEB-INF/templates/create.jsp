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

    /* The container */
    .checkcontainer {
        display: block;
        position: relative;
        padding-left: 35px;
        margin-bottom: 12px;
        cursor: pointer;
        font-size: 22px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    /* Hide the browser's default checkbox */
    .checkcontainer input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
    }

    /* Create a custom checkbox */
    .checkmark {
        position: absolute;
        top: 0;
        left: 0;
        height: 25px;
        width: 25px;
        background-color: #eee;
    }

    /* On mouse-over, add a grey background color */
    .checkcontainer:hover input ~ .checkmark {
        background-color: #ccc;
    }

    /* When the checkbox is checked, add a background */
    .checkcontainer input:checked ~ .checkmark {
        background-color: #FFAE6B;
    }

    /* Create the checkmark/indicator (hidden when not checked) */
    .checkmark:after {
        content: "";
        position: absolute;
        display: none;
    }

    /* Show the checkmark when checked */
    .checkcontainer input:checked ~ .checkmark:after {
        display: block;
    }

    /* Style the checkmark/indicator */
    .container .checkmark:after {
        left: 9px;
        top: 5px;
        width: 5px;
        height: 10px;
        border: solid white;
        border-width: 0 3px 3px 0;
        -webkit-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        transform: rotate(45deg);
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

<div class="w3-container w3-padding-64 w3-large" id="create">
    <div class="container">
        <form action="${pageContext.request.contextPath}/event" style="max-width:500px;margin:auto" method="GET">
            <h2>Create a new event</h2>
            <div class="input-container">
                <i class="fa fa-pencil-square-o icon"></i>
                <input class="input-field" type="text" placeholder="Name of the event?" name="ernm" id="ernm">
            </div>

            <div class="input-container">
                <i class="fa fa-calendar icon"></i>
                <input class="input-field" type="date" name="date" id="date">
            </div>

            <div class="input-container">
                <i class="fa fa-clock-o icon"></i>
                <input class="input-field" type="time"  name="startTime" id="startTime">
            </div>

            <div class="input-container">
                <i class="fa fa-clock-o icon"></i>
                <input class="input-field" type="time" name="endTime" id="endTime">
            </div>

            <div class="input-container">
                <i class="fa fa-globe icon"></i>
                <input class="input-field" type="text" placeholder="Location ?" name="location" id="location">
            </div>

            <div class="input-container">
                <i class="fa fa-bullhorn icon"></i>
                <input class="input-field" type="text"  placeholder="About this event..." name="About" id="about1">
            </div>

            <label class="checkcontainer">Music
                <input type="checkbox" name="music" id="music">
                <span class="checkmark"></span>
            </label>
            <label class="checkcontainer">Sport
                <input type="checkbox" name="sport" id="sport">
                <span class="checkmark"></span>
            </label>
            <label class="checkcontainer">Miscellaneous
                <input type="checkbox" name="misc" id="misc">
                <span class="checkmark"></span>
            </label>
            <button type="submit" class="btn">Create</button>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="w3-container w3-light-grey w3-center w3-padding-48 w3-small">
    <p>Webapp-Evena @2018</p>
</footer>


</body>
</html>
