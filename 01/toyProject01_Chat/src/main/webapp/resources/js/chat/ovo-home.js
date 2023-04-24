function getContextPath(){
    const hostIndex = location.href.indexOf( location.host ) + location.host.length;

    const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

    return contextPath;
}

function loadLoginMemberList() {

    const loginMemberListArea =  document.querySelector(".login-member-list-area");

    const contextPath = getContextPath();

    fetch( contextPath + "/login_member_list")
    .then( (response) => response.json() )
    .then( (data) => {
        
        console.log(data);

        for(i in data){
            const loginMember = document.createElement("div");

            loginMember.innerText = data[i].memberNick;

            loginMemberListArea.appendChild(loginMember);
        }

    } )
    .catch( err => {
        console.log('Fetch Error', err);
    })

}

loadLoginMemberList();