<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 6/6/2018
  Time: 4:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="bgimg1 w3-text-white w3-container w3-padding-64 w3-xlarge w3-center" id="find">
    <table class="w3-table-all w3-hoverable w3-table w3-centered"width="50%"  align="center">
        <tr class="w3-orange">
            <th>ID</th>
            <th>Name</th>
        </tr>
        <c:forEach items="${p_list.participants}" var="p" varStatus="status">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
