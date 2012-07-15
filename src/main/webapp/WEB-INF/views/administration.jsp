<%@ include file="static/taglibs.resource" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>		
<title>Administration</title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="well">
			<c:if test="${!empty userList}">
				<style>
			 		table th, table td { overflow: hidden; }
				</style>
				<table style="table-layout: fixed" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 19%">First name</th>
							<th style="width: 19%">Last name</th>
							<th style="width: 25%">Email</th>
							<th style="width: 8%">Confirmed</th>
							<th style="width: 10%">Administration</th>
							<th style="width: 7%"></th>
							<th style="width: 12%"></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="entry" items="${userList}">
						<tr>
							<td>${entry.firstname}</td>
							<td>${entry.lastname}</td>
							<td>${entry.email}</td>
							<td><c:if test="${entry.confirmed}"><div align="center"><i class="icon-ok-sign"></i></div></c:if></td>
							<td>
							<c:if test="${(entry.admin == true) && !(user.id == entry.id)}">
							<form action="switchAdmin/${entry.id}" method="POST"><button id="switchAdmin" class="btn btn-danger">From Admin</button></form>
							</c:if>
							<c:if test="${(entry.admin == true) && (user.id == entry.id)}">
							<button id="switchAdmin" class="btn btn-danger disabled">From Admin</button>
							</c:if>
							<c:if test="${entry.admin == false}">
							<form action="switchAdmin/${entry.id}" method="POST"><button id="switchAdmin" class="btn btn-success">To Admin</button></form>
							</c:if>
							</td>
							<c:if test="${user.id == entry.id}">
							<td>
							<button class="btn btn-danger disabled">Delete</button>
							</td>
							<td>
							<button class="btn btn-warning disabled">New Password</button>
							</td>
							</c:if>
							<c:if test="${!(user.id == entry.id)}">
							<td>
							<form action="delete/${entry.id}" method="POST"><button class="btn btn-danger">Delete</button></form>
							</td>
							<td>
							<form action="newPassword/${entry.id}" method="POST"><button class="btn btn-warning">New Password</button></form>
							</td>
							</c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>