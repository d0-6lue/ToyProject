<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/set.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy01</title>
<link rel="stylesheet" href="${root}/resources/css/chat/chat-home.css">
<script src="${root}/resources/js/chat/chat-home.js"></script>
</head>
<body>

	<div class="wrap">

        <div class="chat-util">
            <button onclick="reLoadChatRoom();">새로고침</button>
            <button onclick="activeModal();">방만들기</button>
        </div>

        <div class="chat-list">

            <table class="chat-list-table">
                <thead>
                    <tr>
                        <th class="chat-room-no">방번호</th>
                        <th class="chat-room-name">방제목</th>
                        <th class="chat-room-max">인원수</th>
                        <th class="attend-btn"></th>
                    </tr>
                </thead>
                <tbody class="chat-list-tbody">

                </tbody>
                
            </table>

        </div>

    </div>

    <div class="modal-wrap">

        <div class="modal">
            <h3>방만들기</h3>
            <form action="${root}/chat/create" method="post" class="create-chat-room-form">
                <label for="chatRoomName">방제목</label>
                <input type="text" name="chatRoomName">
                
                <label for="chatRoomMax">인원수</label>
                <input type="number" name="chatRoomMax" min="1" max="5" value="2">

                <input class="btn" type="submit" value="방만들기">
                <input class="btn" onclick="inactiveModal();" type="button" value="닫기">
            </form>
        </div>

    </div>

</body>
</html>