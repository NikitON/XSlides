<%@ include file="static/taglibs.resource" %>
<html>
<head>
<script type="text/javascript">

function delayer(){
    window.location = "http://localhost:8080/xslides/resources/Strut/index.html?id=${id}";
}
</script>
</head>
<body onLoad="setTimeout('delayer()', 1000)">
<h2>Prepare to be redirected!</h2>
<p>Wait, while redirecting to editor</p>

</body>
</html>