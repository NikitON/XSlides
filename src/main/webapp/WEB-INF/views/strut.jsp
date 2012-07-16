<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" pageEncoding="utf8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<META HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
		<META http-equiv="expires" content="0">
		<META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>Strut - ALPHA</title>
		<link rel="stylesheet" href="<c:url value="/resources/Strut/res/css/close-btn.css"/>"></link>
		<link rel="stylesheet" href="<c:url value="/resources/Strut/res/css/bootstrap.css"/>"></link>
		<link rel="stylesheet" href="<c:url value="/resources/Strut/res/css/main.css"/>"></link>
		<link rel="stylesheet" href="<c:url value="/resources/Strut/res/jqplugins/colorpicker/css/colorpicker.css"/>" type="text/css" />
		<link rel="stylesheet" href="<c:url value="/resources/Strut/res/jqplugins/gradient_picker/jquery.gradientPicker.css"/>" type="text/css" />
		<link href="<c:url value="/resources/Strut/preview_export/css/web-fonts.css"/>" rel='stylesheet' type='text/css'>
		<script type="text/javascript" src="<c:url value="/resources/Strut/scripts/vendor/A-jquery-1.7-matt.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/Strut/scripts/vendor/B-jqueryUI.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/Strut/scripts/vendor/C-underscore.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/Strut/scripts/vendor/D-bootstrap.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/Strut/scripts/vendor/E-bootstrapDropdown.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/Strut/res/jqplugins/colorpicker/js/colorpicker.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/Strut/res/jqplugins/gradient_picker/jquery.gradientPicker.js"/>"></script>
    	<script>
    	jQuery.fn.selectText = function(){
		    var doc = document;
		    var element = this[0];
		    if (doc.body.createTextRange) {
		        var range = document.body.createTextRange();
		        range.moveToElementText(element);
		        range.select();
		    } else if (window.getSelection) {
		        var selection = window.getSelection();        
		        var range = document.createRange();
		        range.selectNodeContents(element);
		        selection.removeAllRanges();
		        selection.addRange(range);
		    }
		    return this;
		};
    	</script>
    	
		<script type="text/javascript" data-main="/xslides/resources/Strut/scripts/main" src="<c:url value="/resources/Strut/scripts/require.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/Strut/preview_export/scripts/impress.js"/>"></script>
	</head>
	<body>
	</body>
</html>