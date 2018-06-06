<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<title>WebApps-Evena</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
    body {font-size: 16px;}
    .eventSlides {display: none;}

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
<body class="w3-content w3-black" style="max-width:1500px;">

<!-- Navbar (on top) -->
<div class="w3-top w3-hide-small w3-text-white">
    <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
        <a href="${pageContext.request.contextPath}/index" class="w3-bar-item w3-button">Home</a>
        <a href="${pageContext.request.contextPath}/create" class="w3-bar-item w3-button">Create an Event</a>
        <a href="${pageContext.request.contextPath}/manage" class="w3-bar-item w3-button">Manage Your Events</a>
    </div>
</div>

<!-- Header with Slideshow -->
<header class="w3-display-container w3-center">
    <button class="w3-button w3-block w3-green w3-hide-large w3-hide-medium" onclick="document.getElementById('download').style.display='block'">Download <i class="fa fa-android"></i> <i class="fa fa-apple"></i> <i class="fa fa-windows"></i></button>
    <div class="eventSlides w3-animate-opacity">
        <img class="w3-image" src="${pageContext.request.contextPath}/resources/images/famine.jpg" alt="Image 1" style="min-width:500px">
        <div class="w3-display-left w3-padding w3-hide-small" style="width:35%">
            <div class="w3-opacity w3-hover-opacity-off w3-padding-large w3-round-large">
                <h1 class="w3-xlarge">Organiser's Name</h1>
                <hr class="w3-opacity">
                <p><button class="w3-button w3-block w3-amber w3-round" onclick="document.getElementById('organiserId').style.display='block'">About the organiser <i class="fa fa-search"></i> <i class="fa fa-male"></i></button></p>
            </div>
        </div>
    </div>
    <div class="eventSlides w3-animate-opacity">
        <img class="w3-image" src="${pageContext.request.contextPath}/resources/images/test.jpg" alt="Image 2" style="min-width:500px">
    </div>
    <div class="eventSlides w3-animate-opacity">
        <img class="w3-image" src="${pageContext.request.contextPath}/resources/images/test2.jpg" alt="Image 3" style="min-width:500px">
    </div>
    <a class="w3-button w3-black w3-display-right w3-margin-right w3-round w3-hide-small w3-hover-light-grey" onclick="plusDivs(1)">More photos <i class="fa fa-angle-right"></i></a>
    <a class="w3-button w3-block w3-black w3-hide-large w3-hide-medium" onclick="plusDivs(1)">More photos <i class="fa fa-angle-right"></i></a>
</header>

<!-- The Event Section -->
<div class="w3-padding-64 w3-white">
    <div class="w3-row-padding">
        <div class="w3-col l8 m6">
            <h1 class="w3-jumbo"><b>${name}</b></h1>
            <h1 class="w3-xxxlarge w3-text-amber"><b>${date}</b></h1>
            <p>${about}</p>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/register" style="max-width:500px;margin:auto" method="GET">
        <button type="submit" name="eventid" value = ${id} class="btn">Join Event</button>
    </form>
</div>

<table class="w3-table-all w3-hoverable w3-table w3-centered"width="50%"  align="center">
    <tr class="w3-orange">
        <th class="w3-text-white">Info</th>
    </tr>
    <c:forEach items="${infoList.infos}" var="infos" varStatus="status">
        <tr>
            <td><span style="color: #000000; ">${infos.info}</span></td>
        </tr>
    </c:forEach>
</table>


<script>
    // Slideshow
    var slideIndex = 1;
    showDivs(slideIndex);

    function plusDivs(n) {
        showDivs(slideIndex += n);
    }

    function showDivs(n) {
        var i;
        var x = document.getElementsByClassName("eventSlides");
        if (n > x.length) {slideIndex = 1}
        if (n < 1) {slideIndex = x.length}
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        x[slideIndex-1].style.display = "block";
    }
</script>

<!-- Footer -->
<footer class="w3-container w3-light-grey w3-center w3-padding-48 w3-small">
    <p>Webapp-Evena @2018</p>
</footer>

</body>
</html>
