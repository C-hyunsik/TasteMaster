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
    height: auto; /* 높이 자동 조정 */
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
.login a {
    color: white;
    text-decoration: none;
}
.search-bar {
    margin-left: 3%;
    width: 60%;
}

.search-bar input {
    padding: 5px;
    width: 100%;
}

.table-container {
    display: flex;
    margin: 20px auto;
    width: 80%;
    height: auto; /* 높이 자동 조정 */
}

.image-container {
    width: 50%; /* PC 화면에서 이미지 너비 */
    padding-right: 20px;
    padding-left: 20px;
    display: flex;
    flex-direction:column;
    align-items: center;
    justify-content: center;
    margin:auto 0;
    background-color: #f9f9f9;
}

.image-container img {
    width: 100%;
    border-radius: 5px;
}

.content-container {
    width: 50%; /* PC 화면에서 콘텐츠 너비 */
    background-color: #f9f9f9;
    padding: 20px;
}

.content-container h2 {
    text-align: center;
    margin-bottom: 20px;
}

#post_cardWrap {
    width: 100%;
}

.post-card {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 15px;
    margin-bottom: 15px; /* 카드 간 간격 */
    transition: box-shadow 0.3s;
}

.post-card:hover {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 효과 */
}

.post-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
}

.post-meta {
    font-size: 14px;
    color: #666; /* 작성자 및 날짜 색상 */
}

.button-group {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

button {
    padding: 10px 20px;
    background-color: black;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 0 10px;
}

button:hover {
    background-color: #333;
}

#pagingWrap {
    text-align: center;
    margin-top: 20px;
}

#paging {
    display: inline-block;
    padding: 5px 10px;
    margin: 0 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

#paging:hover {
    background-color: #f0f0f0;
}

#currentPaging {
    display: inline-block;
    padding: 5px 10px;
    margin: 0 5px;
    background-color: black;
    color: white;
    border-radius: 5px;
}

#movepaging {
    display: inline-block;
    padding: 5px 10px;
    margin: 0 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

#movepaging:hover {
    background-color: #f0f0f0;
}

#noContent {
    color: #999;
    font-style: italic;
}
@media (min-width: 769px) {
	body{
		height: 100vh;
	}
	.table-container{
		height: 65%;
	}
	.image-container{
		height: 100%;
	}
	#post_cardWrap{
		height: 75%;
	}
	.content-container{
		height: 100%;
	}
	
}
@media (max-width: 768px) {
    .table-container {
        flex-direction: column; /* 모바일에서 세로 방향으로 정렬 */
        width: 90%; /* 모바일 화면에서 너비 조정 */
    }

    .image-container {
        width: 100%; /* 모바일에서 전체 너비 사용 */
        height: auto; /* 높이 자동 조정 */
    }

    .content-container {
        width: 100%; /* 모바일에서 전체 너비 사용 */
        height: auto; /* 높이 자동 조정 */
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
	        	<h2>${dishInfo.dishName }</h2>
	        </div>
	        <div id="imgWrap">
	        	<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-135/storage/${dishInfo.imageFileName}" alt="${dishInfo.dishName}">
            </div>
            <div id="contentWrap">
	        	<pre>${dishInfo.dishContent }</pre>
            </div>
        </div>
        <div class="content-container">
        <br><br><br>
            <div id="post_cardWrap">
                <c:forEach var="list" items="${map2.list}">
                    <div class="post-card" onclick="location.href='/TasteMasters/page/post/view?dishId='+${dishInfo.dishId}+'&postId='+${list.postId}" style="cursor:pointer;">
                        <div class="post-title">${list.title }</div>
                        <div class="post-meta">작성자: ${list.name } | 작성일: ${list.createdAtToString }</div>
                    </div>
                </c:forEach>
            	<div id="pagingWrap">
                	${map2.postPaging.pagingHTML }
            	</div>
            	<div class="button-group">
	                <button onclick="location.href='/TasteMasters/page/post/dishPostWrite?dishId='+${dishInfo.dishId}">글쓰기</button>
	                <button onclick="location.href='/TasteMasters/page/index'">메인화면</button>
	         	</div>
            </div>
        </div>
        <input type="hidden" id="dishId" value="${dishInfo.dishId}">
    </div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
//페이징 처리
function postPaging(pg) {
	dishId = $('#dishId').val();
    location.href = '/TasteMasters/page/post/dishPostList?pg=' + pg + "&dishId=" + dishId;
}
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
