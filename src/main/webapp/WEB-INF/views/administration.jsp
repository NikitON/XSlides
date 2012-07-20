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
							<th style="width: 13%"><spring:message code="label.administrator"/></th>
							<th style="width: 10%"></th>
							<th style="width: 15%"></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="entry" items="${userList}">
						<tr>
							<td>${entry.displayname}</td>
							<td>${entry.email}</td>
							<td><c:if test="${entry.confirmed}"><div align="center"><i class="icon-ok"></i></div></c:if></td>
							<td>
							<c:if test="${(entry.admin == true) && !(user.id == entry.id)}">
							<div align="center"><form action="switchAdmin/${entry.id}" method="POST"><button id="switchAdmin" class="btn btn-danger">
							<spring:message code="button.fromadmin"/>
							</button></form></div>
							</c:if>
							<c:if test="${(entry.admin == true) && (user.id == entry.id)}">
							<div align="center"><button id="switchAdmin" class="btn btn-danger disabled">
							<spring:message code="button.fromadmin"/>
							</button></div>
							</c:if>
							<c:if test="${entry.admin == false}">
							<div align="center"><form action="switchAdmin/${entry.id}" method="POST"><button id="switchAdmin" class="btn btn-success">
							<spring:message code="button.toadmin"/>
							</button></form></div>
							</c:if>
							</td>
							<c:if test="${user.id == entry.id}">
							<td>
							<div align="center"><button class="btn btn-danger disabled">
							<i class="icon-remove icon-white"></i> <spring:message code="button.delete"/>
							</button></div>
							</td>
							<td>
							<div align="center"><button class="btn btn-warning disabled">
							<i class="icon-envelope icon-white"></i> <spring:message code="button.newpassword"/>
							</button></div>
							</td>
							</c:if>
							<c:if test="${!(user.id == entry.id)}">
							<td>
							<div align="center"><form action="deleteUser/${entry.id}" method="POST"><button class="btn btn-danger">
							<i class="icon-remove icon-white"></i> <spring:message code="button.delete"/>
							</button></form></div>
							</td>
							<td>
							<div align="center"><form action="newPassword/${entry.id}" method="POST"><button class="btn btn-warning">
							<i class="icon-envelope icon-white"></i> <spring:message code="button.newpassword"/>
							</button></form></div>
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