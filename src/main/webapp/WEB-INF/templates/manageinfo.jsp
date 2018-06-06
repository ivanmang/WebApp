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
</body>
</html>
