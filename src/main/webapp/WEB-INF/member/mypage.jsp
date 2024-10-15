<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보</title>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: white;
    color: black;
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: black;
    padding: 10px;
    color: white;
    position: relative;
}

.menu-icon {
    font-size: 24px;
    cursor: pointer;
    z-index: 1001;
    position: relative;
    padding: 10px;
    background-color: rgba(0, 0, 0, 0.7);
    border-radius: 5px;
}

nav {
    position: fixed;
    top: 0;
    left: -100%;
    width: 250px;
    height: 100vh;
    background-color: black;
    color: white;
    transition: 0.3s ease;
    z-index: 1000;
}

nav ul {
    list-style-type: none;
    padding: 50px 10px;
}

nav ul li {
    margin: 20px 0;
}

nav ul li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
}

nav.active {
    left: 0;
}

.search-bar {
    margin-left: 3%;
    width: 60%;
}

.search-bar input {
    padding: 5px;
    width: 100%;
}

.login a {
    color: white;
    text-decoration: none;
}

.form-container {
    width: 60%;
    margin: 20px auto;
    margin-top: 10%;
    padding: 20px;
    border: 1px solid black;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.form-container h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-group input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.underline {
    text-decoration: underline;
}

.button-group {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

button {
    width: 48%; /* 버튼이 가로로 나란히 배열되도록 설정 */
    padding: 10px;
    background-color: black;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #333;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .form-container {
        width: 90%;
    }

    .button-group {
        flex-direction: column; /* 작은 화면에서는 세로로 배치 */
    }

    button {
        width: 100%; /* 버튼이 세로로 쌓일 때 전체 너비 사용 */
        margin-bottom: 10px; /* 버튼 간 간격 추가 */
    }
}
</style>
</head>
<body>
    <header>
        <div class="menu">
            <span class="menu-icon">&#9776;</span>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="셰프 검색">
        </div>
        <div class="login">
            <a href="#">로그인/닉네임</a>
        </div>
        <nav>
            <ul>
                <li><a href="#">셰프 목록</a></li>
                <li><a href="/TasteMasters/page/member/login">로그인</a></li>
                <li><a href="/TasteMasters/page/member/join">회원 가입</a></li>
                <li><a href="#">마이페이지</a></li>
            </ul>
        </nav>
    </header>
    <div class="form-container">
        <h2>회원정보</h2>
        <form action="updateAction.jsp" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="loginId">아이디</label>
                <input type="text" id="loginId" name="loginId" readonly class="underline">
            </div>
            <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" readonly class="underline">
            </div>
            <div class="form-group">
                <label for="gender">성별</label>
                <input type="text" id="gender" name="gender" readonly class="underline">
            </div>
            <div class="form-group">
                <label for="tel">전화번호</label>
                <input type="text" id="tel1" name="tel1" placeholder="010" required style="width: 30%;">-
                <input type="text" id="tel2" name="tel2" placeholder="0000" required style="width: 30%;">-
                <input type="text" id="tel3" name="tel3" placeholder="0000" required style="width: 30%;">
            </div>
            <div class="button-group">
                <button type="submit">정보 수정</button>
                <button type="button" onclick="location.href='/TasteMasters/page/index'">메인화면</button>
            </div>
        </form>
    </div>
<script type="text/javascript">
//사이드 메뉴 기능
document.addEventListener("DOMContentLoaded", function() {
    var menuIcon = document.querySelector('.menu-icon');
    var navMenu = document.querySelector('nav');

    menuIcon.addEventListener('click', function() {
        navMenu.classList.toggle('active');
    });
});
</script>
</body>
</html>