<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chef List</title>
<link rel="stylesheet" href="../css/index.css">
<style type="text/css">

.chefUploadContainer {
    position: relative;
    margin-bottom: 20px; /* 셰프 목록과의 간격 조정 */
    text-align: right;
    width: 100%;
}

#chefUpload {
    position: relative;
    right: 14%; /* 화면 오른쪽 끝에 위치시키기 */
    padding: 10px 20px;
    background-color: rgba(0, 0, 0, 0.7); 
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
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

     	   <c:if test="${sessionScope.role == 'ADMIN'}">
	                 <a href="/TasteMasters/page/member/admin">관리자 페이지</a>
	       </c:if>
           <c:choose>
 				<c:when test="${not empty sessionScope.loginId}">
                     <a href="/TasteMasters/page/member/mypage">${loginId }님 마이페이지</a>
                     <a href="/TasteMasters/api/member/logout">로그아웃</a> 
                </c:when>
               
                <c:otherwise>
                    <a href="/TasteMasters/page/member/login">로그인</a> 
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
    
 
    <section class="banner">
		<img src="../image/banner.jpg" alt="배너 이미지" class="banner-img" />
	</section>
	
	<div class="chefUploadContainer">
		<input type="button" id="chefUpload" name="chefUpload" value="등록하기" />
	</div>

	<section class="chef-list">
		<c:forEach var="chef" items="${chefList}">
			<div class="chef">
				<input type="hidden" class="chefId" value="${chef.chefId}">
					<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-135/storage/${chef.imageFileName}" alt="${chef.chefName}">
					<p>${chef.chefName}</p>
				<input type="button" name="chefUpdate" id="chefUpdateBtn" onclick="location.href='/TasteMasters/page/admin/chefUpdate?chefId=${chef.chefId}'" value="수정"/>
				<input type="button" name="chefDelete" id="chefDeleteBtn" value="삭제"/>
			</div>
		</c:forEach>
	</section>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script type="text/javascript" src="../js/chefUpdate.js"></script>
<script type="text/javascript" src="../js/chefDelete.js"></script>
<script type="text/javascript">
// 메뉴 아이콘 클릭 시 메뉴 슬라이드 토글
document.addEventListener("DOMContentLoaded", function() {
    var menuIcon = document.querySelector('.menu-icon');
    var navMenu = document.querySelector('nav');

    menuIcon.addEventListener('click', function() {
        navMenu.classList.toggle('active'); // 메뉴 보이기/숨기기
    });
});

document.getElementById('chefUpload').addEventListener('click', function() {
    location.href = '/TasteMasters/page/chef/upload';
});

</script>
</body>
</html>