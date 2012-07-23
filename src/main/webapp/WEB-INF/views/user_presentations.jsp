<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.tagsinput.js"/>"></script>
<link href="<c:url value="/resources/styles/jquery.tagsinput.css"/>" rel="stylesheet"/>
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
				<tr><td colspan="2"><h3><spring:message code="text.nopresentations"/></h3></td></tr>
			</c:if>
			<c:forEach var="presentation" items="${presentationsList}">
				<th colspan="2">
				<div class="pull-left">
					<h3>
						<c:if test="${author.id == user.id}">
							<a class="edittitle" style="text-decoration:none" data-id="${presentation.id}" href="#changeTitle">
								<span class="label label-info"><spring:message code="button.edit"/></span>
							</a>
						</c:if>
						<a href="viewPresentation/${presentation.id}" target="_blank">${presentation.title}</a>
					</h3>
				</div>
				<c:if test="${author.id == user.id}">
					<div class="pull-right">
						<form action="deletePresentation/${presentation.id}" method="POST">
							<button class="btn btn-danger"><i class="icon-trash icon-white"></i> <spring:message code="button.delete"/></button>
						</form>
					</div>
					<div style="padding: 0 5px 0 0" class="pull-right">
						<a class="btn btn-success" href="http://localhost:8080/XSlides/resources/Strut/index.html?id=${presentation.id}"><i class="icon-pencil icon-white"></i> <spring:message code="button.edit"/></a>
					</div>
				</c:if>
				</th>
				<tr>
					<td rowspan="2" style="width: 20%">
					<iframe width="100%" src="http://localhost:8080/XSlides/viewPresentation/${presentation.id}"></iframe>
					</td>
					<td>
						<h3>
						<c:if test="${author.id == user.id}">
							<a class="edittheme" style="text-decoration:none" data-id="${presentation.id}" href="#changeTheme">
								<span class="label label-info"><spring:message code="button.edit"/></span>
							</a>
						</c:if>
						Theme: ${presentation.theme}
						</h3>
						<h3>
						<c:if test="${author.id == user.id}">
							<a class="editdescription" style="text-decoration:none" data-id="${presentation.id}" href="#changeDescription">
								<span class="label label-info"><spring:message code="button.edit"/></span>
							</a>
						</c:if>
						Description:
						</h3>
						<h5>${presentation.description}</h5>
					</td>
				</tr>
				<tr>
					<td style="height: 25px">
					<c:if test="${author.id == user.id}">
						<a class="edittags" style="text-decoration:none" data-id="${presentation.id}" href="#changeTags">
							<span class="label label-info"><spring:message code="button.edit"/></span>
						</a>
					</c:if>
					<c:forEach var="tag" items="${presentation.tags}" >
						<a style="text-decoration:none" href="#" onclick="bytag('${tag.name}')"><span class="label label-warning">${tag.name}</span></a>
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
  		<form method="POST" action="newTitle">
	  		<div class="modal-body">
	  			<input type="hidden" name="titleId" id="titleId"/>
	    		<label class="span3"><spring:message code="label.newtitle"/></label> 
				<input id="title" type="text" class="span3" placeholder="<spring:message code="input.title"/>" name="title" />
				<script type="text/javascript">
					var titleCheck = new LiveValidation('title', {validMessage: '<spring:message code="valid.title"/>',  wait: 500 });
					titleCheck.add(Validate.Presence, {failureMessage: "<spring:message code="invalid.cantbeempty"/>"});
					titleCheck.add(Validate.Length, {tooLongMessage: '<spring:message code="invalid.length120"/>', maximum: 120});
				</script>
	  		</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-success">
			    <i class="icon-ok icon-white"></i> <spring:message code="button.savechanges"/>
			    </button>
			</div>
		</form>
	</div>
	<div class="modal fade hide" id="changeTheme">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal"><spring:message code="button.close"/></button>
    		<h3><spring:message code="label.changetheme"/></h3>
  		</div>
  		<form method="POST" action="newTheme">
	  		<div class="modal-body">
	  			<input type="hidden" name="themeId" id="themeId"/>
	    		<label class="span3"><spring:message code="label.newtheme"/></label> 
				<input id="theme" type="text" class="span3" placeholder="<spring:message code="input.theme"/>" name="theme" />
				<script type="text/javascript">
					var themeCheck = new LiveValidation('theme', { validMessage: ' ', wait: 500 });
					themeCheck.add(Validate.Length, {tooLongMessage: '<spring:message code="invalid.length120"/>', maximum: 120});
				</script>
	  		</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-success">
			    <i class="icon-ok icon-white"></i> <spring:message code="button.savechanges"/>
			    </button>
			</div>
		</form>
	</div>
	<div class="modal fade hide" id="changeDescription">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal"><spring:message code="button.close"/></button>
    		<h3><spring:message code="label.changedescription"/></h3>
  		</div>
  		<form method="POST" action="newDescription">
	  		<div class="modal-body">
	  			<input type="hidden" name="descriptionId" id="descriptionId"/>
	    		<label class="span3"><spring:message code="label.newdescription"/></label> 
				<textarea id="description" class="span5" rows="6" placeholder="<spring:message code="input.description"/>" name="description"></textarea>
	  		</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-success">
			    <i class="icon-ok icon-white"></i> <spring:message code="button.savechanges"/>
			    </button>
			</div>
		</form>
	</div>
	<div class="modal fade hide" id="changeTags">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal"><spring:message code="button.close"/></button>
    		<h3><spring:message code="label.changetags"/></h3>
  		</div>
  		<form method="POST" action="newTags">
	  		<div class="modal-body">
	  			<input type="hidden" name="tagsId" id="tagsId"/>
	    		<label class="span3"><spring:message code="label.newtags"/></label> 
				<input id="tags" type="text" name="tags" placeholder="mytxt"/>
				<script type="text/javascript">
					var tagCheck = new LiveValidation('tags', {validMessage: ' ',  wait: 500 });
					tagCheck.add(Validate.Presence, {failureMessage: "<spring:message code="invalid.cantbeempty"/>"});
					$('#tags').tagsInput();
				</script>
	  		</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-success">
			    <i class="icon-ok icon-white"></i> <spring:message code="button.savechanges"/>
			    </button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
	    $(".edittitle").click(function() {
	        $("#titleId").val($(this).data('id'));
	        $('#changeTitle').modal('show');
		});
	    $(".edittheme").click(function() {
	        $("#themeId").val($(this).data('id'));
	        $('#changeTheme').modal('show');
		});
	    $(".editdescription").click(function() {
	        $("#descriptionId").val($(this).data('id'));
	        $('#changeDescription').modal('show');
		});
	    $(".edittags").click(function() {
	        $("#tagsId").val($(this).data('id'));
	        $('#changeTags').modal('show');
		});
	});
   </script>
</body>
</html>
