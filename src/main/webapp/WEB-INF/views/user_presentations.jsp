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
			<c:forEach items="${presentationsList}" var="presentation">
				<th colspan="2">
				<div class="pull-left">${presentation.name}</div>
				<c:if test="${author.id == user.id}">
					<div class="pull-right">
						<a class="btn btn-success" href="#"><i class="icon-pencil icon-white"></i> <spring:message code="button.edit"/></a>
						<a class="btn btn-danger" href="#"><i class="icon-remove icon-white"></i> <spring:message code="button.delete"/></a>
					</div>
				</c:if>
				</th>
				<tr>
					<td rowspan="2" style="width: 25%"><a href="viewPresentation/${presentation.id}">First slide</a></td>
					<td>
						<h3>
						<c:if test="${author.id == user.id}">
							<a style="text-decoration:none" href="#"><span class="label label-info"><spring:message code="button.edit"/></span></a>
						</c:if>
						Theme:
						</h3>
						<h3>
						<c:if test="${author.id == user.id}">
							<a style="text-decoration:none" href="#"><span class="label label-info"><spring:message code="button.edit"/></span></a>
						</c:if>
						Description:
						</h3>
						texttexttexttexttexttexttexttex ttexttextte xttext texttex tte xtt extt extte xttexttexttex ttextte x ttextt extt exttexttex ttexttextt exttextte xtte xttexttexttexttexttexttextte xttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext
					</td>
				</tr>
				<tr>
					<td style="height: 25px">
					<c:if test="${author.id == user.id}">
						<a style="text-decoration:none" href="#"><span class="label label-info"><spring:message code="button.edit"/></span></a>
					</c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
