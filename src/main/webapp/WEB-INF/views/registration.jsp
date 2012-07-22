<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>
<title><spring:message code="title.registration"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="row">
			<div class="span6 offset3">
				<form class="well" action="registration" method="POST">
					<c:if test="${errorEmailInUse}"><div class="alert alert-error"><spring:message code="message.emailinuse"/></div></c:if>
					<c:if test="${errorServer}"><div class="alert alert-error"><spring:message code="message.serverproblems"/></div></c:if>
					<label class="span3" for="displayname"><spring:message code="label.displayname"/></label> 
					<input id="displayname" type="text" class="span3" placeholder="<spring:message code="input.displayname"/>" name="displayname"/>
					<script type="text/javascript">
						var displaynameCheck = new LiveValidation('displayname', {validMessage: '<spring:message code="valid.name"/>',  wait: 500 });
						displaynameCheck.add(Validate.Presence, {failureMessage: "<spring:message code="invalid.cantbeempty"/>"});
						displaynameCheck.add(Validate.Length, {tooLongMessage: '<spring:message code="invalid.length60"/>', maximum: 60});
					</script>
					<label class="span3" for="email"><spring:message code="label.email"/></label> 
					<input id="email" type="text" class="span3" placeholder="<spring:message code="input.email"/>" name="email"/>
					<script type="text/javascript">
						var emailCheck = new LiveValidation('email', { validMessage: '<spring:message code="valid.email"/>', wait: 500 });
						emailCheck.add(Validate.Presence, {failureMessage: "<spring:message code="invalid.cantbeempty"/>"});
						emailCheck.add(Validate.Email, {failureMessage: '<spring:message code="invalid.email"/>'});		          
						emailCheck.add(Validate.Length, {tooLongMessage: '<spring:message code="invalid.length60"/>', maximum: 60});
					</script>
					<label class="span3" for="password"><spring:message code="label.password"/></label> 
					<input id="password" type="password" class="span3" placeholder="<spring:message code="input.password"/>" name="password"/>
					<script type="text/javascript">
						var passwordLength = new LiveValidation('password', { validMessage: '<spring:message code="valid.password"/>', wait: 500 });
						passwordLength.add(Validate.Presence, {failureMessage: "<spring:message code="invalid.cantbeempty"/>"});
						passwordLength.add(Validate.Length, {tooShortMessage: '<spring:message code="invalid.length7"/>', minimum: 7 });
						passwordLength.add(Validate.Length, {tooLongMessage: '<spring:message code="invalid.length60"/>', maximum: 60});
					</script>
					<label class="span3" for="confirm"><spring:message code="label.confirmpassword"/></label>
					<input id="confirm" type="password" class="span3" placeholder="<spring:message code="input.confirmpassword"/>" />
					<script type="text/javascript">
						var passwordConfirm = new LiveValidation('confirm', { validMessage: '<spring:message code="valid.equalpasswords"/>', wait: 500 });
						passwordConfirm.add(Validate.Confirmation, {failureMessage: '<spring:message code="invalid.doesnotmatch"/>', match: 'password' });		          
					</script>
					<div align="center"><button type="submit" class="btn"><spring:message code="button.register"/></button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>