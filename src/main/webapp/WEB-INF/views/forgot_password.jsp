<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<title><spring:message code="title.forgotpassword"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="row">
			<div class="span4 offset4">
				<form class="well" method="POST" action="forgotPassword">
					<c:if test="${errorServer}"><div class="alert alert-error"><spring:message code="message.serverproblems"/></div></c:if>
					<c:if test="${errorNoUser}"><div class="alert alert-error"><spring:message code="message.nouser"/></div></c:if>
					<label><spring:message code="label.email"/></label> 
					<input id="email" type="text" class="span3" placeholder="<spring:message code="input.email"/>" name="email" />
					<div align="center"><button type="submit" class="btn"><spring:message code="button.send"/></button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>