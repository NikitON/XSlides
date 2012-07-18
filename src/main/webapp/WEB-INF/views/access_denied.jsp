<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<title><spring:message code="title.accessdenied"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="hero-unit">
			<h1><spring:message code="title.accessdenied"/></h1>
			<p><spring:message code="text.accessdenied"/></p>
			<c:if test="${errorLogged}"><div class="alert alert-error"><spring:message code="message.logged"/></div></c:if>
			<c:if test="${errorNotLogged}"><div class="alert alert-error"><spring:message code="message.notlogged"/></div></c:if>
			<c:if test="${errorNotRegistered}"><div class="alert alert-error"><spring:message code="message.notregistered"/></div></c:if>
		</div>
	</div>
</body>
</html>
