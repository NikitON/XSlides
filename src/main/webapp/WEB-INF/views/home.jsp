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
		<div class="row">
			<div style="margin-top: 80px" class="span5">
				<c:if test="${user == null}">
					<button class="homebtn btn btn-success span3 offset1"><spring:message code="menu.login"/></button>
					<button class="homebtn btn btn-success span3 offset1"><spring:message code="menu.login"/></button>
					<button class="homebtn btn btn-success span3 offset1"><spring:message code="menu.registration"/></button>
				</c:if>
				<c:if test="${user != null}">
					<button class="homebtn btn btn-success span3 offset1"><spring:message code="button.create"/></button>
					<button class="homebtn btn btn-success span3 offset1"><spring:message code="button.create"/></button>
					<button class="homebtn btn btn-success span3 offset1"><spring:message code="menu.mypresentations"/></button>
				</c:if>
			</div>
			<div style="height:590px; position:relative;" class="span7" id="tagCloudContainer">
			 	<canvas id="tagCloud">
		 			<c:forEach var="tag" items="${tagsList}">
			 			<a href="byTag/${tag.name}">${tag.name}</a>
			 		</c:forEach>
			 	</canvas>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
		if(!$('#tagCloud').tagcanvas({
			textFont: 'Broadway',
	    	textColour : '#005700',
	    	textHeight: 60,
	    	outlineThickness : 1,
	    	outlineColour: '#000000',
	    	freezeActive: true,
	    	frontSelect: true,
	    	wheelZoom: true,
	    	reverse: true,
	    	maxSpeed: 0.06,
	    	zoom: 0.8,
	    	decel: 0.95,
	    	depth: 0.95
	  	})) {
		    $('#tagCloudContainer').hide();
		}
	});
	var canvas = document.querySelector('canvas');
	fitToContainer(canvas);
	function fitToContainer(canvas) {
	  canvas.style.width='100%';
	  canvas.style.height='100%';
	  canvas.width  = canvas.offsetWidth;
	  canvas.height = canvas.offsetHeight;
	}
	</script>
</body>
</html>
