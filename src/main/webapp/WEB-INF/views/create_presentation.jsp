<%@ include file="static/taglibs.resource" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="static/resources.resource" %>
<script type="text/javascript" src="<c:url value="/resources/js/livevalidation.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.tagsinput.js"/>"></script>
<link href="<c:url value="/resources/styles/jquery.tagsinput.css"/>" rel="stylesheet"/>
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
									var titleCheck = new LiveValidation('title', {validMessage: '<spring:message code="valid.title"/>',  wait: 500 });
									titleCheck.add(Validate.Presence, {failureMessage: "<spring:message code="invalid.cantbeempty"/>"});
									titleCheck.add(Validate.Length, {tooLongMessage: '<spring:message code="invalid.length120"/>', maximum: 120});
								</script>
					    	</div>
					    </div>
				    	<div class="control-group">
							<label class="control-label" for="theme"><spring:message code="label.theme"/></label>
							<div class="controls"> 
								<input id="theme" type="text" class="span3" placeholder="<spring:message code="input.theme"/>" name="theme" />
								<script type="text/javascript">
									var themeCheck = new LiveValidation('theme', { validMessage: ' ', wait: 500 });
									themeCheck.add(Validate.Length, {tooLongMessage: '<spring:message code="invalid.length120"/>', maximum: 120});
								</script>
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
								<input id="tags" type="text" name="tags" placeholder="mytxt"/>
								<script type="text/javascript">
									var tagCheck = new LiveValidation('tags', {validMessage: ' ',  wait: 500 });
									tagCheck.add(Validate.Presence, {failureMessage: "<spring:message code="invalid.cantbeempty"/>"});
									$('#tags').tagsInput();
								</script>
								<span class="help-block"><spring:message code="text.pressenter"/></span>
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