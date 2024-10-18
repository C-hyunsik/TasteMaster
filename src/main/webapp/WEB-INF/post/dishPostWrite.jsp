<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/froala-editor@3.1.0/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@3.1.0/js/froala_editor.pkgd.min.js"></script>
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
    height: auto;
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

.container {
    display: flex;
    margin: 20px auto;
    width: 80%;
}

.form-container {
    width: 100%;
    background-color: #f9f9f9;
    padding: 20px;
}

.form-container h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}
#editorWrap{
	height:450px;
}
#editor{
	overflow:scroll;
	height: 100%;
}
.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.button-group {
    display: flex;
    justify-content: center;
    margin-top: 40px;
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
    .container {
        flex-direction: column;
        width: 90%;
    }
}
</style>
</head>
<body>
	 <header>
        
        <div class="logo">
        	<a href="/TasteMasters/page/index"><img alt="로고" src="./image/logo.png" width="40px" height="40px"></a>
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

    <div class="container">
        <div class="form-container">
         <form id="postForm" method="post">
            <h2>글쓰기</h2>
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" id="title" name="title">
            </div>
            <div class="form-group" id="editorWrap">
				<label for="content">내용:</label>
			 <div id="editor"></div>
            </div>
            <div class="form-group">
            	<input type="file" name="image" id="image" style="visibility: hidden;"/>
            </div>
            <div class="button-group">
                <button type="button" id = "postBtn">작성하기</button>
                <button type="button" onclick="location.href='/TasteMasters/page/post/dishPostList?dishId=${dishId}'">목록</button>
            </div>
            <input type="hidden" id="dishId" value="${dishId }"/>
         </form>
        </div>
    </div>
<script type="text/javascript">
//사이드 메뉴 기능
document.addEventListener("DOMContentLoaded", function() {
    var menuIcon = document.querySelector('.menu-icon');
    var navMenu = document.querySelector('nav');

    menuIcon.addEventListener('click', function() {
        navMenu.classList.toggle('active');
    });
});
$(function () {
    var editor = new FroalaEditor('#editor', {
        height: '79%',
        imageUploadURL: '/TasteMasters/api/post/imageUpload',
        'events': {
            'image.uploaded': function (response) {
                // JSON 응답 파싱
                try {
                    var jsonResponse = JSON.parse(response);  // 응답이 문자열인 경우 JSON 파싱
                    if (jsonResponse.link) {
                        //this.image.insert(jsonResponse.link);  // 이미지 URL을 사용해 에디터에 삽입
                    } else {
                        console.error('Invalid response format:', response);
                        alert('이미지 업로드 중 파싱 오류가 발생했습니다.');
                    }
                } catch (error) {
                    console.error('JSON parsing error:', error);
                    alert('이미지 업로드 중 오류가 발생했습니다.');
                }
            },
            'image.error': function (error) {
                console.log('Image upload error:', error);
                alert('이미지 업로드 중 오류가 발생했습니다.');
            }
        }
    });
    $('#postBtn').click(function(){
        let formData = new FormData($('#postForm')[0]);
		
        // Froala 에디터 내용 가져오기
        const content = editor.html.get(); 
        formData.append('content', content); // 'content'는 서버에서 받을 때 사용할 파라미터명
        alert(content);
        
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const dishId = urlParams.get('dishId');

        $.ajax({
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            url: '/TasteMasters/api/post/upload?dishId=' + dishId,
            data: formData,
            success: function(data) {
                alert("게시글이 등록되었습니다.");
                location.href = "/TasteMasters/page/post/dishPostList?dishId=" + dishId; // 게시글 목록
            },
            error: function(e) {
                console.log(e);
                alert("등록 중 오류가 발생했습니다.");
            }
        }); //ajax
    });
});


</script>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js"></script>
<script>


     
     
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

</script>
</body>
</html>