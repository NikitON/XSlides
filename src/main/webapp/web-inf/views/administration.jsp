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
<title>Administration</title>
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
						<li class="active"><a href="administration">Administration</a></li>
					</ul>
					<ul class="nav pull-right">
						<li><a href="logout">Logout</a></li>
						<li><a href="profile">Profile</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="well">
			<c:if test="${!empty userList}">
				<table class="table table-striped">
					<thead>
						<th>First name</th>
						<th>Last name</th>
						<th>Email</th>
						<th>Confirmed</th>
						<th>Administration</th>
						<th></th>
					</thead>
					<tbody>
					<c:forEach var="user" items="${userList}">
						<tr>
							<td>${user.firstname}</td>
							<td>${user.lastname}</td>
							<td>${user.email}</td>
							<td><c:if test="${user.confirmed}"><i class="icon-ok-sign"></i></c:if></td>
							<td>
							<c:if test="${(user.admin == true) && !(adminId == user.id)}">
							<form action="changeAdmin/${user.id}" method="POST"><button id="changeAdmin" class="btn btn-danger">From Admin</button></form>
							</c:if>
							<c:if test="${(user.admin == true) && (adminId == user.id)}">
							<button id="changeAdmin" class="btn btn-danger disabled">From Admin</button>
							</c:if>
							<c:if test="${user.admin == false}">
							<form action="changeAdmin/${user.id}" method="POST"><button id="changeAdmin" class="btn btn-success">To Admin</button></form>
							</c:if>
							</td>
							<td>
							<c:if test="${adminId == user.id}">
							<button class="btn btn-danger disabled">Delete</button>
							</c:if>
							<c:if test="${!(adminId == user.id)}">
							<form action="delete/${user.id}" method="POST"><button class="btn btn-danger">Delete</button></form>
							</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>