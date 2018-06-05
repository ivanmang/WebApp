<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 6/5/2018
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<style>
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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
    <title>Browse</title>
</head>
<body>
<div class="bgimg1 w3-text-white w3-container w3-padding-64 w3-xlarge w3-center" id="find">
    <table class="w3-table-all w3-hoverable w3-table w3-centered"width="50%"  align="center">
        <tr class="w3-orange">
            <th>Event Name</th>
            <th>Date</th>
            <th>About</th>
            <th></th>
        </tr>
        <c:forEach items="${eventList.events}" var="event" varStatus="status">
            <tr>
                <td>${event.name}</td>
                <td>${event.date}</td>
                <td>${event.about}</td>
                <td>
                    <form action="/event" style="max-width:500px;margin:auto" method="GET">
                        <button type="submit" name="event" value=${event.name} class="btn">Details</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
