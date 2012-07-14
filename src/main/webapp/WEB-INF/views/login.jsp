<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/styles/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/bootstrap-responsive.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/myStyles.less"/>" rel="stylesheet/less">
<script type="text/javascript" src="<c:url value="/resources/js/less-1.3.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<title>Login</title>
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
						<li class="active"><a href="login">Login</a></li>
						<li><a href="registration">Registration</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span4 offset4">
				<form class="well" method="POST" action="login">
					<c:if test="${error}">
					<div class="alert alert-error">
					${message}
					</div>
					</c:if>
					<label>Email</label> 
					<input id="email" type="text" class="span3" placeholder="Type your email..." name="email" />
					<label>Password</label> 
					<input id="password" type="password" class="span3" placeholder="password" name="password" />
					<div align="center"><button type="submit" class="btn">Login</button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>