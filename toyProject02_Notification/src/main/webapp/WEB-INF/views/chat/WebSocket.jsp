<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/setup.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy02</title>
</head>
<body>

    <c:out value="${URL}" />

	<div class="wrap">

        <form action="">

            <input type="text" name="textMessage">

            <input type="button" value="send" onclick="sendMessage()">

            <input type="button" value="disconnect" onclick="disconnect()">

        </form>

        <br>

        <textarea id="messageTextArea" cols="50" rows="10"></textarea>

        <script>

            // WebSocekt == 프로젝트명
            // websocket == 호스트명
            // webSocket 오브젝트 생성 ( 자동으로 접속 시작. onopen 함수 호출 )
            var webSocket = new WebSocket("ws://${URL}/${root}websocket")

            var messageTextArea = document.querySelector("#messageTextArea");

            // WebSocket 서버와 접속이 되면 호출 되는 함수
            webSocket.onopen = function(message) {
                messageTextArea.value += "Server connect ...\n";
            };

            // WebSocket 서버와 접속이 끊기면 호출 되는 함수
            webSocket.onclose = function(message) {
                messageTextArea.value += "Server Disconnect ...\n";
            }

            // WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
            webSocket.onerror = function(message) {
                messageTextArea.value += "error ...\n";
            }

            // WebSocket 서버로 부터 메시지가 오면 호출 되는 함수
            webSocket.onmessage = function(message) {
                messageTextArea.value += "Recieve From Server => " + message.data + "\n";
            }


            // send
            function sendMessage() {

                var message = document.querySelector("input[name=textMessage]");

                messageTextArea.value += "Send to Server => " + message.value + "\n";

                webSocket.send(message.value);

                message.value = "";

            }

            // disconnect
            function disconnect() {
                webSocket.close();
            }

            

        </script>

    </div>


</body>
</html>