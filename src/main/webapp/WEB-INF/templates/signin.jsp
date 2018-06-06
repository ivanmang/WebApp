<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<style>
    .bgimg {
        background-size: auto;
        background: url("${pageContext.request.contextPath}/resources/images/signin.png") no-repeat center;
        min-height: 45%;
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
        background: orange;
        color: white;
        min-width: 50px;
        text-align: center;
    }

    .input-field {
        width: 100%;
        padding: 10px;
        outline: none;
    }

    /* Set a style for the submit button */
    .btn {
        background-color: orange;
        color: white;
        padding: 15px 20px;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    .btn:hover {
        opacity: 2;
    }

</style>
<head>
    <title>Sign In</title>
</head>

<body>

<!-- Navbar (on top) -->
<div class="w3-top w3-hide-small w3-text-white">
    <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button">Home</a>
        <a href="${pageContext.request.contextPath}/create" class="w3-bar-item w3-button">Create an Event</a>
        <a href="${pageContext.request.contextPath}/manage" class="w3-bar-item w3-button">Manage Your Events</a>
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
