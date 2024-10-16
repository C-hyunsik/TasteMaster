<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>셰프 리뷰 사이트</title>
<link rel="stylesheet" href="./css/index.css">
<style type="text/css">
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
                    <c:if test="${sessionScope.loginId == 'admin'}">
						<a href="/TasteMasters/page/admin/adminmain">관리자 페이지</a>
					</c:if>
                    <a href="/TasteMasters/page/member/mypage">마이페이지</a> | 
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
                <li><a href="#">셰프 목록</a></li>
                <c:choose>
                 
                    <c:when test="${not empty sessionScope.loginId}">
                        <li><a href="/TasteMasters/page/member/mypage">마이페이지</a></li>
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
		<img src="./image/banner.jpg" alt="배너 이미지" class="banner-img" />
	</section>

	<section class="chef-list">
		<c:forEach var="chef" items="${chefList}">
			<div class="chef">
				<a href="/TasteMasters/page/chef/dishes?chefId=${chef.chefId}">
					<img src="${chef.imageFileName}" alt="${chef.chefName}">
					<p>${chef.chefName}</p>
				</a>
			</div>
		</c:forEach>
    </section>
<script type="text/javascript">
// 메뉴 아이콘 클릭 시 메뉴 슬라이드 토글
document.addEventListener("DOMContentLoaded", function() {
    var menuIcon = document.querySelector('.menu-icon');
    var navMenu = document.querySelector('nav');

    menuIcon.addEventListener('click', function() {
        navMenu.classList.toggle('active'); // 메뉴 보이기/숨기기
    });
});
</script>
</body>
</html>
