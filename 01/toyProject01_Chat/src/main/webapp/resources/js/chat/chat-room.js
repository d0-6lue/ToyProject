function getContextPath(){
    const hostIndex = location.href.indexOf( location.host ) + location.host.length;

    const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

    return contextPath;
}

function loadChat(){

    const logiNick = window.sessionStorage.getItem("nick");

    const chatBox = document.querySelector(".chat-box");

    const roomNo = (new URLSearchParams(location.search).get('no'));

    const contextPath = getContextPath();

    fetch(contextPath + "/chat/load/chatlist?no=" + roomNo)
    .then( (response) => response.json() )
    .then( (data) => {

        for(i in data){

            const chat = document.createElement("div");
            chat.classList.add("chat");

            const chatHead = document.createElement("div")
            chatHead.classList.add("chat-head");

            const sender = document.createElement("span")
            sender.innerText = data[i].chatSenderNick;

            const enrollDate = document.createElement("span");
            enrollDate.innerText = data[i].chatEnrollDate

            const chatContent = document.createElement("div")
            chatContent.innerText = data[i].chatContent;
            chatContent.classList.add("chat-content");

            if(data[i].chatSenderNick == logiNick){
                chat.classList.add("my-chat");
                chatHead.classList.add("my-chat-head");
                chatContent.classList.add("my-chat-content");
            }
            else{
                chat.classList.add("others-chat");
            }

            chatHead.appendChild(sender);
            chatHead.appendChild(enrollDate);

            chat.appendChild(chatHead);
            chat.appendChild(chatContent);

            chatBox.appendChild(chat);

        }
        
    })
    .catch( err => {
    })

};

setInterval(loadChat, 1000);

function sendChat() {

    const roomNo = (new URLSearchParams(location.search).get('no'));

    const input = document.querySelector("input[name=chatMsg]");
    const chatContent = input.value;
    input.value = "";

    const contextPath = getContextPath();

    fetch( contextPath + "/chat/send", {
        method : "post",
        headers : {
            "Content-Type" : "application/json",
        },
        body : JSON.stringify({
            roomNo : roomNo,
            chatContent : chatContent
        })
    })
    .then( (response) => response.json() )
    .then( (data) => {
        
    })
    .catch( err => {
        console.log('Fetch Error', err);
    })

}

const input = document.querySelector("input[name=chatMsg]");
input.addEventListener("keyup" , function(event) {
    if (event.keyCode === 13) {
        document.querySelector(".chat-btn").click();
      }
})