<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>


	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="icon" href="/path/to/your/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="/MamondeProject/css/reset.css">
	<link rel="stylesheet" href="/MamondeProject/css/join.css">
</head>

<body>
	<div class="logo image">
		<h1><a href="/MamondeProject/page/index">SUMONDE</a></h1>
	</div>
	<br><br>

	<form>
		<div class="form-group">
			<input type="text" class="form-control" name="name" id="user_name" placeholder="이름">
			<div id="nameDiv"></div>
		</div>

		<div class="form-group">
			<input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디">
			<div id="idDiv"></div>
		</div>

		<div class="form-group">
			<input type="password" class="form-control" name="password" id="user_pwd" placeholder="비밀번호">
			<div id="pwdDiv"></div>
		</div>

		<div class="form-group">
			<input type="password" class="form-control" name="confirm_pwd" id="confirm_pwd" placeholder="비밀번호 확인">
			<div id="confirm_pwdDiv"></div>
		</div>
		
		<div class="form-group">
			<input type="email" class="form-control" name="email" id="user_email" placeholder="이메일">
			<div id="emailDiv"></div>
		</div>
		
		<div class="form-group">
			<input type="number" class="form-control" name="phone_number" id="phone_number" placeholder="전화 번호">
			<div id="phoneDiv"></div>
		</div>

		<!-- 일반 회원, 관리자 라디오 버튼 -->
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="role" id="flexRadioDefault1" value="USER" checked>
		  <label class="form-check-label" for="flexRadioDefault1" >
		    일반 회원
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="role" id="flexRadioDefault2" value="ADMIN">
		  <label class="form-check-label" for="flexRadioDefault2" >
		   관리자
		  </label>
		</div>
		
		<div class="signup-button">
			<button type="button" id = "signup-button" class="btn btn-primary">회원가입</button>
		</div>
		
	</form>

	<hr width="350px" align="center">
	<p class="easy-signup" align="center">이미 계정이 있으신가요? <a href="/MamondeProject/page/user/login">로그인</a></p>

	<br><br>
	<footer class="footer">
		<div class="footer-info">
			<a href="/MamondeProject/page/index">홈으로</a> |
			<a href="#">이용 약관</a> |
			<a href="#">개인정보 처리방침</a>
		</div>
	</footer>

	<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		$(function () {
			let isIdAvailable = false;  // 아이디 사용 가능 여부를 저장하는 변수

			$('#user_id').on('focusout', function () {
				// 아이디 입력값 가져오기
				let user_id = $('#user_id').val();

				// 아이디가 비어 있는지 확인
				if (user_id === '') {
					$('#idDiv').html('아이디를 입력하세요.').css('color', 'red');
					isIdAvailable = false;  // 아이디가 비어 있으면 사용 불가능으로 설정
					return;
				}
				let data = {'user_id': user_id };
				// 아이디 중복검사 
				$.ajax({
					type: 'post',
					url: '/MamondeProject/api/user/idcheck',
					contentType: 'application/json',
					data: JSON.stringify(data), 
					success: function(data, textStatus, jqXHR) {
				    console.log(data);
				       if(jqXHR.status === 200){ // 200 OK 사용 가능
				    		$('#idDiv').html('사용 가능한 아이디입니다.').css('color', 'green');
							isIdAvailable = true;  // 사용 가능하면 true로 설정
			           }
				    },
				    error: function(xhr, textStatus, errorThrown) {
					   //console.log(e);
						if (xhr.status === 409) {	// Conflict 중복
							$('#idDiv').html('이미 사용 중인 아이디입니다.').css('color', 'red');
							isIdAvailable = false;  // 사용 불가능하면 false로 설정
						}
		        	}
				});//ajax 끝
			});

			$('#signup-button').on('click', function (event) {

				$('#nameDiv').empty();
				$('#idDiv').empty();
				$('#emailDiv').empty();
				$('#pwdDiv').empty();
				$('#confirm_pwdDiv').empty();
				let isValid = true;

				// 아이디 중복 여부 검사
				if (!isIdAvailable) {
					$('#idDiv').html('이미 사용 중인 아이디입니다.').css('color', 'red');
					$('#user_id').focus();
					isValid = false;
				}

				// 이름 검사
				if ($('#user_name').val() == '') {
					$('#nameDiv').html('이름을 입력하세요.').css('color', 'red');
					$('#user_name').focus();
					isValid = false;
				}

				// 아이디 검사
				if ($('#user_id').val() == '') {
					$('#idDiv').html('아이디를 입력하세요.').css('color', 'red');
					$('#user_id').focus();
					isValid = false;
				} else if ($('#user_id').val().length < 5) {
					$('#idDiv').html('아이디를 5글자 이상 입력하세요.').css('color', 'red');
					$('#user_id').focus();
					isValid = false;
				}

				// 이메일 검사
				if ($('#user_email').val().trim() == '') {
					$('#emailDiv').html('이메일을 입력하세요.').css('color', 'red');
					$('#user_email').focus();
					isValid = false;
				}

				// 비밀번호 검사
				if ($('#user_pwd').val().trim() == '') {
					$('#pwdDiv').html('비밀번호를 입력하세요.').css('color', 'red');
					$('#user_pwd').focus();
					isValid = false;
				}

				// 비밀번호 확인 검사
				if ($('#confirm_pwd').val() == '') {
					$('#confirm_pwdDiv').html('비밀번호 확인을 해주세요.').css('color', 'red');
					$('#confirm_pwd').focus();
					isValid = false;
				} else if ($('#user_pwd').val() != $('#confirm_pwd').val()) {
					$('#confirm_pwdDiv').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
					$('#confirm_pwd').val('');
					$('#confirm_pwd').focus();
					isValid = false;
				}
				
				let userData = {
					'name' : $('#user_name').val().trim() ,
					'user_id' : $('#user_id').val().trim(),
					'email': $('#user_email').val().trim(),
					'phone_number': $('#phone_number').val().trim(),
					'password': $('#user_pwd').val().trim(),
					'role': $('input[name="role"]:checked').val()	
				};
				
				// 유효성 검사를 모두 통과한 경우에만 ajax 요청 실행한다.
				if (isValid) {
					$.ajax({
						type: 'post',
						url: '/MamondeProject/api/user/join',
						contentType: 'application/json',
						data: JSON.stringify(userData), 
						success: function(data, textStatus, jqXHR) {
							console.log(data);
							 if(jqXHR.status === 201){ // 201 CREATED
								alert('회원가입에 성공하였습니다!');
								window.location.href = "/MamondeProject/page/index";  // 회원가입 성공 시 페이지 이동
							} 
						},
					    error: function(xhr, textStatus, errorThrown) {
							//console.log(e);
							if (xhr.status === 400) {	// Bad Request
								alert('회원가입에 실패하였습니다.');
							}
							else if (xhr.status === 409) {	// Conflict 중복
								alert('중복된 아이디입니다.');
							}
						}
					});
				}
			});
		});
	</script>
</body>

</html>