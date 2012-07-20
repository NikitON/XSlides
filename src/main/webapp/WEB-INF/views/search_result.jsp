<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.tagcanvas.js"/>"></script>
<title><spring:message code="title.home"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<table class="table table-bordered">
			<tbody>
			<c:if test="${empty presentationsList}">
				<tr><td colspan="2"><h3><spring:message code="text.nosearchresults"/></h3></td></tr>
			</c:if>
			<c:forEach items="${presentationsList}" var="presentation">
				<th colspan="2">
				<div class="pull-left">
					<h3>
						<a href="viewPresentation/${presentation.id}" target="_blank">${presentation.title}</a>
						(by <a href="userPresentations/${presentation.author.id}" target="_blank">${presentation.author.displayname}</a>)
					</h3>
				</div>
				<c:if test="${presentation.author.id == user.id}">
					<div class="pull-right">
						<a class="btn btn-success" href="http://localhost:8080/XSlides/resources/Strut/index.html?id=${presentation.id}" target="_blank"><i class="icon-pencil icon-white"></i> <spring:message code="button.edit"/></a>
					</div>
				</c:if>
				</th>
				<tr>
					<td rowspan="2" style="width: 25%"><a href="viewPresentation/${presentation.id}" target="_blank">First slide</a></td>
					<td>
						<h3>
						<c:if test="${presentation.author.id == user.id}">
							<a style="text-decoration:none" href="#"><span class="label label-info"><spring:message code="button.edit"/></span></a>
						</c:if>
						Theme: ${presentation.theme}
						</h3>
						<h3>
						<c:if test="${presentation.author.id == user.id}">
							<a style="text-decoration:none" href="#"><span class="label label-info"><spring:message code="button.edit"/></span></a>
						</c:if>
						Description:
						</h3>
						<h5>${presentation.description}</h5>
					</td>
				</tr>
				<tr>
					<td style="height: 25px">
					<c:if test="${presentation.author.id == user.id}">
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