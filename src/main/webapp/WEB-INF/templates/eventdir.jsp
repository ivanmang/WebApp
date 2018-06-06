<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 6/5/2018
  Time: 5:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>eventdir</title>
</head>
<body>
<div class="w3-top w3-hide-small w3-text-white">
    <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button">Home</a>
        <a href="${pageContext.request.contextPath}/create" class="w3-bar-item w3-button">Create an Event</a>
        <a href="${pageContext.request.contextPath}/manage" class="w3-bar-item w3-button">Manage Your Events</a>
    </div>
</div>
<form action="${pageContext.request.contextPath}/manageinfo" style="max-width:500px;margin:auto" method="GET">
    <button type="submit" name="event" value=${event} class="btn">Info</button>
</form>
<form action="${pageContext.request.contextPath}/partilist" style="max-width:500px;margin:auto" method="GET">
    <button type="submit" name="event" value=${event} class="btn">Parti List</button>
</form>
<form action="${pageContext.request.contextPath}/manageInfoBoard" style="max-width:500px;margin:auto" method="GET">
    <button type="submit" name="event" value=${event} class="btn">Info Board</button>
</form>
</body>
</html>
