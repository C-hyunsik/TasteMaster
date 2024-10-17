<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>음식 수정</title>
<link rel="stylesheet" href="../css/index.css">
<style>
/* 동일한 스타일 */
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

.image-container {
    width: 50%;
    padding: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-color: #f9f9f9;
}

.image-container img {
    width: 70%;
    border-radius: 5px;
}

#imgWrap {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}

.content-container {
    width: 65%;
    background-color: #f9f9f9;
    padding-top: 20px;
}

.content-container h2 {
    text-align: center;
    margin-bottom: 20px;
}

@media (max-width: 768px) {
    .table-container {
        flex-direction: column;
        width: 90%;
    }
}
</style>
</head>
<body>
    <header>
        <div class="menu">
            <span class="menu-icon">&#9776;</span>
        </div>
        <nav>
            <ul>
                <li><a href="/TasteMasters/page/index">셰프 목록</a></li>
                <li><a href="/TasteMasters/page/member/mypage">마이페이지</a></li>
            </ul>
        </nav>
    </header>

    <div class="table-container">
        <form id="dishUpdate" method="post" enctype="multipart/form-data" action="/TasteMasters/api/dish/update">
            <div class="image-container">
                <h2>${dishDTO.dishName}</h2> <!-- 음식 이름 -->
                <input type="hidden" name="dishId" value="${dishDTO.dishId}">
                <div id="imgWrap" style="cursor: pointer;">
                    <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-135/storage/${dishDTO.imageFileName}" alt="${dishDTO.dishName}">
                </div>
                <input type="file" name="imageUpdateBtn" id="imageUpdateBtn" style="display: none;"> <!-- 숨겨진 파일 선택 버튼 -->
                <div>
                    <p>이미지를 수정을 원하시면 사진을 클릭! </p>
                    <input type="button" id="dishImgUpdateBtn" value="사진 변경하기">
                </div>
            </div>

            <div class="content-container">
                <h2>음식 설명</h2>
                <textarea name="dishDescription" rows="5" cols="50">${dishDTO.dishContent}</textarea>
                <input type="submit" value="수정하기">
            </div>
        </form>
    </div>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            var menuIcon = document.querySelector('.menu-icon');
            var navMenu = document.querySelector('nav');
            var imgWrap = document.getElementById('imgWrap'); 
            var fileInput = document.getElementById('imageUpdateBtn');

            // 메뉴 아이콘 클릭 시 메뉴 슬라이드 토글
            menuIcon.addEventListener('click', function() {
                navMenu.classList.toggle('active'); 
            });

            // 이미지 클릭 시 파일 선택 창 열기
            imgWrap.addEventListener('click', function() {
                fileInput.click(); 
            });
        });

        // 이미지 미리보기
        $('#imageUpdateBtn').change(function(){
            $('#imgWrap').empty(); 
            var reader = new FileReader();
            reader.onload = function(e) {
                var img = document.createElement('img');
                img.src = e.target.result;
                img.width = 100;  
                img.height = 100;
                $('#imgWrap').append(img);
            }
            reader.readAsDataURL(this.files[0]);
        });
    </script>
</body>
</html>
