<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 6/5/2018
  Time: 1:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .bgimg1 {
        background-size: cover;
        background: url("${pageContext.request.contextPath}/resources/images/background1.jpg") no-repeat;
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
</style>
<head>
    <title>Create</title>
</head>
<body class = "bgimg1">
<div class="w3-container w3-padding-64 w3-large" id="create">
    <div class="container">
        <form action="${pageContext.request.contextPath}/event" style="max-width:500px;margin:auto" method="GET">
            <h2>Create a event</h2>
            <div class="input-container">
                <i class="fa fa-pencil-square-o icon"></i>
                <input class="input-field" type="text" placeholder="Name of the event?" name="ernm" id="ernm">
            </div>

            <div class="input-container">
                <i class="fa fa-calendar icon"></i>
                <input class="input-field" type="date" name="date" id="date">
            </div>

            <div class="input-container">
                <i class="fa fa-bullhorn icon"></i>
                <input class="input-field" type="text"  placeholder="About this event..." name="About" id="about1">
            </div>

            <button type="submit" name="action" value="insert" class="btn">Submit</button>
        </form>
    </div>
</div>

</body>
</html>
