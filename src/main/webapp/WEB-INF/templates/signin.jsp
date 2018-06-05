<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 6/5/2018
  Time: 1:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    body, html {height: 100%}
    body {font-family: Tahoma, Geneva, sans-serif;}
    table, td, th {
        border: 1px solid #ddd;
    }

    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        text-align: left;
        padding: 40px;
    }

    th {
        background-color: orange;
    }

    .homeimg {
        background-size: cover;
        background: url("/resources/images/homepage.png") no-repeat;
        min-height: 100%;
    }


    .bgimg {
        background-size: cover;
        background: url("/resources/images/background.jpg") no-repeat;
        min-height: 50%;
    }

    .bgimg1 {
        background-size: cover;
        background: url("/resources/images/background1.jpg") no-repeat;
        min-height: 50%;
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
<body class="bgimg1">
<div class="input-container">
    <i class="fa fa-bullhorn icon"></i>
    <input class="input-field" type="text"  placeholder="Username">
</div>

<div class="input-container">
    <i class="fa fa-bullhorn icon"></i>
    <input class="input-field" type="text"  placeholder="Password">
</div>
<c:choose>

    <c:when test = "${action == 'create'}">
        <form action="/create" style="max-width:500px;margin:auto" method="GET">
            <button type="submit" class="btn">Sign In</button>
        </form>
    </c:when>

    <c:otherwise>
        <form action="/orgdir" style="max-width:500px;margin:auto" method="GET">
            <button type="submit" class="btn">Sign In</button>
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
