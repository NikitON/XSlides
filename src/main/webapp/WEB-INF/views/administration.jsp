<%@ include file="static/taglibs.resource" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>		
<title><spring:message code="title.administration"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="well">
		<c:if test="${errorServer}"><div class="alert alert-error"><spring:message code="message.serverproblems"/></div></c:if>
			<c:if test="${!empty userList}">
				<style>
				 		table th, table td { overflow: hidden; }
				</style>
				<table style="table-layout: fixed" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th><spring:message code="label.displayname"/></th>
							<th><spring:message code="label.email"/></th>
							<th style="width: 10%"><spring:message code="label.confirmed"/></th>
							<th style="width: 10%"><spring:message code="label.administration"/></th>
							<th style="width: 7%"></th>
							<th style="width: 13%"></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="entry" items="${userList}">
						<tr>
							<td>${entry.displayname}</td>
							<td>${entry.email}</td>
							<td><c:if test="${entry.confirmed}"><div align="center"><i class="icon-ok-sign"></i></div></c:if></td>
							<td>
							<c:if test="${(entry.admin == true) && !(user.id == entry.id)}">
							<form action="switchAdmin/${entry.id}" method="POST"><button id="switchAdmin" class="btn btn-danger"><spring:message code="button.fromadmin"/></button></form>
							</c:if>
							<c:if test="${(entry.admin == true) && (user.id == entry.id)}">
							<button id="switchAdmin" class="btn btn-danger disabled"><spring:message code="button.fromadmin"/></button>
							</c:if>
							<c:if test="${entry.admin == false}">
							<form action="switchAdmin/${entry.id}" method="POST"><button id="switchAdmin" class="btn btn-success"><spring:message code="button.toadmin"/></button></form>
							</c:if>
							</td>
							<c:if test="${user.id == entry.id}">
							<td>
							<button class="btn btn-danger disabled"><spring:message code="button.delete"/></button>
							</td>
							<td>
							<button class="btn btn-warning disabled"><spring:message code="button.newpassword"/></button>
							</td>
							</c:if>
							<c:if test="${!(user.id == entry.id)}">
							<td>
							<form action="delete/${entry.id}" method="POST"><button class="btn btn-danger"><spring:message code="button.delete"/></button></form>
							</td>
							<td>
							<form action="newPassword/${entry.id}" method="POST"><button class="btn btn-warning"><spring:message code="button.newpassword"/></button></form>
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