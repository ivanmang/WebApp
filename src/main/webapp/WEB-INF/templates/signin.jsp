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

<script src="<c:url value="/resources/js/navbar.js" />"></script>

<head>
    <title>Sign In</title>
</head>

<body>

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


<!-- Top header -->
<header class="w3-container bgimg"></header>

<div class="w3-container w3-padding-64 w3-large" id="create">
    <div class="container" style="max-width:500px;margin:auto">
            <h2>Sign In</h2>

                    <form action="${pageContext.request.contextPath}/signin" style="max-width:500px;margin:auto" method="POST">
                        <div class="input-container">
                            <i class="fa fa-user-o icon"></i>
                            <input class="input-field" type="text" name="username" placeholder="Username">
                        </div>

                        <div class="input-container">
                            <i class="fa fa-unlock-alt icon"></i>
                            <input class="input-field" type="text" name="password" placeholder="Password">
                        </div>
                        <c:choose>
                            <c:when test = "${action == 'create'}">
                                <button type="submit" name="action" value ="create" class="btn">Sign In</button>
                            </c:when>
                            <c:otherwise>
                                <button type="submit" name="action" value ="manage" class="btn">Sign In</button>
                            </c:otherwise>
                        </c:choose>
                    </form>

    </div>
</div>

<c:choose>
    <c:when test = "${empty alert}">
    </c:when>
    <c:otherwise>
        <script>
            alert(${alert});
        </script>
    </c:otherwise>
</c:choose>

<!-- Footer -->
<footer class="w3-container w3-light-grey w3-center w3-padding-48 w3-small">
    <p>Webapp-Evena @2018</p>
</footer>


</body>
</html>
