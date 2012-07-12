<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/styles/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/bootstrap-responsive.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/myStyles.less"/>" rel="stylesheet/less">
<script type="text/javascript" src="<c:url value="/resources/js/less-1.3.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>		
<title>Home</title>
</head>
<body>
	<div class="container">
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="home">XSlides</a>
					<ul class="nav">
						<li><a href="home">Home</a></li>
						<li><a href="#">About</a></li>

					</ul>
					<ul class="nav pull-right">
						<li><a href="login">Login</a></li>
						<li class="active"><a href="registration">Registration</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span6 offset1">
				<form:form class="well" action="register" commandName="user">
					<form:label path="firstname">First name (you can leave this field empty)</form:label> 
					<form:input type="text" class="span3" placeholder="Type your firstname..." path="firstname" />
					<form:label path="lastname">Last name (you can leave this field empty)</form:label> 
					<form:input type="text" class="span3" placeholder="Type your lastname..." path="lastname" />
					<form:label path="login">Login</form:label> 
					<form:input id="login" type="text" class="span3" placeholder="Type your login..." path="login"/>
					<script type="text/javascript">
						var loginCheck = new LiveValidation('login', { validMessage: 'Nice login!', wait: 500 });
			            loginCheck.add(Validate.Presence);		          
					</script>
					<form:label path="email">E-mail</form:label> 
					<form:input id="email" type="text" class="span3" placeholder="Type your e-mail address..." path="email"/>
					<script type="text/javascript">
						var emailCheck = new LiveValidation('email', { validMessage: 'Nice email!', wait: 500 });
						emailCheck.add(Validate.Presence);
						emailCheck.add(Validate.Email);		          
					</script>
					<form:label path="password">Password</form:label> 
					<form:input id="password" type="password" class="span3" placeholder="Type your password..." path="password"/>
					<script type="text/javascript">
						var passwordLength = new LiveValidation('password', { validMessage: 'Nice password!', wait: 500 });
						passwordLength.add(Validate.Presence);
						passwordLength.add(Validate.Length, { minimum: 7 });		          
					</script><label>Confirm password</label>
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