// 
userNo = crypto.randomUUID();

// 주소 변수
const url = window.location.href;
const path = window.location.pathname;

const root = path.substring(
    0, (path.substring(1, path.length)).indexOf('/') + 1
);
const hostname = url.substring(7, url.indexOf(root));

const host = window.location.host;

WebSocket
const webSocket = new WebSocket("ws://" + host + root + "/websocket");

// WebSocket 서버와 접속이 되면 호출되는 함수
webSocket.onopen = function(message) {

    register();

};


// WebSocket 서버로 부터 메시지가 오면 호출 되는 함수
webSocket.onmessage = function(message) {

    console.log(message.data);

    const target = document.querySelector("#"+message.data);
    target.classList.add('mine');

};


// WebSocket 서버와 접속이 끊기면 호출되는 함수
webSocket.onclose = function(message) {

};


// WebSocket 서버와 통신 중 에러가 발생하면 호출되는 함수
webSocket.onerror = function(message) {

}


// 서버에 등록(?)
function register() {
    const nick = sessionStorage.getItem('loginNick');
    const roomNo = (new URLSearchParams(location.search).get('no'));

    const msg = {
        'type' : 'register',
        'userNo' : userNo,
        'roomNo' : roomNo,
    }

    webSocket.send(JSON.stringify(msg));
}


// 게임판 초기화
function initBoard() {
    const field = document.querySelector('.field');
    field.classList.add('field');

    let y = 'A'.charCodeAt();
    for(let i = 0; i < 9; i++) {
        for(let j = 0; j < 10; j++) {
            const block = document.createElement('div');
            block.classList.add('block');
            if(j == 0) {
                block.innerText = String.fromCharCode(y++);
            }
            else {
                block.id = String.fromCharCode(y-1) + j;
            }
            field.append(block);
        }
    }

    let x = 1;
    for(let i = 0; i < 10; i++) {
        const block = document.createElement('div');
            block.classList.add('block');
            if(i != 0) {
                block.innerText = x++;
            }
            field.append(block);
    }

    const center = document.querySelector('#E5');
    center.classList.add('neutrality');
    center.classList.add('slash');


    const blockArray = document.querySelectorAll('.block');
    blockArray.forEach(block => {
        if(block.id == '') {
            
        }
        else {
            block.addEventListener('click', (event)=>SendOccupation(event));
        }
    });

}
initBoard();



// 누르면 서버에 전송
function SendOccupation(event) {
    const nick = sessionStorage.getItem('loginNick');
    const roomNo = (new URLSearchParams(location.search).get('no'));

    const msg = {
        'type' : 'occupation',
        'userNo' : userNo,
        'roomNo' : roomNo,
        'coordinate' : event.target.id
    }

    webSocket.send(JSON.stringify(msg));
}