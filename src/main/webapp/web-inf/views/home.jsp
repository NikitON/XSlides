<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="utf8"%>
<html>
<head>
<link href="<c:url value="/resources/styles/bootstrap.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/styles/bootstrap-responsive.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/styles/myStyles.less"/>"
	rel="stylesheet/less">
<script type="text/javascript"
	src="<c:url value="/resources/js/less-1.3.0.min.js"/>"></script>
<title>Home</title>
</head>
<body>
	<div class="container">
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="index.jsp">TurboXSlides</a>
					<ul class="nav">
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="about.jsp">About</a></li>

					</ul>
					<ul class="nav pull-right">
						<li><a href="turbo.jsp">Unbelievable!</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div>The time on the server is ${serverTime}.</div>
	</div>
</body>
</html>
