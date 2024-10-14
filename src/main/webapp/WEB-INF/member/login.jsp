<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="icon" href="/path/to/your/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="/MamondeProject/css/reset.css">
	<link rel="stylesheet" href="/MamondeProject/css/login.css">
</head>

<body>
	<div class="logo image">
		<h1><a href="/MamondeProject/page/index">SUMONDE</a></h1>
	</div>
	<br><br>

	<form>
		<div class="form-group">
			<input type="text" class="form-control" id="user_id" name="user_id" aria-describedby="emailHelp"
				placeholder="아이디">
			<div id="idDiv"></div>
		</div>


		<div class="form-group">
			<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
			<div id="pwdDiv"></div>
		</div>

		<div class="login-button">
			<button type="submit" class="btn btn-primary">로그인</button>
		</div>

		<div class="form-check">
			<input type="checkbox" class="form-check-input" id="remberId">
			<label class="rememberId">아이디 저장</label>
		</div>
	</form>

	<hr width="350px" align="center">
	<p class="easy-login" align="center">더욱 간편한 로그인</p>

	<br>

	<div class="button-group">
		<button type="button" class="btn btn-primary btn-lg">QR코드 로그인</button>
		<button type="button" class="btn btn-secondary btn-lg">일회용 번호 로그인</button>
	</div>
	<br><br>
	<footer class="footer">
		<div class="footer-info">
			<a href="/MamondeProject/page/index">홈으로</a> |
			<a href="#">아이디 찾기</a> |
			<a href="#">비밀번호 찾기</a> |
			<a href="/MamondeProject/page/user/join">회원가입</a><br>
		</div>
	</footer>

	<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		$(function () {		
	        // 페이지 로드 시 로컬스토리지에 저장된 아이디가 있는지 확인 !!
	        if (localStorage.getItem('savedUserId')) {
	            $('#user_id').val(localStorage.getItem('savedUserId'));
	            $('#remberId').prop('checked', true); // 체크박스도 체크된 상태로 표시
	        }
	        
			$('form').on('submit', function (event) {
				event.preventDefault();

				$('#idDiv').empty();
				$('#pwdDiv').empty();
				let isValid = true;

				// 아이디 검사
				if ($('#user_id').val() == '') {
					$('#idDiv').html('아이디를 입력하세요.');
					$('#user_id').focus();
					isValid = false;
				}
				// 비밀번호 검사
				if ($('#user_pwd').val() == '') {
					$('#pwdDiv').html('비밀번호를 입력하세요.');
					$('#user_pwd').focus();
					isValid = false;
				}
				let loginData = {
						'user_id' : $('#user_id').val().trim(),
						'password': $('#password').val().trim(),
				};
				// 유효성 검사를 모두 통과한 경우에만 ajax 요청 실행한다.
				if (isValid) {
					$.ajax({
						type: 'post',
						url: '/MamondeProject/api/user/login',
						contentType: 'application/json',
						data: JSON.stringify(loginData), 
						success: function(data, textStatus, jqXHR) {
							console.log(data);
							 if(jqXHR.status === 200){ // 200 OK
								alert('로그인에 성공하였습니다!');
							 
	                            // 아이디 저장 체크박스가 체크된 경우 로컬스토리지에 저장
	                            if ($('#remberId').is(':checked')) {
	                                localStorage.setItem('savedUserId', $('#user_id').val().trim());
	                            } else 
	                                localStorage.removeItem('savedUserId'); // 체크되지 않으면 아이디 삭제
	                            window.location.href = "/MamondeProject/page/index";
							} 
						},
						error: function(xhr, textStatus, errorThrown) {
							//	console.log(e);
							if (xhr.status === 401) {	// Unauthorized  
								alert('아이디 또는 비밀 번호가 일치하지 않습니다.');
							}
						}
					});
				}
			});
		});
	</script>
</body>

</html>