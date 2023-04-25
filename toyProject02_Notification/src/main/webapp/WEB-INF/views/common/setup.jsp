<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<c:url var="root" value="/" />

<c:set var="reqURL" value="${pageContext.request.requestURL}" />

<c:set var="URL" value="${fn:substring( reqURL, 7, 21 ) }" />