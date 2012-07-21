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
						<form style="margin: 0 0 0 0" action="deletePresentation/${presentation.id}" method="POST">
							<button class="btn btn-danger"><i class="icon-trash icon-white"></i> <spring:message code="button.delete"/></button>
						</form>
					</div>
					<div style="padding: 0 5px 0 0" class="pull-right">
						<a class="btn btn-success" href="http://localhost:8080/XSlides/resources/Strut/index.html?id=${presentation.id}" target="_blank"><i class="icon-pencil icon-white"></i> <spring:message code="button.edit"/></a>
					</div>
				</c:if>
				</th>
				<tr>
					<td rowspan="2" style="width: 25%"><a href="viewPresentation/${presentation.id}" target="_blank">First slide</a></td>
					<td>
						<h3>
						<c:if test="${author.id == user.id}">
							<c:url var="changeTitle" value="#changeTitle">
					            <c:param name="id" value="${presentation.id}" />
					        </c:url>
							<a style="text-decoration:none" data-toggle="modal" href="${changeTitle}"><span class="label label-info"><spring:message code="button.edit"/></span></a>
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
						<a style="text-decoration:none" href="byTag/${tag.name}"><span class="label label-warning">${tag.name}</span></a>
					</c:forEach>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="modal fade hide" id="changeTitle">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal"><spring:message code="button.close"/></button>
    		<h3><spring:message code="label.changetitle"/></h3>
  		</div>
  		<form style="margin: 0 0 0 0" method="POST" action="newTitle/${id}">
	  		<div class="modal-body">
	    		<label class="span3"><spring:message code="label.newtitle"/></label> 
				<input id="title" type="text" class="span3" placeholder="<spring:message code="input.title"/>" name="title" />
				<script type="text/javascript">
					var titleCheck = new LiveValidation('title', {validMessage: 'Nice title!',  wait: 500 });
					titleCheck.add(Validate.Presence);
					titleCheck.add(Validate.Format, {pattern: /^[\w]+$/ } );
					titleCheck.add(Validate.Length, {maximum: 120});
				</script>
	  		</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-success">
			    <i class="icon-ok icon-white"></i> <spring:message code="button.savechanges"/>
			    </button>
			</div>
		</form>
	</div>
</body>
</html>
