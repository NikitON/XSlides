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
<title>My presentations</title>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp" %>
		<div class="hero-unit">
		<table>
			<c:forEach items="${presentationsList}" var="presentation">
				<tr>
				<td>${presentation.name}</td><td><a href="/xslides/viewPresentation/${ presentation.id }">View</a></td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</body>
</html>
