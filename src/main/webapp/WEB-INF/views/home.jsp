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
		<div class="hero-unit">
			<h1>Homepage</h1>
			<p>Welcome to XSlides - the best presentation tool ever.</p>
		</div>
		<script type="text/javascript">
		$(document).ready(function() {
			if(!$('#tagCloud').tagcanvas({
				textFont: 'Metro',
		    	textColour : '#005700',
		    	textHeight: 30,
		    	outlineThickness : 1,
		    	outlineColour: '#000000',
		    	freezeActive: true,
		    	frontSelect: true,
		    	wheelZoom: true,
		    	reverse: true,
		    	stretchX: 3,
		    	maxSpeed : 0.07,
		    	depth : 0.75
		  	})) {
			    $('#tagCloudContainer').hide();
			}
		});
		</script>
		
		<div align="center" id="tagCloudContainer">
		 	<canvas width="800" height="300" id="tagCloud">
		 	</canvas>
		</div>
	</div>
</body>
</html>
