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
		<h1 style="margin-bottom: -40px"><spring:message code="text.welcome"/></h1>
		<div class="row">
			<div id="bigButtons" style="margin-top: 80px" class="span5">
				<c:if test="${user == null}">
					<a href="login"><button class="homebtn btn btn-success span3 offset1"><spring:message code="menu.login"/></button></a>
					<a href="registration"><button class="homebtn btn btn-success span3 offset1"><spring:message code="menu.registration"/></button></a>
					<a href="about"><button class="homebtn btn btn-success span3 offset1"><spring:message code="menu.about"/></button></a>
				</c:if>
				<c:if test="${user != null}">
					<a href="createPresentation"><button class="homebtn btn btn-success span3 offset1"><spring:message code="button.create"/></button></a>
					<a href="userPresentations/${user.id}"><button class="homebtn btn btn-success span3 offset1"><spring:message code="menu.mypresentations"/></button></a>
					<a href="about"><button class="homebtn btn btn-success span3 offset1"><spring:message code="menu.about"/></button></a>
				</c:if>
			</div>
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
			<div style="height:565px; position:relative;" class="span7" id="tagCloudContainer">
			 	<canvas id="tagCloud">
		 			<c:forEach var="tag" items="${tagsList}">
			 			<a href="#" onclick="bytag('${tag.name}')">${tag.name}</a>
			 		</c:forEach>
			 	</canvas>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
		if(!$('#tagCloud').tagcanvas({
			textFont: 'Segoe Script',
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
