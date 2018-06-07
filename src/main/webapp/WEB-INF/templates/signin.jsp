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
        background: url("${pageContext.request.contextPath}/resources/images/signin.png") no-repeat center;
        min-height: 45%;
    }

</style>

<script src="<c:url value="${pageContext.request.contextPath}/resources/js/navbar.js" />"></script>

<head>
    <title>Sign In</title>
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
    <div class="container" style="max-width:500px;margin:auto">
            <h2>Sign In</h2>
            <div class="input-container">
                <i class="fa fa-user-o icon"></i>
                <input class="input-field" type="text" placeholder="Username">
            </div>

            <div class="input-container">
                <i class="fa fa-unlock-alt icon"></i>
                <input class="input-field" type="text" placeholder="Password">
            </div>

            <c:choose>
                <c:when test = "${action == 'create'}">
                    <form action="${pageContext.request.contextPath}/create" style="max-width:500px;margin:auto" method="GET">
                        <button type="submit" class="btn">Sign In</button>
                    </form>
                </c:when>

                <c:otherwise>
                    <form action="${pageContext.request.contextPath}/manage" style="max-width:500px;margin:auto" method="GET">
                        <button type="submit" class="btn">Sign In</button>
                    </form>
                </c:otherwise>
            </c:choose>
    </div>
</div>

<!-- Footer -->
<footer class="w3-container w3-light-grey w3-center w3-padding-48 w3-small">
    <p>Webapp-Evena @2018</p>
</footer>


</body>
</html>
