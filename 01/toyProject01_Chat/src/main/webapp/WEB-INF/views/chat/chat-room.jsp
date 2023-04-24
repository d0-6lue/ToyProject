<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ include file="/WEB-INF/views/common/set.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Toy01</title>
<link rel="stylesheet" href="${root}/resources/css/chat/chat-room.css">
<script src="${root}/resources/js/chat/chat-room.js"></script>
</head>
<body>

	<div class="wrap">

        <div class="chat-area">
            <div class="chat">

            </div>

            <div class="input-bar">
                <input type="text" name="chatMsg"> <button class="chat-btn" onclick="sendChat();" >-></button>
            </div>

        </div>

    </div>

</body>
</html>