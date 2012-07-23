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
		<script type="text/javascript">
			function bytag(val) {
				var frm=document.mylink;
				frm.tagName.value = encodeURIComponent(val);
				frm.submit();
			}
		</script>
		<form name="mylink" method="GET" action="byTag">
			<input type="hidden" name="tagName">
		</form>
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
						<c:if test="${presentation.author.id != user.id}">
							(by <a href="userPresentations/${presentation.author.id}" target="_blank">${presentation.author.displayname}</a>)
						</c:if>
						<c:if test="${presentation.author.id == user.id}">
							(by you)
						</c:if>
					</h3>
				</div>
				</th>
				<tr>
					<td rowspan="2" style="width: 20%">
					<iframe width="100%" src="http://localhost:8080/XSlides/viewPresentation/${presentation.id}"></iframe>
					</td>
					<td>
						<h3>
						Theme: ${presentation.theme}
						</h3>
						<h3>
						Description:
						</h3>
						<h5>${presentation.description}</h5>
					</td>
				</tr>
				<tr>
					<td style="height: 25px">
					<c:forEach var="tag" items="${presentation.tags}" >
						<a style="text-decoration:none" href="#" onclick="bytag('${tag.name}')"><span class="label label-warning">${tag.name}</span></a>
					</c:forEach>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>