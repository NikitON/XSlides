<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<title><spring:message code="title.createpresentation"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="row">
			<div class="span8 offset2">
				<form class="well" action="createPresentation" method="POST">
					<label for="name">Presentation title</label> 
					<input type="text" class="span3" placeholder="Type presentation title..." name="name" />
					<label for="tags">Tags</label> 
					<input type="text" class="span3" placeholder="Type presentation tags..." name="tags" />
					<div align="center"><button type="submit" class="btn btn-success">Create</button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>