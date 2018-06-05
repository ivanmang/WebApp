<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 6/5/2018
  Time: 1:49 AM
  To change this template use File | Settings | File Templates.
--%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<style>
    .bgimg {
        background-size: auto;
        background: url("${pageContext.request.contextPath}/resources/images/create.png") no-repeat center;
        min-height: 45%;
    }


    .input-container {
        display: -ms-flexbox; /* IE10 */
        display: flex;
        width: 100%;
        margin-bottom: 15px;
    }

    /*Set style for the icons*/
    .icon {
        padding: 20px;
        background: orange;
        color: white;
        min-width: 50px;
        text-align: center;
    }

    .input-field {
        width: 100%;
        padding: 10px;
        outline: none;
    }

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
<head>
    <title>Create</title>
</head>

<body>

<!-- Top header -->
<header class="w3-container bgimg"></header>

<!-- Navbar (on top) -->
<div class="w3-top w3-hide-small w3-text-white">
    <div class="w3-bar w3-xlarge w3-opacity " id="navbar">
        <a href="#" class="w3-bar-item w3-button">Home</a>
        <a href="#about" class="w3-bar-item w3-button">About</a>
        <a href="#create" class="w3-bar-item w3-button">Create an Event</a>
        <a href="#find" class="w3-bar-item w3-button">List of Events</a>
    </div>
</div>


<div class="w3-container w3-padding-64 w3-large" id="create">
    <div class="container">
        <form action="${pageContext.request.contextPath}/event" style="max-width:500px;margin:auto" method="GET">
            <h2>Create a new event</h2>
            <div class="input-container">
                <i class="fa fa-pencil-square-o icon"></i>
                <input class="input-field" type="text" placeholder="Name of the event?" name="ernm" id="ernm">
            </div>

            <div class="input-container">
                <i class="fa fa-calendar icon"></i>
                <input class="input-field" type="date" name="date" id="date">
            </div>

            <div class="input-container">
                <i class="fa fa-bullhorn icon"></i>
                <input class="input-field" type="text"  placeholder="About this event..." name="About" id="about1">
            </div>

            <button type="submit" name="action" value="insert" class="btn">Submit</button>
        </form>
    </div>
</div>


</body>
</html>
