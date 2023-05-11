<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>

<link rel="stylesheet" href="${root}/resources/css/member/memberJoin.css">
</head>
<body>

    <div class="wrap">

        <%@ include file="/WEB-INF/views/common/header.jsp" %>

		<main>

            <div class="join-title">
                회원가입
            </div>

            <form action="${root}/member/join" method="post" class="join-area">
                <div class="id-guide">
                    아이디
                </div>
                <input type="text" name="joinId" class="join-input">
                <div class="pw-guide">
                    비밀번호
                </div>
                <input type="password" name="joinPw" class="join-input">
                <div class="nick-guide">
                    닉네임
                </div>
                <input type="text" name="joinNick" class="join-input">

                <input type="submit" class="join-btn" value="가입하기">

            </form>

        </main>

    </div>


</body>
</html>