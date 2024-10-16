<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>음식 게시글 목록</title>
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
    position: relative;
}

.menu-icon {
    font-size: 24px;
    cursor: pointer;
    z-index: 1001;
}

nav {
    position: fixed;
    top: 0;
    left: -250px; /* 사이드바가 화면 밖에 위치하도록 */
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
    left: 0; /* 사이드바가 나타날 때 위치 조정 */
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
    display: flex; /* 플렉스 박스를 사용하여 레이아웃 조정 */
    margin: 20px auto;
    width: 80%;
}

.image-container {
    width: 30%; /* 이미지 컨테이너의 너비 */
    padding-right: 20px; /* 이미지와 표 간의 간격 */
}

.image-container img {
    width: 100%; /* 이미지가 컨테이너에 맞게 조정 */
    border-radius: 5px;
}

.content-container {
    width: 70%; /* 나머지 공간을 차지하는 표 컨테이너 */
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
    padding: 20px;
}

.content-container h2 {
    text-align: center;
    margin-bottom: 20px;
}

.table {
    width: 100%;
    border-collapse: collapse;
}

.table th, .table td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
}

.table th {
    background-color: #f2f2f2;
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

@media (max-width: 768px) {
    .table-container {
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
        <div class="search-bar">
            <input type="text" placeholder="셰프 검색">
        </div>
        <div class="login">
           <c:choose>
                <c:when test="${not empty sessionScope.loginId}">
                    <a href="/TasteMasters/page/member/mypage">${loginId }</a>
                </c:when>
                <c:otherwise>
                    <a href="/TasteMasters/page/member/login">로그인</a>
                </c:otherwise>
            </c:choose>
        </div>
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
            <img src="path/to/your/image.jpg" alt="음식 사진" /> <!-- 여기에 음식 사진 경로를 입력하세요 -->
        </div>
        <div class="content-container">
            <h2>음식명</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>대충 제목</td>
                        <td>닉네임(이름)</td>
                        <td>YY.MM.DD</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>대충 제목</td>
                        <td>닉네임(이름)</td>
                        <td>YY.MM.DD</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>대충 제목</td>
                        <td>닉네임(이름)</td>
                        <td>YY.MM.DD</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>대충 제목</td>
                        <td>닉네임(이름)</td>
                        <td>YY.MM.DD</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>대충 제목</td>
                        <td>닉네임(이름)</td>
                        <td>YY.MM.DD</td>
                    </tr>
                </tbody>
            </table>
            <div class="button-group">
                <button onclick="location.href='/TasteMasters/page/post/write'">글쓰기</button>
                <button onclick="location.href='/TasteMasters/page/index'">메인화면</button>
            </div>
        </div>
    </div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
// 사이드 메뉴 기능
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