<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<title>My presentations</title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<h2>Presentations by ${author.displayname}</h2>
		<table class="table table-bordered">
			<tbody>
			<c:if test="${empty presentationList}">
				<tr><td><h3>User have no presentations yet</h3></td></tr>
			</c:if>
			<c:forEach items="${presentationsList}" var="presentation">
				<th colspan="2"><a href="viewPresentation/${presentation.id }" target="_blank">${presentation.name}</a> <a href="http://localhost:8080/xslides/resources/Strut/index.html?id=${presentation.id }" target="_blank">Edit</a></th>
				<tr>
					<td rowspan="2" style="width: 30%">First slide</td>
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
