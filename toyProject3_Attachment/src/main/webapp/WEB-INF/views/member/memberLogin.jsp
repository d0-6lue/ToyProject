<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>

</head>
<link rel="stylesheet" href="${root}/resources/css/member/memberLogin.css">
<body>

    <div class="wrap">

        <%@ include file="/WEB-INF/views/common/header.jsp" %>

		<main>

            <div class="login-title">
                로그인
            </div>

            <form action="${root}/member/login" method="post" class="login-area">
                <div class="id-guide">
                    아이디
                </div>
                <input type="text" name="loginId" class="login-input">
                <div class="pw-guide">
                    비밀번호
                </div>
                <input type="password" name="loginPw" class="login-input">
                
                <input type="submit" class="login-btn" value="로그인">

            </form>

        </main>

    </div>


</body>
</html>