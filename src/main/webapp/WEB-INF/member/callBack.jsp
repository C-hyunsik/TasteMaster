<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">
var name;
var email;
var gender;
var mobile;

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "AlpD5zZwk5wWNXV6GfC6", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/TasteMasters/page/member/callBack", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

    // sendNaverLoginData 함수를 정의합니다.
    function sendNaverLoginData(name, email, gender, mobile) {
        $.ajax({
            type: 'post',
            url: '/TasteMasters/api/member/naverLogin',
            data: {
                'name': name, 
                'email': email, 
                'gender': gender,
                'mobile': mobile,
            },
            dataType: 'text',
            success: function(data) {
                if(data == "1") {
                	alert("네이버 로그인 성공했습니다.");
                	location.href = "/TasteMasters/page/index";
                }
            }
        }); // ajax
    }


window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
			
			//alert(naverLogin.user.getMobile()); //확인용
			
			name= naverLogin.user.getName();
			email= naverLogin.user.getEmail();
			gender= naverLogin.user.getGender();
			mobile= naverLogin.user.getMobile();
			
			//console.log(name);
			}  
		sendNaverLoginData(name, email, gender, mobile);
	});
}); //addEventListener




var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>
</head>
<body>

</body>
</html>