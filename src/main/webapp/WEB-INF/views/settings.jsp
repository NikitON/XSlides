<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>
<title>Settings</title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource"%>
		<div class="row">
			<div class="well span6 offset3">
				<c:if test="${message != null}"><div class="alert alert-error">${message}</div></c:if>
				<c:if test="${success != null}"><div class="alert alert-success">${success}</div></c:if>
				<table class="table table-striped table-bordered">
					<tbody>
						<tr>
							<th style="width: 25%">Display name</th>
							<td>${user.displayname}</td>
							<td>
							<div align="center"><a class="btn btn-warning" data-toggle="modal" href="#changeName" >Change</a></div>
							</td>
						</tr>
						<tr>
							<th style="width: 25%">E-mail</th>
							<td>${user.email}</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3" align="center">
							<div align="center"><a class="btn btn-danger" data-toggle="modal" href="#changePassword" >Change password</a></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade hide" id="changeName">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal">close</button>
    		<h3>New display name</h3>
  		</div>
  		<form method="POST" action="newName">
	  		<div class="modal-body">
	  			<h3 class="offset1">Your current name is: ${user.displayname}</h3>
	    		<label class="span3">New name</label> 
				<input id="displayname" type="text" class="span3" placeholder="New displayname..." name="displayname" />
				<script type="text/javascript">
					var displaynameCheck = new LiveValidation('displayname', {validMessage: 'Nice name!',  wait: 500 });
					displaynameCheck.add(Validate.Presence);
					displaynameCheck.add(Validate.Length, {maximum: 40});
				</script>
				<label class="span3">Password</label> 
				<input id="password" type="password" class="span3" placeholder="Password..." name="password" />
	  		</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-success">Save changes</button>
			</div>
		</form>
	</div>
		<div class="modal fade hide" id="changePassword">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal">close</button>
    		<h3>New password</h3>
  		</div>
  		<form method="POST" action="newPassword">
	  		<div class="modal-body">
	    		<label class="span3">New password</label> 
				<input id="newPassword" type="password" class="span3" placeholder="Type new password..." name="newPassword"/>
				<script type="text/javascript">
					var passwordLength = new LiveValidation('newPassword', { validMessage: 'Nice password!', wait: 500 });
					passwordLength.add(Validate.Presence);
					passwordLength.add(Validate.Length, { minimum: 7 });
					passwordLength.add(Validate.Length, { maximum: 40});
				</script>
				<label class="span3">Confirm new password</label>
				<input id="confirm" type="password" class="span3" placeholder="Confirm new password..." />
				<script type="text/javascript">
					var passwordConfirm = new LiveValidation('confirm', { validMessage: 'Passwords are equal.', wait: 500 });
					passwordConfirm.add(Validate.Confirmation, { match: 'newPassword' });		          
				</script>
				<label class="span3">Current password</label> 
				<input id="password" type="password" class="span3" placeholder="Current password..." name="password" />
	  		</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-success">Save changes</button>
			</div>
		</form>
	</div>
</body>
</html>
