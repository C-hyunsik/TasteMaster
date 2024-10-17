<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수정</title>
<link rel="stylesheet" href="../css/index.css">
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

.table-container {
    display: flex;
    margin: 20px auto;
    width: 80%;
    height: auto; /* 높이 자동 조정 */
}

.image-container {
    width: 50%; /* 셰프 이미지 너비 */
    padding: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-color: #f9f9f9;
}
.image-container h2{
	margin-bottom: 20px;
}
.image-container img {
    width: 70%; /* 셰프 사진 크기 조정 */
    border-radius: 5px;
}
#imgWrap{
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom:20px;
}
.content-container {
    width: 65%; /* 콘텐츠 너비 */
    background-color: #f9f9f9;
    padding-top: 20px;
}

.content-container h2 {
    text-align: center;
    margin-bottom: 20px;
}
#post_cardWrap{
	width: 100%;
}
.chef-list {
	width:80%;
    display: grid;
    grid-template-columns: repeat(2, 1fr); /* 한 줄에 2개 배치 */
    gap: 20px; /* 카드 사이 간격 */
    margin: 0 auto;
}

.dish {
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    margin: 10px;
    text-align: center;
    overflow: hidden;
    transition: transform 0.3s;
}

.dish img {
    width: 100%;
    height: auto;
}

.dish p {
    padding: 10px;
    font-weight: bold;
    color: #444;
    background-color: #f0f0f0;
}

.dish:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

@media (max-width: 768px) {
    .table-container {
        flex-direction: column; /* 모바일에서 세로 방향으로 정렬 */
        width: 90%; /* 모바일 화면에서 너비 조정 */
    }

    .image-container {
        width: 100%; /* 모바일에서 전체 너비 사용 */
        text-align: center; /* 모바일에서 중앙 정렬 */
    }

    .content-container {
        width: 100%; /* 모바일에서 전체 너비 사용 */
    }

	.chef-list {
    	grid-template-columns: repeat(1, 1fr); /* 한 줄에 2개 배치 */
	}
    .dish {
        width: 100%; /* 모바일에서는 카드 크기 조정 */
    }
    
.button-container {
        display: flex;
        justify-content: center; /* 버튼을 수평 중앙 정렬 */
        margin-top: 10px; /* 이미지와 버튼 사이의 간격 조정 */
        width: 100%; /* 부모 요소의 너비를 100%로 설정 */
    }

.button-container input {
        padding: 10px; /* 버튼 내부 여백 조정 */
        border: 1px solid #ccc; /* 테두리 스타일 조정 */
        border-radius: 5px; /* 모서리 둥글게 */
        background-color: #fff; /* 배경색 */
        cursor: pointer; /* 커서 모양 변경 */
    }
span {
	font-size: 8px;
}

}
</style>
</head>
<body>
    <header>
        <div class="logo">
        	<a href="/TasteMasters/page/index"><img alt="로고" src="../image/logo.png" width="40px" height="40px"></a>
        </div>
        
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
    
    <nav>
        <ul>
            <li><a href="/TasteMasters/page/index">셰프 목록</a></li>
            <c:choose>
                <c:when test="${not empty sessionScope.loginId}">
                    <li><a href="/TasteMasters/page/member/mypage">마이페이지</a></li>
                    <li><a href="/TasteMasters/api/member/logout">로그아웃</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/TasteMasters/page/member/login">로그인</a></li>
                    <li><a href="/TasteMasters/page/member/join">회원 가입</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>

    <div class="table-container">
	    <form id="chefImage">
		    <div class="image-container">
		        <div id="h2Wrap">
		            <h2>${chefInfo.chefName }</h2> <!-- 셰프 이름 -->
		        </div>
		        <input type="hidden" id="chefId" name="chefId" value="${chefInfo.chefId}">
		        <div id="imgWrap" style="cursor: pointer;">
		            <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-135/storage/${chefInfo.imageFileName}" alt="${chefInfo.chefName}">
		        </div>
		        <input type="file" name="imageUpdateBtn" id="imageUpdateBtn" style="display: none;"> <!-- 숨겨진 파일 선택 버튼 -->
		        <div>
		        	<p>이미지를 수정을 원하시면 사진을 클릭! </p>
		        	<input type="button" id="chefImgUpdateBtn" name="chefImgUpdateBtn" value="사진 변경하기">
		        </div>
		    </div>
        </form>

        <div class="content-container">
            <h2>음식 목록</h2>
            <div id="post_cardWrap">
                <section class="chef-list">
				    <c:forEach var="dish" items="${dishList}">
				        <div class="dish" onclick="location.href='/TasteMasters/page/post/dishPostList?dishId='+${dish.dishId}" style="cursor:pointer;">
				            <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-135/storage/${dish.imageFileName}" alt="${dish.dishName}">
				            <p>${dish.dishName}</p>
				        </div>
				      
				            <input type="button" class="dishUpdateBtn" name="dishUpdateBtn" value="수정하기" 
				            	onclick="location.href='/TasteMasters/page/dish/updateDishForm?dishId=${dish.dishId}'">
				   
				    </c:forEach>
				</section>

            </div>
        </div>
    </div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script type="text/javascript" src="../js/chefImgUpdate.js"></script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        var menuIcon = document.querySelector('.menu-icon');
        var navMenu = document.querySelector('nav');
        var imgWrap = document.getElementById('imgWrap'); // 이미지 래퍼
        var fileInput = document.getElementById('imageUpdateBtn'); // 파일 입력 요소

        // 메뉴 아이콘 클릭 시 메뉴 슬라이드 토글
        menuIcon.addEventListener('click', function() {
            navMenu.classList.toggle('active'); // 메뉴 보이기/숨기기
        });

        // 이미지 래퍼 클릭 시 파일 선택 창 열기
        imgWrap.addEventListener('click', function() {
            fileInput.click(); // 파일 입력 요소 클릭
        });
    });
    
 // 쉐프 이미지 미리보기
    $('#imageUpdateBtn').change(function(){
        $('#imgWrap').empty(); // 기존 이미지 제거
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = document.createElement('img');
            img.src = e.target.result;
            img.width = 100;  // 이미지 크기 조정
            img.height = 100;
            $('#imgWrap').append(img);
        }
        reader.readAsDataURL(this.files[0]);
    });
    
</script>

</body>
</html>