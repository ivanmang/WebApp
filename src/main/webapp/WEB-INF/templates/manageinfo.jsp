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
<table class="w3-table-all w3-hoverable w3-table w3-centered"width="50%"  align="center">
    <tr class="w3-orange">
        <th>ID</th>
        <th>Name</th>
        <th>Date</th>
        <th>About</th>
    </tr>
        <tr>
            <td>${id}</td>
            <td>${name}</td>
            <td>${date}</td>
            <td>${about}</td>
        </tr>
</table>
<div class="w3-container w3-padding-64 w3-large" id="create">
    <div class="container">
        <form action="${pageContext.request.contextPath}/manageinfo" style="max-width:500px;margin:auto" method="GET">
            <h2>Update Event</h2>
            <div class="input-container">
                <i class="fa fa-pencil-square-o icon"></i>
                <input class="input-field" type="text" placeholder="Name of the event?" name="name" id="name">
            </div>

            <div class="input-container">
                <i class="fa fa-calendar icon"></i>
                <input class="input-field" type="date" name="date" id="date">
            </div>

            <div class="input-container">
                <i class="fa fa-bullhorn icon"></i>
                <input class="input-field" type="text"  placeholder="About this event..." name="about" id="about1">
            </div>

            <button type="submit" name="update" value =${id} class="btn">Edit</button>
        </form>
    </div>
</div>
</body>
</html>
