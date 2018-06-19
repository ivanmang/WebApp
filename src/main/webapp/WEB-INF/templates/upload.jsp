<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload</title>
</head>
<body>

<h2>Spring MVC file upload example</h2>

<form method="POST" action="<c:url value='/upload' />"
      enctype="multipart/form-data">

    Please select a file to upload : <input type="file" name="file" />
    <input type="submit" value="upload" />

</form>

</body>
</html>
