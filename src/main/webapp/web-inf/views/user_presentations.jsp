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
		<table class="table table-bordered">
			<caption><h2>Presentations by ${author.firstname} ${author.lastname}</h2></caption>
			<tbody>
			<c:forEach items="${presentationsList}" var="presentation">
				<th colspan="2">${presentation.name}</th>
				<tr>
					<td rowspan="2" style="width: 30%">First slide</td>
					<td style="height: 70%">Description</td>
				</tr>
				<tr>
					<td>Tags</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
