<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 6/6/2018
  Time: 4:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="w3-top w3-hide-small w3-text-white">
    <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button">Home</a>
        <a href="${pageContext.request.contextPath}/create" class="w3-bar-item w3-button">Create an Event</a>
        <a href="${pageContext.request.contextPath}/manage" class="w3-bar-item w3-button">Manage Your Events</a>
    </div>
</div>
<form action="${pageContext.request.contextPath}/manageInfoBoard" style="max-width:500px;margin:auto" method="GET">
    <h2>Add Info</h2>
    <div class="input-container">
        <i class="fa fa-pencil-square-o icon"></i>
        <input class="input-field" type="text" placeholder="Info?" name="info" id="info">
    </div>
    <button type="submit" name="event" value=${event} class="btn">Edit</button>
</form>
</body>
</html>
