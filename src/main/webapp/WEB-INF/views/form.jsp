<%@ include file="static/taglibs.resource" %>
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