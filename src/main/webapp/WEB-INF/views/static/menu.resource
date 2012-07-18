		<c:set var="user" value="${sessionScope.user}"/>
		<c:set var="userName" value="${fn:substringBefore(sessionScope.user.email, '@')}"/>
		<c:url var="englishLocaleUrl" value="${window.location.pathname}">
            <c:param name="language" value="en" />
        </c:url>
        <c:url var="russianLocaleUrl" value="${window.location.pathname}">
            <c:param name="language" value="ru" />
        </c:url>
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="home">XSlides</a>
					<ul class="nav">
						<li class="active"><a href="home"><spring:message code="menu.home"/></a></li>
						<li><a href="about"><spring:message code="menu.about"/></a></li>
						<c:if test="${user.admin}">
						<li><a href="administration"><spring:message code="menu.administration"/></a></li>
						</c:if>
					</ul>
					<ul class="nav pull-right">
						<c:if test="${user == null}">
						<li><a href="login"><spring:message code="menu.login"/></a></li>
						<li><a href="registration"><spring:message code="menu.registration"/></a></li>
						</c:if>
						<c:if test="${user != null}">
						<li><a href="createPresentation"><spring:message code="menu.createpresentation"/></a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<spring:message code="menu.profile"/> <span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="settings"><spring:message code="menu.settings"/></a></li>
								<li><a href="userPresentations/${user.id}"><spring:message code="menu.mypresentations"/></a></li>
								<li><a href="favorites"><spring:message code="menu.favorites"/></a></li>
							</ul>
						</li>
						</c:if>
						<li>
						<li>
						<div style="padding: 0 0 0 5px">
						<a href="<c:out value="${englishLocaleUrl}"/>"><img src="<c:url value="/resources/img/eng.png"/>" alt="eng"/></a><br>
	            		<a href="<c:out value="${russianLocaleUrl}"/>"><img src="<c:url value="/resources/img/rus.png"/>" alt="rus"/></a>
	            		</div>
	            		</li>
					</ul>
				</div>
			</div>
		</div>
		<c:if test="${user != null}">
		<span class="pull-right label"><spring:message code="label.loggedas"/> ${userName} 
		<a style="text-decoration:none" href="logout"><span class="label label-inverse"><spring:message code="menu.logout"/></span></a>
		</span></c:if>