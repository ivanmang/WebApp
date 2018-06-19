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

    /* The container */
    .checkcontainer {
        display: block;
        position: relative;
        padding-left: 35px;
        margin-bottom: 12px;
        cursor: pointer;
        font-size: 15px;
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
                <i class="fa fa-globe icon"></i>
                <input class="input-field" type="text" placeholder="Location ?" name="location" id="location">
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
                <i class="fa fa-bullhorn icon"></i>
                <input class="input-field" type="text"  placeholder="About this event..." name="About" id="about1">
            </div>

            <div class="w3-container w3-cell">
                <label class="checkcontainer">Academic
                    <input type="checkbox" name="academic" id="academic">
                    <span class="checkmark"></span>
                </label>
                <label class="checkcontainer">Arts & Music
                    <input type="checkbox" name="music" id="music">
                    <span class="checkmark"></span>
                </label>
                <label class="checkcontainer">Charitable
                    <input type="checkbox" name="charity" id="charity">
                    <span class="checkmark"></span>
                </label>
            </div>
            <div class="w3-container w3-cell">
                <label class="checkcontainer">Cultural
                    <input type="checkbox" name="cultural" id="cultural">
                    <span class="checkmark"></span>
                </label>
                <label class="checkcontainer">Indoor
                    <input type="checkbox" name="indoor" id="indoor">
                    <span class="checkmark"></span>
                </label>
                <label class="checkcontainer">Outdoor
                    <input type="checkbox" name="outdoor" id="outdoor">
                    <span class="checkmark"></span>
                </label>
            </div>
            <div class="w3-container w3-cell">
                <label class="checkcontainer">Social
                    <input type="checkbox" name="social" id="social">
                    <span class="checkmark"></span>
                </label>
                <label class="checkcontainer">Sports
                    <input type="checkbox" name="misc" id="sport">
                    <span class="checkmark"></span>
                </label>
                <label class="checkcontainer">Miscellaneous
                    <input type="checkbox" name="misc" id="misc">
                    <span class="checkmark"></span>
                </label>
            </div>



            <div class="input-container">
                <div>
                <br />
                Add fields for register form
                <input class="input-field" type="text" id="member" name="member" value=""><br />
                <a href="#" id="filldetails" onclick="addFields()">Add Field</a>
                    <a href="#" id="defaultField" onclick="defaultField()">Add Default Field</a>
                </div>

            </div>

            <div>
                <div>
                <div id="field_container"/>
                    <h5>Preview</h5>

                </div>
            </div>
            <p>
            <button type="submit" id="create" name = "create" value = "" class="btn">Done</button>
            </p>
        </form>
    </div>
</div>

<script type='text/javascript'>
    var number = 1;
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
        var field = document.createElement("fieldset");
        field.appendChild(document.createTextNode(document.getElementById("member").value + " : " ));
        field.appendChild(document.createElement("input"));
        field.appendChild(document.createTextNode("    "));
        var link = document.createElement("a");
        link.setAttribute('href',"#");
        link.setAttribute('onclick',"removeField("+number+")");
        link.appendChild(document.createTextNode("Remove"));
        field.appendChild(link);
        container.appendChild(field);
        number = number + 1;

    }

    function defaultField(){
        var fields = [ "Name" , "Age" , "Gender" , "Email"]
        for (var i = 0; i < fields.length; i++) {
            var s = document.getElementById("member");
            s.value = fields[i];
            addFields();
        }
        s.value="";
    }

        function removeField(remove) {
            var s = document.getElementById("create");
            var res = s.value.split(";");
            s.value="";
            for (var i = 0; i < res.length; i++) {
                if(i !== (remove-1)){
                    if(s.value.length!==0){
                        s.value+=";";
                    }
                    s.value +=res[i];
                }

            }
            number -=1;
            var parent = document.getElementById("field_container");
            var resset = parent.getElementsByTagName("fieldset");
            var toremove = resset[remove-1];
            // parent.appendChild(document.createTextNode("number" + remove));
            // parent.appendChild(document.createTextNode("s.value" + s.value));
            parent.removeChild(toremove);
        }


</script>

<!-- Footer -->
<footer class="w3-container w3-light-grey w3-center w3-padding-48 w3-small">
    <p>Webapp-Evena @2018</p>
</footer>

</body>
</html>
