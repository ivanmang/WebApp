<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload</title>
</head>
<body>

<h2>Spring MVC file upload example</h2>

<form method="POST" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data">

    Please select a file to upload : <input type="file" name="file" />
    <input type="submit" name="eventid" value="${eventid}" />

</form>

</body>
</html>
