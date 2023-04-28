const chatBox = document.querySelector(".chat-box");

var url = window.location.href;
var path = window.location.pathname;

var root = path.substring(
    0, (path.substring(1, path.length)).indexOf('/') + 1
)

var hostname = url.substring(7, url.indexOf(root));

var host = window.location.host;

// WebSocket 오브젝트 생성 ( 자동으로 접속 시작함. onopen 함수 호출 )
var webSocket = new WebSocket("ws://" + host + root + "/chat/socket");

// WebSocket 서버와 접속이 되면 호출되는 함수
webSocket.onopen = function(message) {

    register();

    load();

};

// WebSocket 서버로 부터 메시지가 오면 호출 되는 함수
webSocket.onmessage = function(message) {

    var loginNick = sessionStorage.getItem('loginNick');

    const replyMsg = JSON.parse(message.data);

    loadChat(replyMsg, loginNick);

    chatBox.scrollTop = chatBox.scrollHeight;

};

// WebSocket 서버와 접속이 끊기면 호출되는 함수
webSocket.onclose = function(message) {

};

// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
webSocket.onerror = function(message) {

}


function register() {

    var loginNick = sessionStorage.getItem('loginNick');
    const person = (new URLSearchParams(location.search).get('person'));

    var msg = {
        "type" : "register",
        "sender" : loginNick,
        "receiver" : person
    }

    webSocket.send(JSON.stringify(msg));

}

function load() {

    var sender = sessionStorage.getItem('loginNick');
    const receiver = (new URLSearchParams(location.search).get('person'));

    var msg = {
        "type" : "load",
        "sender" : sender,
        "receiver" : receiver,
        "lastChatNo" : 0
    }

    // WebSocket 서버에 메시즈를 송신
    webSocket.send(JSON.stringify(msg));

}


function sendMessage() {

    var chatMsg = document.querySelector("input[name=chatMsg]");

    if(chatMsg.value != ""){
        const sender = sessionStorage.getItem('loginNick');
        const receiver = (new URLSearchParams(location.search).get('person'));
        const lastChatNo = window.sessionStorage.getItem("lastChatNo")
        if(lastChatNo == ""){
            lastChatNo == 0;
        }

        var msg = {
            "type" : "chat",
            "sender" : sender,
            "receiver" : receiver,
            "chatMsg" : chatMsg.value,
            "lastChatNo" : window.sessionStorage.getItem("lastChatNo")
        }

        // WebSocket 서버에 메시즈를 송신
        webSocket.send(JSON.stringify(msg));

        chatMsg.value = "";
    }

}

const input = document.querySelector("input[name=chatMsg]");
input.addEventListener("keyup" , function(event) {
    if (event.keyCode === 13) {
        document.querySelector(".send-btn").click();
      }
})


function loadChat(replyMsg, loginNick){

    const chatList = replyMsg.chatVoList;


    if(replyMsg.type == 'load'){
        chatBox.replaceChildren();
    }

    for( i in chatList){

        const chat = document.createElement("div");
        chat.classList.add("chat");

        const chatInfo = document.createElement("div");
        chatInfo.classList.add("chat-info");

        const chatSender = document.createElement("span");
        chatSender.innerText = chatList[i].chatSender;
        chatSender.classList.add("chat-sender");

        const chatEnrollDate = document.createElement("span");
        chatEnrollDate.innerText = chatList[i].chatEnrollDate
        chatEnrollDate.classList.add("chat-enroll-date");

        const chatContent = document.createElement("div");
        chatContent.innerText = chatList[i].chatContent;
        chatContent.classList.add("chat-content");

        const readCheck = document.createElement("div");
        readCheck.innerText = chatList[i].chatRead;

        if(chatList[i].chatSender == loginNick){

            chatInfo.classList.add("my-chat");
            chatContent.classList.add("my-chat");
            readCheck.classList.add("my-chat");

        }

        chatInfo.append(chatSender);
        chatInfo.append(chatEnrollDate);

        chat.append(chatInfo);
        chat.append(chatContent);

        if(chatList[i].chatSender == loginNick){ chat.append(readCheck); }
        
        chatBox.append(chat);

        chat.scrollTop = chatList.scrollHeight;

        window.sessionStorage.setItem("lastChatNo", chatList[i].chatNo);

    }

}