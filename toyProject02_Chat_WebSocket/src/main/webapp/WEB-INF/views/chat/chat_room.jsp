<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy02</title>
<link rel="stylesheet" href="${root}/resources/css/chat/chat_room.css">
<script defer src="${root}/resources/js/chat/chat_room.js"></script>
</head>
<body>

	<div class="wrap">

        <div class="chat-area">

            <div class="chat-box">

            </div>

            <div class="input_bar">
                <input type="text" name="chatMsg">
                <button class="send-btn" onclick="sendMessage()">send</button>
            </div>

        </div>

    </div>

</body>
</html>