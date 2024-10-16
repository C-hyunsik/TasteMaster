<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
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

.banner {
    background-color: #f2f2f2;
    text-align: center;
    padding: 20px;
    margin: 20px 0;
    height: 150px;
}

.form-container {
    width: 60%;
    margin: 20px auto;
    margin-top:10%;
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
.form-group button{
	width: 20%;
}

.gender-group {
    display: flex;
    justify-content: space-between;
}

.gender-option {
    flex: 1;
    margin-right: 10px;
    text-align: center;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.gender-option:last-child {
    margin-right: 0;
}

.gender-option.selected {
    background-color: black;
    color: white;
    border: 1px solid white;
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

/* 전화번호 입력 필드 스타일 */
.tel-group {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.tel-group input {
    width: 30%;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .form-container {
        width: 90%;
    }

    .tel-group input {
        width: 100%;
        margin-bottom: 10px;
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
				<li><a href="/TasteMasters/page/member/mypage">마이페이지</a></li>
			</ul>
        </nav>
    </header>
    <div class="form-container">
        <h2>회원가입</h2>
        <form id="memberJoinForm" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="loginId">아이디</label>
                <input type="text" id="loginId" name="loginId" required>
            </div>
            <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <div class="form-group">
                <label>성별</label>
                <input type="hidden" id="gender" name="gender">
                <div class="gender-group">
                    <div class="gender-option" data-value="M">남성</div>
                    <div class="gender-option" data-value="F">여성</div>
                </div>
            </div>
            <div class="form-group">
				<label for="email">이메일</label>
				<div class="email-group" style="display: flex; align-items: center;">
					<input type="email" id="email" name="email" placeholder="example@example.com" required style="flex: 1;">
					<button type="button" id="sendVerification" style="margin-left: 10px;">인증번호 전송</button>
				</div>
			</div>
			<div class="form-group">
			    <label for="verificationCode">인증번호</label>
			    <div class="verification-group" style="display: flex; align-items: center;">
					<input type="text" id="verificationCode" name="verificationCode" placeholder="인증번호 입력" required style="flex: 1;">
					<button type="button" id="verifyCode" style="margin-left: 10px;">확인</button>
			    </div>
			</div>

            <div class="form-group">
                <label for="tel">전화번호</label>
                <div class="tel-group">
                    <input type="text" id="tel1" name="tel1" placeholder="010" required>-
                    <input type="text" id="tel2" name="tel2" placeholder="0000" required>-
                    <input type="text" id="tel3" name="tel3" placeholder="0000" required>
                </div>
            </div>
            <div class="button-group">
                <button id="joinBtn">회원가입</button>
                <button type="button" onclick="location.href='/TasteMasters/page/index'">메인화면</button>
            </div>
        </form>
    </div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
//사이드 메뉴 기능
document.addEventListener("DOMContentLoaded", function() {
	var menuIcon = document.querySelector('.menu-icon');
	var navMenu = document.querySelector('nav');

	menuIcon.addEventListener('click', function() {
		navMenu.classList.toggle('active');
	});

	// 성별 선택 기능
	var genderOptions = document.querySelectorAll('.gender-option');
	genderOptions.forEach(function(option) {
		option.addEventListener('click', function() {
			genderOptions.forEach(opt => opt.classList.remove('selected')); // 이전 선택 제거
			option.classList.add('selected'); // 현재 선택 추가
			document.getElementById('gender').value = option.dataset.value; // hidden input에 값 설정
		});
	});
});
$('#joinBtn').click(function(){
	$.ajax({
		type:'post',
		url:'/TasteMasters/api/member/join',
		data:$('#memberJoinForm').serialize(),
		success:function(){
			alert('회원가입이 완료되었습니다.')
			location.href='/TasteMasters/page/index';
		},
		error:function(e){
			console.log(e);
		}
	});
});
</script>
</body>
</html>