<%@ include file="static/taglibs.resource" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>		
<title>Registration</title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="row">
			<div class="span6 offset3">
				<form:form class="well" action="registration" commandName="user">
					<c:if test="${message != null}"><div class="alert alert-error">${message}</div></c:if>
					<form:label path="displayname" class="span3">Display name</form:label> 
					<form:input id="displayname" type="text" class="span3" placeholder="Type as you'll be seen by others..." path="displayname" />
					<script type="text/javascript">
						var displaynameCheck = new LiveValidation('displayname', {validMessage: 'Nice name!',  wait: 500 });
						displaynameCheck.add(Validate.Presence);
						displaynameCheck.add(Validate.Length, {maximum: 40});
					</script>
					<form:label path="email" class="span3">E-mail</form:label> 
					<form:input id="email" type="text" class="span3" placeholder="Type your e-mail address..." path="email"/>
					<script type="text/javascript">
						var emailCheck = new LiveValidation('email', { validMessage: 'Nice email!', wait: 500 });
						emailCheck.add(Validate.Presence);
						emailCheck.add(Validate.Email);		          
						emailCheck.add(Validate.Length, { maximum: 60});
					</script>
					<form:label path="password" class="span3">Password</form:label> 
					<form:input id="password" type="password" class="span3" placeholder="Type your password..." path="password"/>
					<script type="text/javascript">
						var passwordLength = new LiveValidation('password', { validMessage: 'Nice password!', wait: 500 });
						passwordLength.add(Validate.Presence);
						passwordLength.add(Validate.Length, { minimum: 7 });
						passwordLength.add(Validate.Length, { maximum: 40});
					</script>
					<label class="span3">Confirm password</label>
					<input id="confirm" type="password" class="span3" placeholder="Confirm your password..." />
					<script type="text/javascript">
						var passwordConfirm = new LiveValidation('confirm', { validMessage: 'Passwords are equal.', wait: 500 });
						passwordConfirm.add(Validate.Confirmation, { match: 'password' });		          
					</script>
					<div align="center"><button type="submit" class="btn">Register me!</button></div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>