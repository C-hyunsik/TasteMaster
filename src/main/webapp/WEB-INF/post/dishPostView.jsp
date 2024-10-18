<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 상세보기</title>
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

        .content-container {
            width: 60%; /* 검색창과 동일한 너비 */
            margin: 20px auto; /* 중앙 정렬 */
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px; /* 모서리 둥글게 */
        }

        .image-container {
            width: 100%; /* 이미지 너비 조정 */
            display: flex;
            justify-content: flex-start; /* 왼쪽 정렬 */
            margin: 20px 0; /* 이미지와 내용 간 여백 */
        }

        .image-container img {
            width: 30%; /* 이미지 크기 조정 */
            border-radius: 5px;
        }

        .post-content {
            margin: 20px 0; /* 내용과 댓글 간 여백 */
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

        .comment-section {
            margin: 0 auto;
            width: 60%; /* 부모 요소와 동일한 너비 */
        }

        textarea {
            width: 90%;
            height: 100px;
            margin: 10px auto; /* 댓글 입력란과 버튼 간 여백 */
            display: none; /* 기본적으로 숨김 */
        }

        .comments {
            margin-top: 20px; /* 댓글 목록과 작성란 간 여백 */
        }

        .comment {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-top: 10px; /* 각 댓글 간 여백 */
        }

        .comment-meta {
            font-size: 14px;
            color: #666; /* 작성자 및 날짜 색상 */
        }

        /* 모바일 화면에서 버튼을 세로로 정렬 */
        @media (max-width: 768px) {
            .button-group {
                flex-direction: column; /* 세로 방향으로 정렬 */
                align-items: center; /* 중앙 정렬 */
            }

            button {
                margin: 5px 0; /* 상하 여백 추가 */
                width: 100%; /* 버튼 너비를 100%로 */
            }

            .content-container {
                width: 90%; /* 모바일 화면에서 약간 넓게 */
            }
            .comment-section {
                margin: 0 auto;
                width: 90%; /* 부모 요소와 동일한 너비 */
            }

            textarea {
                width: 100%;
                height: 100px;
                margin: 10px auto; /* 댓글 입력란과 버튼 간 여백 */
                display: none; /* 기본적으로 숨김 */
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

    <div class="content-container">
        <h2>${postList[0].title}</h2> <!-- 제목 -->
        <div class="post-meta">글 번호: ${postList[0].postId} | 작성자: ${postList[0].name} | 작성일: ${postList[0].createdAtToString}</div>
        <div class="image-container">
            <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-135/storage/${postList[0].imageFileName}" alt="${postList[0].imageOriginalFileName}">
        </div>
        <div class="post-content">
            <h3>내용 부문</h3>
            <p>${postList[0].content}</p>
        </div>
        <div class="button-group">
	        <c:choose>
				<c:when test="${sessionScope.memberId == postList[0].memberId || sesstionScope.role == 'ADMIN' }">
					<button onclick="location.href='/TasteMasters/page/post/postUpdate?postId=${postList[0].postId}'">글 수정</button>
					<button id = "deleteBtn">글 삭제</button>
					<button onclick="location.href='/TasteMasters/page/post/dishPostList?dishId='+${dishId}">목록</button>
				</c:when>
	             
				<c:otherwise>
	                  <button onclick="location.href='/TasteMasters/page/post/dishPostList?dishId='+${dishId}">목록</button>
				</c:otherwise>
			</c:choose>
        </div>
    </div>

    <div class="comment-section">
        <h3>댓글 작성</h3>
        <button id="toggleCommentInput">댓글 작성</button>
        <textarea id="commentInput" name = "content" placeholder="댓글을 작성하세요..."></textarea>
        <button id="submitComment" style="display: none;">댓글 작성</button>
        <h3>댓글 목록</h3>
        <div class="comments">
            <c:forEach var="comment" items="${commentList}">
                <div class="comment">
                    <div class="comment-meta">작성자: ${comment.name} | 작성일: ${comment.createdAt}</div>
                    <p>${comment.content}</p>
                </div>
            </c:forEach>
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

    // 댓글 작성 입력란 토글
    var toggleCommentInput = document.getElementById('toggleCommentInput');
    var commentInput = document.getElementById('commentInput');
    var submitComment = document.getElementById('submitComment');

    toggleCommentInput.addEventListener('click', function() {
        commentInput.style.display = 'block'; // 댓글 입력란 표시
        submitComment.style.display = 'inline'; // 댓글 작성 버튼 표시
        toggleCommentInput.style.display = 'none'; // 댓글 작성 버튼 숨기기
    });

    // 댓글 작성 버튼 클릭 시 처리
    submitComment.addEventListener('click', function() {
        // 댓글 작성 로직 추가 (AJAX 등을 사용할 수 있음)
       
        
     const queryString = window.location.search;

     // URLSearchParams 객체 생성
     const urlParams = new URLSearchParams(queryString);

     // 파라미터 예: ?pg=2&name=john
     const postId = urlParams.get('postId');
       $.ajax({
            type: 'post',
            url: '/TasteMasters/api/comment/enroll?postId='+postId,
            data : {
            	content : $('#commentInput').val()
            },
            success: function(data) {

                alert('댓글이 작성되었습니다!'); // 예시 알림
                location.reload();
                /*
                commentInput.value = ''; // 입력란 초기화
                commentInput.style.display = 'none'; // 입력란 숨기기
                submitComment.style.display = 'none'; // 버튼 숨기기
                toggleCommentInput.style.display = 'inline'; // 댓글 작성 버튼 다시 표시
                */
            },
            error: function(e) {
                console.log(e);
                alert("로그인 후 다시 시도해주세요.");
            }
        }); //ajax
     
    });
});


$(function(){
    $('#deleteBtn').click(function(){
    	
         const queryString = window.location.search;

	     // URLSearchParams 객체 생성
	     const urlParams = new URLSearchParams(queryString);
	
	     // 파라미터 예: ?pg=2&name=john
	     const postId = urlParams.get('postId');
        $.ajax({
            type: 'get',
            url: '/TasteMasters/api/post/delete?postId='+postId,
            success: function(data) {
                alert("게시글이 삭제되었습니다.");
                location.href='/TasteMasters/page/post/dishPostList?dishId='+${dishId}
            },
            error: function(e) {
                console.log(e);
                alert("삭제 중 오류가 발생했습니다.");
            }
        }); //ajax
    });
});
</script>
</body>
</html>