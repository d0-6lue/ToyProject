<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/set.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy01</title>
<script defer src="${root }/resources/js/home/home.js"></script>
</head>
<body>

	<div class="wrap">

        <header>

            <nav>

            </nav>

            <div class="util">
            	<c:if test="${empty loginMember }" >
                	<a href="${root}/member/join">회원가입</a>
                	<a href="${root }/member/login">로그인</a>
                </c:if>
                <c:if test="${not empty loginMember }" >
                	<div>${loginMember.memberNick }님 환영합니다.</div>
                	<a href="${root }/member/logout">로그아웃</a>
                	<br>
                	<a href="${root }/chat/home">채팅</a>
                    /
                    <a href="${root }/chat/ovo">1:1 대화</a>
                    <script>
                        const nick = '<%=(String)session.getAttribute("nick")%>';
                        sessionStorage.setItem("nick", nick);
                    </script>
                </c:if>
            </div>

        </header>

    </div>
    
    <script>
    	<c:if test="${not empty alertMsg}" >
    		alert("${alertMsg}");
    		<c:remove var="alertMsg"/>
        </c:if>
    </script>

</body>
</html>