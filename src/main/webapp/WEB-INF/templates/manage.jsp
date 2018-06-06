<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<title>Manage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body>

<!-- Navbar (on top) -->
<div class="w3-top w3-hide-small w3-text-white">
    <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button">Home</a>
        <a href="${pageContext.request.contextPath}/create" class="w3-bar-item w3-button">Create an Event</a>
        <a href="${pageContext.request.contextPath}/manage" class="w3-bar-item w3-button">Manage Your Events</a>
    </div>
</div>

<form action="${pageContext.request.contextPath}/manage" style="max-width:500px;margin:auto" method="GET">
    <button type="submit" name="deleteall" value="0" class="btn">DELETEALLLLLLLLLLLLLL</button>
</form>

<div class="bgimg1 w3-text-white w3-container w3-padding-64 w3-xlarge w3-center" id="find">
    <table class="w3-table-all w3-hoverable w3-table w3-centered"width="50%"  align="center">
        <tr class="w3-orange">
            <th>Event Name</th>
            <th>Date</th>
            <th>About</th>
            <th>Manage</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${eventList.events}" var="event" varStatus="status">
            <tr>
                <td>${event.name}</td>
                <td>${event.date}</td>
                <td>${event.about}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/eventdir" style="max-width:500px;margin:auto" method="GET">
                        <button type="submit" name="event" value=${event.id} class="btn">Manage</button>
                    </form>
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/manage" style="max-width:500px;margin:auto" method="GET">
                        <button type="submit" name="delete" value=${event.id} class="btn">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
