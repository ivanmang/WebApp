<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>WebApps-Evena</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/dropdown.css" rel="stylesheet" >

<style>
body, html {height: 100%}
body {font-family:"Lato", sans-serif;}

.homeimg {
    background-size: cover;
    background: url("${pageContext.request.contextPath}/resources/images/concert2.png") no-repeat center;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    min-height: 75%;
    width: 100%;
}

.bgimg1 {
    background-size: cover;
    background: url("${pageContext.request.contextPath}/resources/images/background1.jpg") no-repeat center;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    min-height: 30%;
    width: 100%;

}

/* Set a style for the buttons */
.btn {
    background-color: #ffc315;
    color: white;
    padding: 15px 30px;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    width: 100%;
    opacity: 0.8;
}

.btn:hover {
    opacity: 2;
}

</style>

<script src="<c:url value="/resources/js/navbar.js" />"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    function disableF5(e) {
        if (e.which === 116 || e.keyCode === 116) {
            e.preventDefault();
            window.location = window.location.pathname
        }
    }

    $(function() {
        $(document).on("keydown", disableF5);
    });
</script>

<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-text-white" id="myNavbar">
    <a href="#home" class="w3-bar-item w3-button"><i class="fa fa-home"></i> Home</a>
    <a href="#about" class="w3-bar-item w3-button"><i class="fa fa-user"></i> About</a>

    <c:choose>
      <c:when test = "${empty username}">

          <div class="dropdown">
            <form action="${pageContext.request.contextPath}/user_register" method="GET">
            <button class="dropbtn" >Register
              <i class="fa fa-user-circle"></i>
            </button>
            </form>
          </div>

        <div class="dropdown">
        <form action="${pageContext.request.contextPath}/signin" method="GET">
          <button class="dropbtn" >Sign in
            <i class="fa fa-pencil"></i>
          </button>
        </form>
        </div>

      </c:when>
      <c:when test = "${username == 'out'}">

          <div class="dropdown">
            <form action="${pageContext.request.contextPath}/user_register" method="GET">
            <button class="dropbtn" >Register
              <i class="fa fa-user-circle"></i>
            </button>
            </form>
          </div>

        <div class="dropdown">
          <form action="${pageContext.request.contextPath}/signin" method="GET">
          <button class="dropbtn" >Sign in
            <i class="fa fa-pencil"></i>
          </button>
          </form>
        </div>

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



<!-- Header with background image -->
<header class="homeimg w3-display-container" id="home">
  <div class="w3-display-bottommiddle w3-center">
      <p>
      <form action="${pageContext.request.contextPath}/browse" style="max-width:500px;margin:auto" method="GET">
      <button type="submit" class="btn">Browse Events</button>
        </form>
      </p>
    <c:choose>
      <c:when test = "${empty username}">
        <p><form action="${pageContext.request.contextPath}/signin" style="max-width:500px;margin:auto" method="GET">
        <button type="submit" name = "action" value = "create" class="btn">Create Events</button>
      </form></p>
      </c:when>
      <c:when test = "${username == 'out'}">
        <p><form action="${pageContext.request.contextPath}/signin" style="max-width:500px;margin:auto" method="GET">
        <button type="submit" name = "action" value = "create" class="btn">Create Events</button>
      </form></p>
      </c:when>
      <c:otherwise>
        <p><form action="${pageContext.request.contextPath}/d_create" style="max-width:500px;margin:auto" method="GET">
        <button type="submit" class="btn">Create Events</button>
      </form></p>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test = "${empty username}">
        <p><form action="${pageContext.request.contextPath}/signin" style="max-width:500px;margin:auto" method="GET">
        <button type="submit" name = "action" value = "manage" class="btn">Manage Events</button>
      </form></p>
      </c:when>
      <c:when test = "${username == 'out'}">
        <p><form action="${pageContext.request.contextPath}/signin" style="max-width:500px;margin:auto" method="GET">
        <button type="submit" name = "action" value = "manage" class="btn">Manage Events</button>
      </form></p>
      </c:when>
      <c:otherwise>
        <p><form action="${pageContext.request.contextPath}/manage" style="max-width:500px;margin:auto" method="GET">
        <button type="submit" class="btn">Manage Events</button>
      </form></p>
      </c:otherwise>
    </c:choose>

  </div>
</header>


  <!-- About Section -->

  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="about">
    <h2 class="w3-wide">About</h2>
    <p class="w3-opacity"><i>Evena - a personal event organiser</i></p>
    <p class="w3-justify">Evena is a personal event organiser aimed at connecting the student community. Unlike other Event organising platforms for business use, we focus on small groups and emphasis on decreasing the workload of the organisers.
    No matter who you are, as long as you are passionate in organising an event,
    <b>Try Evena now to connect with the student community.</b></p>
  </div>

   <!-- The What you can do Section -->
    <div class="bgimg1" id="whatyoucando">
      <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
        <h2 class="w3-text-white w3-wide w3-center">What you can do</h2>
        <p class="w3-text-white w3-opacity w3-center"><i>These are what we have implemented so far!</i></p><br>

        <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
          <div class="w3-third w3-margin-bottom">
            <img src="/uploads/test.png" alt="Create" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
              <p><b>Create a event</b></p>
              <p>You can create a event and share it to others</p>
              <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Create</button>
            </div>
          </div>
          <div class="w3-third w3-margin-bottom">
            <img src="${pageContext.request.contextPath}/resources/images/mainjoin.jpg" alt="Join" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
              <p><b>Join a event</b></p>
              <p>You can join a event by a simple click</p>
              <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Join</button>
            </div>
          </div>
          <div class="w3-third w3-margin-bottom">
            <img src="${pageContext.request.contextPath}/resources/images/find.jpg" alt="Find" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
              <p><b>Find some interesting event</b></p>
              <p>You can find some upcoming cool events</p>
              <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Browse Events</button>
            </div>
          </div>
        </div>
      </div>
    </div>

<c:choose>
  <c:when test = "${empty alert}">
  </c:when>
  <c:otherwise>
    <script>
        alert(${alert});
    </script>
  </c:otherwise>
</c:choose>

<!-- Footer -->
<footer class="w3-container w3-light-grey w3-center w3-padding-48 w3-small">
  <p>Webapp-Evena @2018</p>
</footer>

</body>
</html>