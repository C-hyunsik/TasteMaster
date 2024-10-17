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
#adminInput{
	display: flex;
	float:right;
	background-color: #f0f0f0;
	border-radius: 4px;
	padding: 5px;
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
           <c:choose>
 				<c:when test="${not empty sessionScope.loginId}">
                     <a href="/TasteMasters/page/member/mypage">${loginId }님</a> |
                     <a href="/TasteMasters/api/member/logout">로그아웃</a> 
                </c:when>
               
                <c:otherwise>
                    <a href="/TasteMasters/page/member/login">로그인</a> | 
                    <a href="/TasteMasters/page/member/join">회원 가입</a>
                </c:otherwise>
            </c:choose>
          
        </div>
        
    
        <nav>
            <ul>
     	   <c:if test="${sessionScope.role == 'ADMIN'}">
	                 <li><a href="/TasteMasters/page/member/admin">관리자 페이지</a></li> 
	       	  </c:if>
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
        <form id="memberJoinForm">
        	<div>
			    <h2 style="display: inline-block; margin-right: 10px;">회원가입</h2>
			    <div id="adminInput">
			        관리자 인증번호<input id="admin" type="text" style="border: none; outline: none; background: transparent;"/>
			    </div>
			    <input type="hidden" id="adminCode" value="1234"/>
			    <input type="hidden" id="role" name="role"/>
			</div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
                <div id="nameDiv"></div>
            </div>
            <div class="form-group">
                <label for="loginId">아이디</label>
                <input type="text" id="loginId" name="loginId" required>
                <div id="idDiv"></div>
                <input type="hidden" id="idCheck"/>
            </div>
            <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" id="pwd" name="pwd" required>
                <div id="pwdDiv"></div>
            </div>
            <div class="form-group">
                <label>성별</label>
                <input type="hidden" id="gender" name="gender">
                <div class="gender-group">
                    <div class="gender-option" data-value="M">남성</div>
                    <div class="gender-option" data-value="F">여성</div>
                </div>
                <div id="genderDiv"></div>
            </div>
            <div class="form-group">
				<label for="email">이메일</label>
				<div class="email-group" style="display: flex; align-items: center;">
					<input type="email" id="email" name="email" placeholder="example@example.com" required style="flex: 1;">
					<button type="button" id="sendVerification" style="margin-left: 10px;">인증번호 전송</button>
				</div>
				<div id="emailDiv"></div>
			</div>
			<div class="form-group">
			    <label for="verificationCode">인증번호</label>
			    <div class="verification-group" style="display: flex; align-items: center;">
					<input type="text" id="verificationCode" name="verificationCode" placeholder="인증번호 입력" required style="flex: 1;">
					<button type="button" id="verifyCode" style="margin-left: 10px;">확인</button>
			    </div>
			    <div id="verificationCodeDiv"></div>
			</div>

            <div class="form-group">
                <label for="tel">전화번호</label>
                <div class="tel-group">
                    <input type="text" id="tel1" name="tel1" placeholder="010" maxlength="3" required>-
                    <input type="text" id="tel2" name="tel2" placeholder="0000" maxlength="4" required>-
                    <input type="text" id="tel3" name="tel3" placeholder="0000" maxlength="4" required>
                </div>
                <div id="telDiv"></div>
            </div>
            <div class="button-group">
                <button type="button" id="joinBtn">회원가입</button>
                <button type="button" onclick="location.href='/TasteMasters/page/index'">메인화면</button>
            </div>
            <input type="hidden" name="memberId" value="0"/>
            <input type="hidden" name="reportCount" value="0"/>
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
//아이디 중복체크
$('#loginId').blur(function() {
    var loginId = $('#loginId').val();
    $('#idDiv').empty();
	if(!loginId){
		$('#idDiv').html('아이디를 입력해주세요').css('color','red');
	}
	else{
	    $.ajax({
	        type: 'post',
	        url: '/TasteMasters/api/member/idcheck',
	        data: { 'loginId': loginId },
	        success: function(response) {
	            // 성공적으로 응답을 받았을 때
	            $('#idDiv').text('사용 가능한 아이디입니다.').css('color', 'green');
	            $('#idCheck').val(loginId);
	        },
	        error: function(xhr) {
	            // 에러 발생 시 처리
	            if (xhr.status === 409) {
	                $('#idDiv').text('이미 사용 중인 아이디입니다.').css('color', 'red');
	            } else {
	                $('#idDiv').text('오류가 발생했습니다.').css('color', 'red');
	            }
	        }
	    });
	}
});

$('#joinBtn').click(function(){
	name = $('#name').val();
	pwd = $('#pwd').val();
	gender = $('#gender').val();
	email = $('#email').val();
	verificationCode = $('#verificationCode').val();
	tel1 = $('#tel1').val();
	tel2 = $('#tel2').val();
	tel3 = $('#tel3').val();

	$('#nameDiv').empty();
	$('#pwdDiv').empty();
	$('#genderDiv').empty();
	$('#emailDiv').empty();
	$('#verificationCodeDiv').empty();
	$('#telDiv').empty();
	
	admin = $('#admin').val();			//내가 입력한 코드
	adminCode = $('#adminCode').val();	//1234

	//관리자 권한 요청
	if(admin != adminCode){
		//코드가 틀리면 role=USER
		$('#role').val('USER');
		//입력하지 않았으면 alert창 띄우지 않기
		if(!admin){
			$('#role').val('USER');
		}
		else{
			alert('코드가 틀립니다');
		}
	}
	else{
		//코드가 맞으면 role=ADMIN
		$('#role').val('ADMIN');
	}
	
	if(!name){
		$('#nameDiv').html('이름을 입력하세요').css('color','red');
	}
	else if(!pwd){
		$('#pwdDiv').html('비밀번호를 입력하세요').css('color','red');
	}
	else if(!gender){
		$('#genderDiv').html('성별을 선택하세요').css('color','red');
	}
	else if(!email){
		$('#emailDiv').html('이메일을 입력하세요').css('color','red');
	}
	else if(!verificationCode){
		$('#verificationCodeDiv').html('인증번호를 입력하세요').css('color','red');
	}
	else if(!tel1 || !tel2 || !tel3){
		$('#telDiv').html('전화번호를 입력하세요').css('color','red');
	}
	else{
		$.ajax({
			type:'post',
			url:'/TasteMasters/api/member/join',
			data:$('#memberJoinForm').serialize(),
			success:function(){
				if($('#role').val() == 'ADMIN'){
					alert('관리자로 회원가입합니다.');
				}
				else{
					alert('회원가입이 완료되었습니다.')					
				}
				location.href='/TasteMasters/page/index';
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