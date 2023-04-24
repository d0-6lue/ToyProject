function getContextPath(){
    const hostIndex = location.href.indexOf( location.host ) + location.host.length;

    const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

    return contextPath;
}

function loadChat(){
    
    const roomNo = (new URLSearchParams(location.search).get('no'));

    const contextPath = getContextPath();

    fetch(contextPath + "/chat/load/chatlist?no=" + roomNo)
    .then( (response) => response.json() )
    .then( (data) => {
        console.log(data);

        
    })
    .catch( err => {
        console.log('Fetch Error', err);
    })

};
loadChat();

function sendChat() {

    const roomNo = (new URLSearchParams(location.search).get('no'));

    const input = document.querySelector("input[name=chatMsg]");
    const chatContent = input.value;
    input.innerText = "";

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