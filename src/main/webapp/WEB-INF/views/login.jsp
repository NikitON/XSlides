<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<title>Login</title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="row">
			<div class="span4 offset4">
				<form class="well" method="POST" action="login">
					<c:if test="${message != null}"><div class="alert alert-error">${message}</div></c:if>
					<c:if test="${success != null}"><div class="alert alert-success">${success}</div></c:if>
					<label class="span3">Email</label> 
					<input id="email" type="text" class="span3" placeholder="Type your email..." name="email" />
					<label class="span3">Password</label> 
					<input id="password" type="password" class="span3" placeholder="Type your password..." name="password" />
					<span class="help-block"><a class="label label-success" href="forgotPassword">Forgot your password?</a></span>
					<div align="center"><button type="submit" class="btn">Login</button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>