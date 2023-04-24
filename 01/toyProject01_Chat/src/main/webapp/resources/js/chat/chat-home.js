loadChatRoom();

function activeModal() {

    const mw = document.querySelector(".modal-wrap");

    mw.classList.toggle("active");

};

function inactiveModal() {
    const mw = document.querySelector(".modal-wrap");

    mw.classList.toggle("active");
};

function getContextPath(){
    const hostIndex = location.href.indexOf( location.host ) + location.host.length;

    const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

    return contextPath;
}

function loadChatRoom() {

    const contextPath = getContextPath();

    fetch(contextPath + "/chat/load/room")
    .then( (response) => response.json() )
    .then( (data) => {

        const chatListTbody = document.querySelector(".chat-list-tbody");

        for(i in data){

            const tr = document.createElement("tr");
            chatListTbody.appendChild(tr);

            const chatRoomNo = document.createElement("td");
            chatRoomNo.innerText = data[i].chatRoomNo;
            chatRoomNo.classList.add("chat-room-no");
            
            const chatRoomName = document.createElement("td");
            chatRoomName.innerText = data[i].chatRoomName;
            chatRoomName.classList.add("chat-room-name");
            
            const chatRoomMax = document.createElement("td");
            chatRoomMax.innerText = data[i].chatRoomMax;
            chatRoomMax.classList.add("chat-room-max");

            const attendChatRoom = document.createElement("button");
            attendChatRoom.innerText = "참가하기";
            attendChatRoom.classList.add("attend-btn")

            tr.appendChild(chatRoomNo);
            tr.appendChild(chatRoomName);
            tr.appendChild(chatRoomMax);
            tr.appendChild(attendChatRoom);
        }

        //location.href = contextPath + "/chat/room?no=" + data[i].chatRoomNo;
        
        function test(a, b){
            a.addEventListener("click", function(){
                location.href = contextPath + "/chat/room?no=" + b; 
            })
        }

        const attendChatRoomBtn = document.querySelectorAll(".attend-btn");
        for(i in attendChatRoomBtn) {

            if(i == 0){

            }
            else{
                attendChatRoomBtn[i].addEventListener("click", test(attendChatRoomBtn[i], data[i-1].chatRoomNo));
            }

        }
        
    })
    .catch( err => {
        console.log('Fetch Error', err);
    })

}

function reLoadChatRoom() {

    const contextPath = getContextPath();

    fetch(contextPath + "/chat/load/room")
    .then( (response) => response.json() )
    .then( (data) => {

        const chatListTbody = document.querySelector(".chat-list-tbody");

        chatListTbody.replaceChildren();

        for(i in data){
            const tr = document.createElement("tr");
            chatListTbody.appendChild(tr);

            const chatRoomNo = document.createElement("td");
            chatRoomNo.innerText = data[i].chatRoomNo;
            chatRoomNo.classList.add("chat-room-no");
            
            const chatRoomName = document.createElement("td");
            chatRoomName.innerText = data[i].chatRoomName;
            chatRoomName.classList.add("chat-room-name");
            
            const chatRoomMax = document.createElement("td");
            chatRoomMax.innerText = data[i].chatRoomMax;
            chatRoomMax.classList.add("chat-room-max");

            const attendChatRoom = document.createElement("button");
            attendChatRoom.innerText = "참가하기";
            attendChatRoom.classList.add("attend-btn")


            tr.appendChild(chatRoomNo);
            tr.appendChild(chatRoomName);
            tr.appendChild(chatRoomMax);
            tr.appendChild(attendChatRoom);
        }

        for(i in data){
            const attendChatRoomBtn = document.querySelectorAll(".attend-btn");
            attendChatRoomBtn[i+1].addEventListener("click", function(){
                location.href = contextPath + "/chat/room?no=" + data[i].chatRoomNo; 
            })
        }
        
    })
    .catch( err => {
        console.log('Fetch Error', err);
    })

}