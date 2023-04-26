var url = window.location.href;
var path = window.location.pathname;

var root = path.substring(
    0, (path.substring(1, path.length )).indexOf('/') + 1
)

var hostname = url.substring(7, url.indexOf(root));

// WebSocket 오브젝트 생성 ( 자동으로 접속 시작함. onopen 함수 호출 )
var webSocket = new WebSocket("ws://" + hostname + root + "/chat/socket");


// WebSocket 서버와 접속이 되면 호출되는 함수
webSocket.onopen = function(message) {

};

// WebSocket 서버와 접속이 끊기면 호출되는 함수
webSocket.onclose = function(message) {

};

// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
webSocket.onerror = function(message) {

}

// WebSocket 서버로 부터 메시지가 오면 호출 되는 함수
WebSocket.onmessage = function(message) {

};


function sendMessage() {

    var chatMsg = document.querySelector("input[name=chatMsg]");
    var sender = sessionStorage.getItem('loginNick');
    const receiver = (new URLSearchParams(location.search).get('person'));

    var chatVo = {
        "sender" : sender,
        "receiver" : receiver,
        "chatMsg" : chatMsg.value
    }

    // WebSocket 서버에 메시즈를 송신
    webSocket.send(JSON.stringify(chatVo));

    chatMsg.value = "";

}