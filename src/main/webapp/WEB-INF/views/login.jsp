<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<title><spring:message code="title.login"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="row">
			<div class="span4 offset4">
				<form class="well" method="POST" action="login">
					<c:if test="${errorEmail}"><div class="alert alert-error"><spring:message code="message.wrongemailorpassword"/></div></c:if>
					<c:if test="${errorCheck}"><div class="alert alert-error"><spring:message code="message.checkemail"/></div></c:if>
					<c:if test="${newSended}"><div class="alert alert-success"><spring:message code="message.newpassword"/></div></c:if>
					<label class="span3"><spring:message code="label.email"/></label> 
					<input id="email" type="text" class="span3" placeholder="<spring:message code="input.email"/>" name="email" />
					<label class="span3"><spring:message code="label.password"/></label> 
					<input id="password" type="password" class="span3" placeholder="<spring:message code="input.password"/>" name="password" />
					<span class="help-block"><a class="label label-success" href="forgotPassword"><spring:message code="label.forgotpassword"/></a></span>
					<div align="center"><button type="submit" class="btn"><spring:message code="button.login"/></button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>