<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form:form method="post" action="/xslides/save" commandName="presentation">
<form:input path="name" />
<form:input path="content" />
<form:input path="author" />
<form:input path="tags" />
<input type="submit" value="Submit" />
</form:form>