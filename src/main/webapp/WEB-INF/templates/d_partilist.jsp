<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 6/15/2018
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<title>Manage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/dropdown.css" rel="stylesheet" >

<style>
    .bgimg {
        background-size: auto;
        background: url("${pageContext.request.contextPath}/resources/images/manage.png") no-repeat center;
        min-height: 30%;
    }


</style>

<script src="<c:url value="/resources/js/navbar.js" />"></script>
<body>

<header class="w3-container bgimg"></header>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-text-white" id="myNavbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button"><i class="fa fa-home"></i> Home</a>
        <a href="${pageContext.request.contextPath}/create" class="w3-bar-item w3-button"><i class="fa fa-group"></i> Create Event</a>

        <c:choose>
            <c:when test = "${empty username}">
                <form action="${pageContext.request.contextPath}/signin" method="GET">
                    <div class="dropdown">
                        <button class="dropbtn" >Sign in
                            <i class="fa fa-user-circle"></i>
                        </button>
                    </div>
                </form>
            </c:when>
            <c:when test = "${username == 'out'}">
                <form action="${pageContext.request.contextPath}/signin" method="GET">
                    <div class="dropdown">
                        <button class="dropbtn" >Sign in
                            <i class="fa fa-user-circle"></i>
                        </button>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                <div class="dropdown" id="dropDown">
                    <button class="dropbtn" >${username}
                        <i class="fa fa-user-circle"></i>
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/manage" class="w3-button"> Manage Events</a>
                        <a href="${pageContext.request.contextPath}/logout" class="w3-button"> Log Out</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Sidebar/menu -->
<div class="w3-row-padding w3-margin-bottom" >
    <table id="myTable" class="w3-table-all w3-hoverable w3-centered w3-striped"width="50%"  align="center">
    </table>
    <br>
</div>

<script>
    var str = ${reg_form_format};
    var res = str.split(";");
    myFunction1(res);
    function myFunction1(res) {
        var table = document.getElementById("myTable");
        var row = table.insertRow(0);
        var i;
        for (i = res.length-1; i >= 0; i--) {
            var cell = row.insertCell(0);
            cell.innerHTML = res[i];
        }
    }

</script>
<c:forEach items="${data.participants}" var="p" varStatus="status">
    <script>
        str = ${p.data};
        res = str.split(";");
        var table = document.getElementById("myTable");
        var row = table.insertRow(1);
        var i;
        for (i = res.length-1; i >= 0; i--) {
            var cell = row.insertCell(0);
            cell.innerHTML = res[i];
        }
    </script>
</c:forEach>
</body>
</html>
