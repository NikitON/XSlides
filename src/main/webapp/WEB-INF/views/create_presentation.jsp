<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/styles/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/bootstrap-responsive.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/myStyles.less"/>" rel="stylesheet/less">
<script type="text/javascript" src="<c:url value="/resources/js/less-1.3.0.min.js"/>"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<title>Create presentation</title>
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
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span4 offset1">
				<form class="well" action="createPresentation" method="POST">
					<label for="name">Title</label> 
					<input type="text" class="span3" placeholder="Type presentation title..." name="name" />
					<label for="tags">Tags</label> 
					<input type="text" class="span3" placeholder="Type presentation tags..." name="tags" />
					<div align="center"><button type="submit" class="btn">Submit</button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>