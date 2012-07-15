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
		<h2>Presentations by ${author.firstname} ${author.lastname}</h2>
		<table class="table table-bordered">
			<tbody>
			<c:forEach items="${presentationsList}" var="presentation">
				<th colspan="2">${presentation.name}</th>
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
