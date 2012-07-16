<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<title>ACCESS DENIED</title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="hero-unit">
			<h1>ACCESS DENIED</h1>
			<p>You have no permission to do what you want to.</p>
			<c:if test="${message != null}"><div class="alert alert-error">${message}</div></c:if>
		</div>
	</div>
</body>
</html>
