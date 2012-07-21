<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>
<title><spring:message code="title.createpresentation"/></title>
</head>
<body>
	<div class="container">
		<%@ include file="static/menu.resource" %>
		<div class="row">
			<div class="span8 offset2">
				<form class="form-horizontal well" action="createPresentation" method="POST">
					<fieldset>
				    	<div class="control-group">
							<label class="control-label" for="title"><spring:message code="label.title"/></label>
				      		<div class="controls">
								<input id="title" type="text" class="span3" placeholder="<spring:message code="input.title"/>" name="title" />
								<script type="text/javascript">
									var titleCheck = new LiveValidation('title', {validMessage: 'Nice title!',  wait: 500 });
									titleCheck.add(Validate.Presence);
									titleCheck.add(Validate.Format, {pattern: /^[\w]+$/ } );
									titleCheck.add(Validate.Length, {maximum: 40});
								</script>
					    	</div>
					    </div>
				    	<div class="control-group">
							<label class="control-label" for="theme"><spring:message code="label.theme"/></label>
							<div class="controls"> 
								<input id="theme" type="text" class="span3" placeholder="<spring:message code="input.theme"/>" name="theme" />
					    	</div>
					    </div>
				    	<div class="control-group">
							<label class="control-label" for="description"><spring:message code="label.description"/></label>
							<div class="controls"> 
								<textarea id="description" class="span6" rows="6" placeholder="<spring:message code="input.description"/>" name="description"></textarea>
							</div>
						</div>
				    	<div class="control-group">
							<label class="control-label" for="tags"><spring:message code="label.tags"/></label>
							<div class="controls">
								<input id="tags" type="text" class="span3" placeholder="<spring:message code="input.tags"/>" name="tags"/>
							</div>
						</div>
						<div align="center"><button type="submit" class="btn btn-success"><i class="icon-edit icon-white"></i> <spring:message code="button.create"/></button></div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>