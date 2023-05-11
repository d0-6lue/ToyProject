<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy</title>
<link rel="stylesheet" href="${root}/resources/css/common/setup.css">
<link rel="stylesheet" href="${root}/resources/css/common/header.css">


<c:if test="${not empty alertMsg}" >

<script type="text/javascript">
	alert("${alertMsg}");
	<c:remove var="alertMsg"/>
</script>

</c:if> 