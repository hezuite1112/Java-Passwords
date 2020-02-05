<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<html>

<head>
	<title> luv2code Company Home Page</title>
</head>
<body>
	<h2>luv2code Company Home Page</h2>
	<hr>
	<p>
	Welcome to the luv2code company home page!
	</p>
	
	<!-- display user name and role -->
	<hr>
	<p>
		User : <security:authentication property="principal.username" />
		<br><br>
		
		Role(s) : <security:authentication property="principal.authorities" />
	</p>
	
	
	<security:authorize access="hasRole('MENAGER')">
	<!-- Add a link to point/leaders... for managers -->
	
	<p>
		<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
		(only for Manager peeps)
	</p>
	
	
	<hr>
	</security:authorize>
	
	
	<!-- Add a link to point/systems... for admin -->
	
	<security:authorize access="hasRole('ADMIN')">
	<p>
		<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
		(only for Admin peeps)
	</p>
	<hr>
	</security:authorize>
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
	
		<input type="submit" value="Logout" />
	
	</form:form>
	
</body>

</html>