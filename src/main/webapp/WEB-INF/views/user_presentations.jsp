<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<title><spring:message code="title.userpresentations"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<c:if test="${author.id == user.id}">
			<h2><spring:message code="text.yourpresentations"/></h2>
		</c:if>
		<c:if test="${author.id != user.id}">
			<h2><spring:message code="text.presentationsby"/> ${author.displayname}</h2>
		</c:if>
		<table class="table table-bordered">
			<tbody>
			<c:if test="${empty presentationsList}">
				<tr><td colspan="2"><h3><spring:message code="text.nopresentations"/></h3></td></tr>
			</c:if>
			<c:forEach var="presentation" items="${presentationsList}">
				<th colspan="2">
				<div class="pull-left">
					<h3>
						<a href="viewPresentation/${presentation.id}" target="_blank">${presentation.title}</a>
					</h3>
				</div>
				<c:if test="${author.id == user.id}">
					<div class="pull-right">
						<form action="deletePresentation/${presentation.id}" method="POST">
							<button class="btn btn-danger"><i class="icon-trash icon-white"></i> <spring:message code="button.delete"/></button>
						</form>
					</div>
					<div class="pull-right">
						<a class="btn btn-success" href="http://localhost:8080/XSlides/resources/Strut/index.html?id=${presentation.id}" target="_blank"><i class="icon-pencil icon-white"></i> <spring:message code="button.edit"/></a>
						
					</div>
				</c:if>
				</th>
				<tr>
					<td rowspan="2" style="width: 25%"><a href="viewPresentation/${presentation.id}" target="_blank">First slide</a></td>
					<td>
						<h3>
						<c:if test="${author.id == user.id}">
							<a style="text-decoration:none" href="#"><span class="label label-info"><spring:message code="button.edit"/></span></a>
						</c:if>
						Theme: ${presentation.theme}
						</h3>
						<h3>
						<c:if test="${author.id == user.id}">
							<a style="text-decoration:none" href="#"><span class="label label-info"><spring:message code="button.edit"/></span></a>
						</c:if>
						Description:
						</h3>
						<h5>${presentation.description}</h5>
					</td>
				</tr>
				<tr>
					<td style="height: 25px">
					<c:if test="${author.id == user.id}">
						<a style="text-decoration:none" href="#"><span class="label label-info"><spring:message code="button.edit"/></span></a>
					</c:if>
					<c:forEach var="tag" items="${presentation.tags}" >
						<a style="text-decoration:none" href="#"><span class="label label-warning">${tag.name}</span></a>
					</c:forEach>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
