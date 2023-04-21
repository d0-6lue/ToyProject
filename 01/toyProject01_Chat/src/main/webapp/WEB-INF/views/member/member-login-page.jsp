<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/set.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy01</title>
<link rel="stylesheet" href="${root}/resources/css/member/member-login-page.css">
</head>
<body>

    <div class="wrap">

        <div class="login-form-area">

            <form action="${root}/member/login" method="post" class="login-form">

                <input type="text" name="loginInputId" placeholder="아이디">
                <input type="password" name="loginInputPwd" placeholder="비밀번호">

                <input type="submit" value="로그인">

            </form>

        </div>

    </div>

</body>
</html>