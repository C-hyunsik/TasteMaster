<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>음식 사진 목록</title>
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
.countWrap {
    display: flex; /* 플렉스 박스를 사용하여 정렬 */
    justify-content: flex-end; /* 오른쪽 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    margin-top: 10px; /* 위쪽 여백 추가 */
}

.countWrap img {
    margin-left: 5px; /* 아이콘과 숫자 간 간격 */
    margin-right: 5px; /* 아이콘 사이 간격 */
    width:45px;
	height: 45px;
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
            <input type="text" id = "keyword" placeholder="셰프 검색">
        </div>
		<div>
		  <input type="button" id="searchBtn" value="검색">
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
        <div class="image-container">
            <div id="h2Wrap">
                <h2>${chefInfo.chefName }</h2> <!-- 셰프 이름 -->
            </div>
            <div id="imgWrap">
                <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-135/storage/${chefInfo.imageFileName}" alt="${chefInfo.chefName}">
            </div>
        </div>
        <div class="content-container">
            <h2>음식 목록</h2>
            <div id="post_cardWrap">
                <section class="chef-list">
					<c:forEach var="dish" items="${dishList}">
					<div>
						<div class="dish" onclick="location.href='/TasteMasters/page/post/dishPostList?chefId='+${chefInfo.chefId }+'&dishId='+${dish.dishId}" style="cursor:pointer;">
							<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-135/storage/${dish.imageFileName}" alt="${dish.dishName}">
							<p>${dish.dishName}</p>
						</div>
						<div class="countWrap">
							<img src="../image/tasty.png" alt="tasty" style="cursor:pointer;"/> : <span>${dish.deliciousCount }</span>
							<img src="../image/easy.jpg" alt="easy" style="cursor:pointer;"/> : <span>${dish.makeEasyCount }</span>
							<input type="hidden" id="dishId" value="${dish.dishId}"/>
						</div>
					</div>
					</c:forEach>
                </section>
            </div>
        </div>
    </div>
<<<<<<< HEAD
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
=======
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
>>>>>>> 05699b749762c6f0de14a8298f0a229a61752eac
<script type="text/javascript">
// 메뉴 아이콘 클릭 시 메뉴 슬라이드 토글
document.addEventListener("DOMContentLoaded", function() {
    var menuIcon = document.querySelector('.menu-icon');
    var navMenu = document.querySelector('nav');

    menuIcon.addEventListener('click', function() {
        navMenu.classList.toggle('active'); // 메뉴 보이기/숨기기
    });
<<<<<<< HEAD
});
$('.countWrap img[alt="tasty"]').click(function() {
    // 부모 요소에서 hidden input을 찾아 dishId 가져오기
    var dishId = $(this).closest('div').find('input[type="hidden"]').val();
    $.ajax({
        type: 'post',
        url: '/TasteMasters/api/dish/deliciousCount',
        data: {'dishId': dishId},
        success: function() {
            window.location.reload();
        },
        error: function(e) {
            console.log('오류:', e);
        }
    });
});
$('.countWrap img[alt="easy"]').click(function() {
    // 부모 요소에서 hidden input을 찾아 dishId 가져오기
    var dishId = $(this).closest('div').find('input[type="hidden"]').val();
    $.ajax({
        type: 'post',
        url: '/TasteMasters/api/dish/easyCount',
        data: {'dishId': dishId},
        success: function() {
            window.location.reload();
        },
        error: function(e) {
            console.log('오류:', e);
        }
    });
});
=======
    
    $(function(){
    	document.getElementById('searchBtn').addEventListener('click', function() {
    	    var keyword = document.getElementById('keyword').value;

    	    if (keyword.trim() === '') {
    	        alert('검색어를 입력하세요.');
    	        return;
    	    }

    	    // AJAX 요청
    	    $.ajax({
    	        url: '/TasteMasters/page/search',  // 서버의 검색 URL
    	        type: 'GET',
    	        data: { keyword: keyword },  // 서버로 전달할 데이터 (쿼리스트링)
    	        success: function(response) {
    	            // 검색 결과에 따라 페이지 이동
    	            // 예: 검색 결과 페이지로 리디렉션
    	            window.location.href = '/TasteMasters/page/search?keyword=' + encodeURIComponent(keyword);
    	        },
    	        error: function() {
    	            alert('검색에 실패했습니다.');
    	        }
    	    });
    	});

    });
>>>>>>> 05699b749762c6f0de14a8298f0a229a61752eac
</script>
</body>
</html>