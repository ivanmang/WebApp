<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload</title>
</head>
<body>

<h2>Spring MVC file upload example</h2>

<form method="POST" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data">

    Please select a file to upload for event ${eventid} : <input type="file" name="file" />
    <button type="submit" id="upload" name = "eventid" value=${eventid} class="btn">Upload</button>

</form>

</body>
</html>
