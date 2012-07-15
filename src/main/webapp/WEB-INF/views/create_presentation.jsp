<%@ page language="java" pageEncoding="utf8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/styles/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/bootstrap-responsive.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/myStyles.less"/>" rel="stylesheet/less">
<script type="text/javascript" src="<c:url value="/resources/js/less-1.3.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.7.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<title>Create presentation</title>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp" %>
		<div class="row">
			<div class="span4 offset1">
				<form class="well" action="createPresentation" method="POST">
					<label for="name">Title</label> 
					<input type="text" class="span3" placeholder="Type presentation title..." name="name" />
					<label for="tags">Tags</label> 
					<input type="text" class="span3" placeholder="Type presentation tags..." name="tags" />
					<div align="center"><button type="submit" class="btn">Submit</button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>