<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy02</title>
<link rel="stylesheet" href="${root}/resources/css/chat/chat_home.css">
<script defer src="${root}/resources/js/chat/chat_home.js"></script>
</head>
<body>

	<div class="wrap">

        <a href="${root}/chat/home">새로고침</a>

        <br><hr><br>

        <div>접속인원들..</div>

        <c:forEach var="loginMember" items="${loginMemberList}">
            
            <c:if test="${loginMember.memberNick ne loginNick}">
                <div>
                    
                    <a href="${root}/chat/room?person=${loginMember.memberNick}">${loginMember.memberNick}</a>

                </div>
            </c:if>
        </c:forEach>

    </div>

</body>
</html>