<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
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
<title>Registration</title>
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
			<div class="span6 offset3">
				<form:form class="well" action="registration" commandName="user">
					<form:label path="firstname" class="span3">First name (you can leave this field empty)</form:label> 
					<form:input id="firstname" type="text" class="span3" placeholder="Type your firstname..." path="firstname" />
					<script type="text/javascript">
						var firstnameCheck = new LiveValidation('firstname', { wait: 500 });
						firstnameCheck.add(Validate.Length, { maximum: 40});
					</script>
					<form:label path="lastname" class="span3">Last name (you can leave this field empty)</form:label> 
					<form:input id="lastname" type="text" class="span3" placeholder="Type your lastname..." path="lastname" />
					<script type="text/javascript">
						var lastnameCheck = new LiveValidation('lastname', { wait: 500 });
						lastnameCheck.add(Validate.Length, { maximum: 40});
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