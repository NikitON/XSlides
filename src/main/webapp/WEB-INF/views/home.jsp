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
			<div class="span5">
				<button style="height: 100px; margin-bottom: 30px; margin-top: 100px" class="btn btn-success span3 offset1">BIG</button>
				<button style="height: 100px; margin-bottom: 30px" class="btn btn-success span3 offset1">BIG</button>
				<button style="height: 100px;" class="btn btn-success span3 offset1">BIG</button>
			</div>
			<c:if test="${empty tagsList }"><h1>bad</h1></c:if>
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
	    	decel: 0.9,
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
