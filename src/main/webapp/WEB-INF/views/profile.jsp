<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="user" value="${sessionScope.user}"/>
<link href="<c:url value="/resources/styles/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/bootstrap-responsive.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/myStyles.less"/>" rel="stylesheet/less">
<script type="text/javascript" src="<c:url value="/resources/js/less-1.3.0.min.js"/>"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<title>My presentations</title>
</head>
<body>
	<div class="container">
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="home">XSlides</a>
					<ul class="nav">
						<li class="active"><a href="home">Home</a></li>
						<li><a href="#">About</a></li>
						<c:if test="${user.admin}">
						<li><a href="administration">Administration</a></li>
						</c:if>
					</ul>
					<ul class="nav pull-right">
						<c:if test="${user == null}">
						<li><a href="login">Login</a></li>
						<li><a href="registration">Registration</a></li>
						</c:if>
						<c:if test="${user != null}">
						<li><a href="createPresentation">Create presentation</a></li>
						<li><a href="logout">Logout</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Profile	<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="settings">Settings</a></li>
								<li><a href="myPresentations">My Presentations</a></li>
							</ul>
						</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="hero-unit">
		<table>
			<c:forEach items="${presentationsList}" var="presentation">
				<tr>
				<td>${presentation.name}</td><td><a href="/xslides/viewPresentation/${ presentation.id }">View</a></td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</body>
</html>
