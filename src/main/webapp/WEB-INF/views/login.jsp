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
<title>Login</title>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp" %>
		<div class="row">
			<div class="span4 offset4">
				<form class="well" method="POST" action="login">
					<c:if test="${message != null}"><div class="alert alert-error">${message}</div></c:if>
					<c:if test="${success != null}"><div class="alert alert-success">${success}</div></c:if>
					<label>Email</label> 
					<input id="email" type="text" class="span3" placeholder="Type your email..." name="email" />
					<label>Password</label> 
					<input id="password" type="password" class="span3" placeholder="Type your password..." name="password" />
					<span class="help-block"><a class="label label-success" href="forgotPassword">Forgot your password?</a></span>
					<div align="center"><button type="submit" class="btn">Login</button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>