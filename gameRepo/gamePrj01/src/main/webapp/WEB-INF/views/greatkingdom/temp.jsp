<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/greatkingdom/room.css">
</head>
<body>

	<div class="field">

	</div>
	
	<script type="text/javascript">
		const field = document.querySelector('.field');
		field.classList.add('field');
	
		for(let i = 0; i < 10; i++) {
			for(let j = 0; j < 10; j++) {
				const block = document.createElement('div');
				block.classList.add('block');

				field.append(block);
			}
		}
	</script>

</body>
</html>