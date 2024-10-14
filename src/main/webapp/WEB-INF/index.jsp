<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>SUMONDE</title>
<link rel="icon" href="/path/to/your/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/MamondeProject/css/reset.css">
<link rel="stylesheet" href="/MamondeProject/css/index.css">
</head>

<body>
	<a href="#contents" class="skip">본문 바로가기</a>
	<header>
		<h1>
			<a href="/MamondeProject/page/index">SUMONDE</a>
		</h1>
		<h2 class="hide">대메뉴</h2>
		<nav class="lnb">
			<ul>
				<li class="dropdown"><a href="/MamondeProject/page/ourstory"><span>OUR
							STORY</span></a>
					<ul class="submenu">
						<li><a href="#a">Brand Story</a></li>
						<li><a href="#a">COMMITMENTS</a></li>
						<li><a href="#a">NEWS</a></li>
					</ul></li>
				<li class="dropdown"><a href="/MamondeProject/page/best_new"><span>BEST&NEW</span></a>
					<ul class="submenu">
						<li><a href="#a">Skin Care</a></li>
						<li><a href="#a">Makeup</a></li>
						<li><a href="#a">Nail</a></li>
						<li><a href="#a">Food</a></li>
					</ul></li>
				<li class="dropdown"><a
					href="/MamondeProject/page/product/productList"><span>PRODUCT</span></a>
					<ul class="submenu">
						<li><a href="/MamondeProject/page/product/productList">ALL</a></li>
						<li><a href="#a">체험&리뷰</a></li>
						<li><a href="#a">쇼핑혜택</a></li>
						<li><a href="#a">제휴혜택</a></li>
					</ul></li>
				<li><a href="/MamondeProject/page/qna/list"><span>Q&A</span></a></li>
			</ul>
		</nav>
		<h2 class="hide">관련서비스</h2>
		<nav class="spot">
			<ul>
				<li><a href="/MamondeProject/page/user/login">LOGIN</a></li>
				<li><a href="#">매장 찾기</a></li>
			</ul>
		</nav>
	</header>

	<section class="visual">
		<h2 class="hide">광고영역</h2>
		<a href="#a" class="prev">이전</a> <a href="#a" class="next">다음</a>
		<div class="control">
			<div>
				<div>
					<a href="#a" class="play on">시작</a> <a href="#a" class="pause">일시정지</a>
				</div>
				<ul>
					<li class="on"><a href="#a">마몽드 제품</a></li>
					<li><a href="#a">XXX 신상품</a></li>
					<li><a href="#a">설명텍스트3</a></li>
					<li><a href="#a">설명텍스트4</a></li>
					<li><a href="#a">설명텍스트5</a></li>
				</ul>
			</div>
		</div>
		<div class="con">
			<div class="slide">
				<div class="txt">
					플로라 글로우<br> 로즈 리퀴드 마스크
					<p>어느 각도에서나 매끈하게 빛나는 엔젤링 결광 피부</p>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="txt">
			HYPER FLORA의 힘으로<br> 틔워 <img
				src="/MamondeProject/images/free-icon-love-4096198.png" alt="하트이미지">
			나답게
			<div class="txt_button">브랜드 스토리 더 알아보기</div>
		</div>
	</section>

	<section class="video">
		<video class="background-video" autoplay muted loop>
			<source src="/MamondeProject/images/main_video_kr_240206_low.mp4"
				type="video/mp4">
		</video>
	</section>

	<section class="visual2">
		<div class="con">
			<div class="slide">
				<div class="txt">
					FLORA GLOW ROSE<br>
					<p>마몽드 수분 광 유니버스</p>
				</div>
			</div>
		</div>
	</section>

	<section class="product">
		<div class="txt">For #My Skin</div>
		<ul>
			<li>
				<div class="image-container">
					<img src="/MamondeProject/images/main_products_01_kr_240123.jpg"
						alt="제품 1" class="default-image"> <img
						src="/MamondeProject/images/main_products_01_hover_kr_240123.jpg"
						alt="제품 1 Hover" class="hover-image">
				</div> <span> #딥클렌징
					<p>어메이징 딥 민트 클렌징밤</p> 모공피지연화 클렌징밤
			</span>
			</li>
			<li>
				<div class="image-container">
					<img src="/MamondeProject/images/main_products_02_kr_240123.jpg"
						alt="제품 1" class="default-image"> <img
						src="/MamondeProject/images/main_products_02_hover_kr_240123.jpg"
						alt="제품 1 Hover" class="hover-image">
				</div> <span> #모공축소
					<p>포어 슈링커 바쿠치올 크림</p> 모공 슈링크*효과 크림 하나로
			</span>
			</li>
			<li>
				<div class="image-container">
					<img src="/MamondeProject/images/main_products_03_kr_240123.jpg"
						alt="제품 1" class="default-image"> <img
						src="/MamondeProject/images/main_products_03_hover_kr_240123.jpg"
						alt="제품 1 Hover" class="hover-image">
				</div> <span> #강력진정
					<p>블루 아줄렌 클라우드 토너</p> 진정 강한 마찰리스 구름토너
			</span>
			</li>
			<li>
				<div class="image-container">
					<img
						src="/MamondeProject/images/240412_final_KR_Flora-Glow-Rose-Liquid-Mask_main_FOR-MYSKIN_01_product.jpg"
						alt="제품 1" class="default-image"> <img
						src="/MamondeProject/images/240412_final_KR_Flora-Glow-Rose-Liquid-Mask_main_FOR-MYSKIN_02_texture.jpg"
						alt="제품 1 Hover" class="hover-image">
				</div> <span> #피부결광
					<p>플로라 글로우 로즈 리퀴드 마스크</p> 어느 각도에서나 빛나는 엔젤링 결광
			</span>
			</li>
		</ul>
	</section>


	<footer class="footer">
		<div class="footer-container">
			<div class="footer-left">
				<h3>SUMONDE</h3>
				<p>© 2024 SUMONDE. All rights reserved.</p>
			</div>
			<div class="footer-center">
				<ul>
					<li><a href="#">개인정보 처리방침</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
			<div class="footer-right">
				<ul>
					<li><a href="https://www.facebook.com" target="_blank">Facebook</a></li>
					<li><a href="https://www.instagram.com" target="_blank">Instagram</a></li>
					<li><a href="https://www.twitter.com" target="_blank">Twitter</a></li>
				</ul>
			</div>
		</div>
	</footer>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		$(function () {
			
			
			$.ajax({
				type: 'get',
				url: '/MamondeProject/api/user/isLogin',
				success: function(data, textStatus, jqXHR) {
					 //console.log(data);
					 if(jqXHR.status === 200){ // 200 ok
						$('.spot').html(`
				            <ul>
				                <li><a id="logoutBtn">LOGOUT</a></li>              
				                <li><a href="/MamondeProject/page/user/mypage">MY PAGE</a></li>
				                <li><a href="/MamondeProject/page/store/storeSearch">매장 찾기</a></li>			               
				            </ul>
						`);
					} 
				},
			    error: function(xhr, textStatus, errorThrown) {
					//console.log(e);
					if (xhr.status === 401) {	// 비로그인
						$('.spot').html(`
				            <ul>
								 <li><a href="/MamondeProject/page/user/login">LOGIN</a></li>
								 <li><a href="/MamondeProject/page/store/storeSearch">매장 찾기</a></li>
				            </ul>
					   `);
					}
				}
			});

			// 로그아웃 버튼 클릭 시 동작
			$(document).on('click', '#logoutBtn', function (event) {
					event.preventDefault();
					// localStorage에서 user_seq 삭제
					
					$.ajax({
					type: 'get',
					url: '/MamondeProject/api/user/logout',
					success: function(data, textStatus, jqXHR) {
						console.log(data);
						alert('로그아웃 되었습니다.');
						// 로그아웃 후 페이지 리로드
						window.location.reload();
					},
				    error: function(xhr, textStatus, errorThrown) {
						console.log(textStatus);
					}
				});

			});
						
			// 슬라이드 이미지 및 텍스트 데이터
			const slideImages = [
		        "../images/240409_final_KR_flora-glow-rose-liquid-mask_main_KV_pc.jpg",
		        "../images/240207_final_PORE-SHRINKER-BAKUCHIOL-SERUM_main_KV_pc2.jpg",
		        "../images/240131_final_KR_amazing-deep-mint-cleansing-foam_main_KV_pc.jpg",
		        "../images/20240119_final_PORE-SHRINKER-BAKUCHIOL-PAD_main_KV_PC.jpg",
		        "../images/240409_final_KR_flora-glow-rose-smoothing-cream_main_KV_pc.jpg"
		    ];

		    const slideTexts = [
		    	 {
		             title: "플로라 글로우<br>로즈 리퀴드 마스크",
		             description: "어느 각도에서나 매끈하게 빛나는 엔젤링 결광 피부"
		         },
		         {
		             title: "포어 슈링커<br>바쿠치올 세럼",
		             description: "3억개 바쿠치올 레티놀 캡슐로 속모공 슈링크* 효과"
		         },
		         {
		             title: "어메이징 딥 민트<br>클렌징 폼",
		             description: "모공피지 초클리어 민트초 약알칼리폼"
		         },
		         {
		             title: "포어 슈링커<br>바쿠치올 패드",
		             description: "쭉쭉 늘어나는 패드로 쫀쫀 모공 슈링크* 효과"
		         }
		    ];

		    let currentSlide = 0; // 현재 슬라이드 인덱스
		    const totalSlides = slideImages.length;
		    let slideInterval; // 자동 슬라이드 변수

		    // 슬라이드를 표시하는 함수
		    function showSlide(index) {
		        currentSlide = index;
		        $('.visual .con .slide').css('background-image', `url(${slideImages[currentSlide]})`);
		        // 슬라이드 텍스트 업데이트
		        $('.visual .con .slide .txt').html(`
		            ${slideTexts[currentSlide].title}
		            <p>${slideTexts[currentSlide].description}</p>
		        `);

		        // 슬라이드 네비게이션 활성화 상태 갱신
		        $('.visual .control ul li').removeClass('on');
		        $('.visual .control ul li').eq(currentSlide).addClass('on');
		    }

		    // "이전" 버튼 클릭 이벤트
		    $('.visual .prev').on('click', function () {
		        currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
		        showSlide(currentSlide);
		    });

		    // "다음" 버튼 클릭 이벤트
		    $('.visual .next').on('click', function () {
		        currentSlide = (currentSlide + 1) % totalSlides;
		        showSlide(currentSlide);
		    });

		    // 자동 슬라이드를 위한 함수
		    function startSlideShow() {
		        slideInterval = setInterval(function () {
		            currentSlide = (currentSlide + 1) % totalSlides;
		            showSlide(currentSlide);
		        }, 3000); // 3초마다 슬라이드 전환
		    }

		    // 자동 슬라이드 중지 함수
		    function stopSlideShow() {
		        clearInterval(slideInterval);
		    }

		    // 페이지 로드 시 첫 번째 슬라이드 표시 및 슬라이드쇼 시작
		    showSlide(currentSlide);
		    startSlideShow();

		    // 슬라이드에 마우스를 올리면 자동 슬라이드 멈춤
		    $('.visual .con').hover(
		        function () {
		            stopSlideShow(); // 마우스를 올리면 슬라이드 멈춤
		        }, 
		        function () {
		            startSlideShow(); // 마우스를 떼면 슬라이드 재시작
		        }
		    );
		});
	</script>
</body>

</html>