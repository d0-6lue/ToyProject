<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Great Kingdom</title>
<link rel="stylesheet" href="${root}/resources/css/greatkingdom/room.css">
<script defer src="${root}/resources/js/greatkingdom/room.js"></script>
</head>
<body>

	<div class="area">

		<div class="tray">
			적의 성채 색 : <div class="castle enemy"></div>
		</div>

		<div class="field"></div>

		<div class="tray">
			나의 성채 색 : <div class="castle mine"></div>
		</div>

	</div>

	

</body>
</html>