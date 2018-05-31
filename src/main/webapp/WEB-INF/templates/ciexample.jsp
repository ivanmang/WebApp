<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<h1>CIExample Web Application V2</h1>

	<c:choose>
		<c:when test="${not empty 	a && not empty b && not empty action}" >
			<h3>${a} ${action} ${b} = ${result}</h3>
			<br/>
		</c:when>
		<c:otherwise>
			<h3>Set query string parameters <b>a</b> and <b>b</b> to integers and <b>action</b> to <em>add</em> or <em>sub</em> to see a result.</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>