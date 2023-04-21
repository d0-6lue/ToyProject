<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/set.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy01</title>
<link rel="stylesheet" href="${root}/resources/css/member/member-join-page.css">
</head>
<body>

	<div class="wrap">

        <div class="join-form-area">

            <form action="${root}/member/join" method="post" class="join-form">

                <input type="text" name="joinInputId" placeholder="아이디">
                <input type="password" name="joinInputPwd1" placeholder="비밀번호">
                <input type="password" name="joinInputPwd2" placeholder="비밀번호 확인">
                <input type="text" name="joinInputNick" placeholder="닉네임">

                <input type="submit" value="회원가입">

            </form>

        </div>

    </div>

</body>
</html>