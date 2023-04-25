<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/set.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy01</title>
<link rel="stylesheet" href="${root}/resources/css/chat/ovo-room.css">
</head>
<body>

	<div class="wrap">

        <div class="chat-area">

            <div class="chat-box">

            </div>

            <div class="input-bar">
                <input type="text" name="chatMsg"> <button class="chat-btn" onclick="sendChat();" >-></button>
            </div>

        </div>

    </div>

</body>
</html>