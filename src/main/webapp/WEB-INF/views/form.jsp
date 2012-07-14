<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.7.2.min.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
$("#test").click(function(){
	$.get(
		"/xslides/saveCurrentPresentation",
		{content:"text12342424"},
		function(data){
			alert("OK");
		}
	).error(function(){alert("Error");});
	$.alert("ready");
});});
</script>
</head>
<body>
<form method="post" action="/xslides/saveCurrentPresentation">
<input name="content" />
<input type="submit" value="Submit" />
</form>
<div id="test">Test</div>
</body>