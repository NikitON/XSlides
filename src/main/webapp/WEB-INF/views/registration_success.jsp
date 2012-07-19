<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<title><spring:message code="title.congratulations"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="hero-unit">
			<h1><spring:message code="title.congratulations"/></h1>
			<p><spring:message code="text.registered"/></p>
		</div>
	</div>
</body>
</html>
