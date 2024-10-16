<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
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
    margin: 10% auto; /* 중앙 배치 */
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

.button-group {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

button {
    width: 32%; /* 버튼이 가로로 나란히 배열되도록 설정 */
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
.sns-login {
    text-align: center;
    margin-top: 5%;
}

.sns-buttons {
    display: flex;
    justify-content: center;
    gap: 10%; /* 버튼 간 간격 */
    margin: 2% 0;
}

.sns-button {
    width: 50px; /* 버튼의 너비 */
    height: 50px; /* 버튼의 높이 */
    border-radius: 50%; /* 동그란 모양 */
    overflow: hidden; /* 이미지가 버튼을 넘지 않도록 */
    cursor: pointer;
    border: 1px solid #ccc; /* 테두리 색상 */
    transition: transform 0.3s; /* 호버 효과 */
}

.sns-button:hover {
    transform: scale(1.1); /* 호버 시 버튼 확대 효과 */
}

.sns-button img {
    width: 100%; /* 이미지가 버튼 크기에 맞게 조정 */
    height: auto; /* 비율 유지 */
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
           <c:choose>
 				<c:when test="${not empty sessionScope.loginId}">
                     <a href="/TasteMasters/page/member/mypage">${loginId }님 마이페이지</a> |
                     <a href="/TasteMasters/api/member/logout">로그아웃</a> 
                </c:when>
               
                <c:otherwise>
                    <a href="/TasteMasters/page/member/login">로그인</a>
                </c:otherwise>
            </c:choose>
          
        </div>
        
    
        <nav>
            <ul>
                <li><a href="/TasteMasters/page/index">셰프 목록</a></li>
                <c:choose>
                 
                    <c:when test="${not empty sessionScope.loginId}">
                        <li><a href="/TasteMasters/page/member/mypage">마이페이지</a></li>
                        <li><a href="/TasteMasters/api/member/logout">로그아웃</a> </li>
                    </c:when>
          
                    <c:otherwise>
                        <li><a href="/TasteMasters/page/member/login">로그인</a></li>
                        <li><a href="/TasteMasters/page/member/join">회원 가입</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </header>

    <div class="form-container">
	    <h2>로그인</h2>
	    <form action="loginAction.jsp" method="post">
	        <div class="form-group">
	            <label for="loginId">아이디</label>
	            <input type="text" id="loginId" name="loginId" required>
	            <div id=idDiv></div>
	        </div>
	        <div class="form-group">
	            <label for="pwd">비밀번호</label>
	            <input type="password" id="pwd" name="pwd" required>
	            <div id=pwdDiv></div>
	        </div>
	        <div class="button-group">
	            <button type="button" id="loginBtn">로그인</button>
	            <button type="button" onclick="location.href='/TasteMasters/page/member/join'">회원가입</button>
	            <button type="button" onclick="location.href='/TasteMasters/page/index'">메인화면</button>
	        </div>
	    </form>
	
	    <div class="sns-login">
	        <h3>SNS로 로그인</h3>
	        <div class="sns-buttons">
	            <div class="sns-button" id="kakao-login">
	                <img src="../image/kakao.jpg" alt="카카오톡 로그인" />
	            </div>
	            <div class="sns-button" id="naver-login">
	                <img src="../image/naver.jpg" alt="네이버 로그인" />
	            </div>
	            <div class="sns-button" id="google-login">
	                <img src="../image/google.jpg" alt="구글 로그인" />
	            </div>
	        </div>
	    </div>
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
});

$('#loginBtn').click(function(){
	loginId = $('#loginId').val();
	pwd = $('#pwd').val();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if(!loginId){
		$('#idDiv').html('아이디를 입력해주세요').css('color','red');
	}
	else if(!pwd){
		$('#pwdDiv').html('아이디를 입력해주세요').css('color','red');
	}
	else{
		$.ajax({
			type:'post',
			url:'/TasteMasters/api/member/login',
			data:{
				'loginId':loginId,
				'pwd':pwd
			},
			success:function(){
				alert(loginId + '님 로그인');
				location.href = '/TasteMasters/page/index';
			},
			error:function(e){
				console.log(e);
			}
		});
	}
});
</script>
</body>
</html>