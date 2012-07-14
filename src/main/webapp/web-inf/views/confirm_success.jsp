<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/styles/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/bootstrap-responsive.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/myStyles.less"/>" rel="stylesheet/less">
<script type="text/javascript" src="<c:url value="/resources/js/less-1.3.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<title>Congratulations</title>
</head>
<body>
	<div class="container">
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="home">XSlides</a>
					<ul class="nav">
						<li><a href="home">Home</a></li>
						<li><a href="about">About</a></li>
					</ul>
					<ul class="nav pull-right">
						<li><a href="login">Login</a></li>
						<li><a href="registration">Registration</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="hero-unit">
			<h1>Congratulations</h1>
			<p>Your e-mail was confirmed. Use your e-mail and password to login now.</p>
		</div>
	</div>
</body>
</html>
