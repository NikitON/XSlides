<%@ page language="java" pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/styles/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/bootstrap-responsive.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/styles/myStyles.less"/>" rel="stylesheet/less">
<script type="text/javascript" src="<c:url value="/resources/js/less-1.3.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.7.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<title>ACCESS DENIED</title>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp" %>
		<div class="hero-unit">
			<h1>ACCESS DENIED</h1>
			<p>You have no permission to do what you want to.</p>
			<c:if test="${message != null}"><div class="alert alert-error">${message}</div></c:if>
		</div>
	</div>
</body>
</html>
