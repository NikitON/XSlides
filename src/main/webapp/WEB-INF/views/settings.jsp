<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>
<title><spring:message code="title.settings"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource"%>
		<div class="row">
			<div class="well span6 offset3">
				<c:if test="${errorPassword}"><div class="alert alert-error"><spring:message code="message.wrongpassword"/></div></c:if>
				<c:if test="${nameChanged}"><div class="alert alert-success"><spring:message code="message.namechanged"/></div></c:if>
				<c:if test="${passwordChanged}"><div class="alert alert-success"><spring:message code="message.passwordchanged"/></div></c:if>
				<table class="table table-striped table-bordered">
					<tbody>
						<tr>
							<th style="width: 25%"><spring:message code="label.displayname"/></th>
							<td>${user.displayname}</td>
							<td>
							<div align="center"><a class="btn btn-warning" data-toggle="modal" href="#changeName" >
							<i class="icon-pencil icon-white"></i> <spring:message code="button.change"/>
							</a></div>
							</td>
						</tr>
						<tr>
							<th style="width: 25%"><spring:message code="label.email"/></th>
							<td>${user.email}</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3" align="center">
							<div align="center"><a class="btn btn-danger" data-toggle="modal" href="#changePassword" >
							<i class="icon-pencil icon-white"></i> <spring:message code="button.changepassword"/>
							</a></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade hide" id="changeName">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal"><spring:message code="button.close"/></button>
    		<h3><spring:message code="label.newdisplayname"/></h3>
  		</div>
  		<form style="margin: 0 0 0 0" method="POST" action="newName">
	  		<div class="modal-body">
	  			<h3 class="offset1"><spring:message code="text.currentname"/> ${user.displayname}</h3>
	    		<label class="span3"><spring:message code="label.newdisplayname"/></label> 
				<input id="displayname" type="text" class="span3" placeholder="<spring:message code="input.newdisplayname"/>" name="displayname" />
				<script type="text/javascript">
					var displaynameCheck = new LiveValidation('displayname', {validMessage: '<spring:message code="valid.name"/>',  wait: 500 });
					displaynameCheck.add(Validate.Presence, {failureMessage: '<spring:message code="invalid.cantbeempty"/>'});
					displaynameCheck.add(Validate.Length, {tooLongMessage: '<spring:message code="invalid.length60"/>', maximum: 60});
				</script>
				<label class="span3"><spring:message code="label.password"/></label> 
				<input id="password" type="password" class="span3" placeholder="<spring:message code="input.password"/>" name="password" />
	  		</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-success">
			    <i class="icon-ok icon-white"></i> <spring:message code="button.savechanges"/>
			    </button>
			</div>
		</form>
	</div>
	<div class="modal fade hide" id="changePassword">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal"><spring:message code="button.close"/></button>
    		<h3><spring:message code="label.newpassword"/></h3>
  		</div>
  		<form style="margin: 0 0 0 0" method="POST" action="newPassword">
	  		<div class="modal-body">
	    		<label class="span3"><spring:message code="label.newpassword"/></label> 
				<input id="newPassword" type="password" class="span3" placeholder="<spring:message code="input.newpassword"/>" name="newPassword"/>
				<script type="text/javascript">
					var passwordLength = new LiveValidation('newPassword', { validMessage: '<spring:message code="valid.password"/>', wait: 500 });
					passwordLength.add(Validate.Presence, {failureMessage: '<spring:message code="invalid.cantbeempty"/>'});
					passwordLength.add(Validate.Length, {tooShortMessage: '<spring:message code="invalid.length7"/>', minimum: 7 });
					passwordLength.add(Validate.Length, {tooLongMessage: '<spring:message code="invalid.length60"/>', maximum: 60});
				</script>
				<label class="span3"><spring:message code="label.confirmnewpassword"/></label>
				<input id="confirm" type="password" class="span3" placeholder="<spring:message code="input.confirmnewpassword"/>" />
				<script type="text/javascript">
					var passwordConfirm = new LiveValidation('confirm', { validMessage: '<spring:message code="valid.equalpasswords"/>', wait: 500 });
					passwordConfirm.add(Validate.Confirmation, {failureMessage: '<spring:message code="invalid.doesnotmatch"/>', match: 'newPassword' });		          
				</script>
				<label class="span3"><spring:message code="label.currentpassword"/></label> 
				<input id="password" type="password" class="span3" placeholder="<spring:message code="input.currentpassword"/>" name="password" />
	  		</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-success">
			    <i class="icon-ok icon-white"></i> <spring:message code="button.savechanges"/>
			    </button>
			</div>
		</form>
	</div>
</body>
</html>
