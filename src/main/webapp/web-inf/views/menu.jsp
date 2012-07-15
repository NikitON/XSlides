		<c:set var="user" value="${sessionScope.user}"/>
		<c:set var="userName" value="${fn:substringBefore(sessionScope.user.email, '@')}"/>
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="home">XSlides</a>
					<ul class="nav">
						<li class="active"><a href="home">Home</a></li>
						<li><a href="about">About</a></li>
						<c:if test="${user.admin}">
						<li><a href="administration">Administration</a></li>
						</c:if>
					</ul>
					<ul class="nav pull-right">
						<c:if test="${user == null}">
						<li><a href="login">Login</a></li>
						<li><a href="registration">Registration</a></li>
						</c:if>
						<c:if test="${user != null}">
						<li><a href="createPresentation">Create presentation</a></li>
						<li><a href="logout">Logout</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Profile	<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="settings">Settings</a></li>
								<li><a href="${userName}/myPresentations">My Presentations</a></li>
							</ul>
						</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<c:if test="${user != null}"><span class="pull-right label">Logged as ${userName}</span></c:if>