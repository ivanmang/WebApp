<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 6/15/2018
  Time: 8:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>


    <form action="${pageContext.request.contextPath}/d_reg" style="max-width:500px;margin:auto" method="GET">
    <div id="container"/>
        <script>


            // Number of inputs to create
            var str = "Name;Sex;Love";
            var res = str.split(";");
            // Container <div> where dynamic content will be placed
            var container = document.getElementById("container");
            var i;
            for (i=0;i<res.length;i++){
                // Append a node with a random text
                container.appendChild(document.createTextNode("" + res[i]));
                // Create an <input> element, set its type and name attributes
                var input = document.createElement("input");
                input.type = "text";
                input.name = "member" + i;
                container.appendChild(input);
                // Append a line break
                container.appendChild(document.createElement("br"));
            }
        </script>
        <br>
        <button type="submit" class="btn">Join</button>
    </form>

</body>
</html>
