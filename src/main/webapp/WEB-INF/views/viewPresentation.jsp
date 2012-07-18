<%@ include file="static/taglibs.resource" %>
<!doctype html>
<html>
<head>
   <title>Impress.js</title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <style type="text/css">
        body  {
        background-color: #ed7;
        color: #400;
        font-size: 2em;
        }
        .step  {
        width: 1000px;
        height: 500px;
        }
        .no-support-message  {
        display: none;
        }
        .impress-not-supported .no-support-message  {
        display: block;
        color: red;
        font-size: 2em;
        }
    </style>
</head>
<body>
<div id="impress">
${html}
</div>

<script type="text/javascript" src="<c:url value="/resources/js/impress.js"/>"></script>

</body>
</html>