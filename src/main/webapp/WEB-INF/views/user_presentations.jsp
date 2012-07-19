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
		<h2><spring:message code="text.presentationsby"/> ${author.displayname}</h2>
		<table class="table table-bordered">
			<tbody>
			<c:if test="${empty presentationList}">
				<tr><td colspan="2"><h3><spring:message code="text.nopresentations"/></h3></td></tr>
			</c:if>
			<c:forEach items="${presentationsList}" var="presentation">
				<th colspan="2"><a href="viewPresentation/${presentation.id }" target="_blank">${presentation.name}</a> <a href="http://localhost:8080/xslides/resources/Strut/index.html?id=${presentation.id }" target="_blank">Edit</a></th>
				<tr>
					<td rowspan="2" style="width: 30%"><a href="viewPresentation/${presentation.id}">First slide</a></td>
					<td style="height: 70%">Description</td>
				</tr>
				<tr>
					<td>Tags</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
