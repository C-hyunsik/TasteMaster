<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chef List</title>
<link rel="stylesheet" href="./css/index.css">
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
		<a href="/TasteMasters/page/admin/adminmain">관리자 페이지</a>
		<a href="/TasteMasters/page/member/mypage">마이페이지</a> | 
		<a href="/TasteMasters/api/member/logout">로그아웃</a>
	</div>
	
	<nav>
	    <ul>
	        <li><a href="#">등록 및 수정</a></li>
			<li><a href="/TasteMasters/page/admin/chefList">셰프 등록/수정</a></li>
			<li><a href="/TasteMasters/page/member/login">요리 등록/수정</a></li>
	    </ul>
	</nav>
</header>

<div>
	<input type="button" id="chefUpload" name="chefUpload" value="등록하기" />
</div>

<section class="chef-list">
	<c:forEach var="chef" items="${chefList}">
		<div class="chef">
			<a href="/TasteMasters/page/chef/dishes?chefId=${chef.chefId}">
				<img src="${chef.imageFileName}" alt="${chef.chefName}">
				<p>${chef.chefName}</p>
			</a>
			<input type="button" name="chefUpdate" id="chefUpdate" value="수정"/>
			<input type="button" name="chefDelete" id="chefDelete" value="삭제"/>
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
    location.href = '/TasteMasters/page/admin/chefUpload';
});
</script>
</body>
</html>