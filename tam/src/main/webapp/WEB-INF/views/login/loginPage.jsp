<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드명</title>
<link rel="stylesheet" href="/resources/css/login/loginPage.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	
	<!-- header -->
	<%@include file = "../include/userHeader.jsp" %>
	
	<!-- 메인 화면 부분 -->
	<div class="content_area">
		<!-- 로그인 폼 -->
		<form id="login_form" method="post">
		
			<!-- 로그인 부분 -->
			<span>로그인</span>			
			<div class="login_wrap">

				<!-- 아이디 입력 -->
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="id">
					</div>
				</div>
				<!-- 비밀번호 입력 -->
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" name="pw" type="password">
					</div>
				</div>
				
				<!-- 유저로그인 정보가 맞지않음 -->
				<c:if test ="${result == 0}">
					<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
				</c:if>

			</div><!-- login_wrap end -->
			
			<!-- 버튼 부분 -->
			<div class="button">
				<!-- 로그인 버튼 -->
				<div class="login_button_wrap">
					<input type="button" class="login_button" value="로그인">
				</div>	
				
				<!-- 회원가입 페이지 이동 버튼 -->
				<div>
					<input type="button" class="join_page_button" value="회원가입" onclick="location.href='/join/joinPage'">
				</div>
				
				<!-- 소셜 로그인 버튼 -->
				<div class="social_login_button">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=2437a79326b23af53d178c6137ee9af8&redirect_uri=http://localhost:8080/kakaoLogin&response_type=code">
					<img alt="카카오 로그인" src="../resources/img/k_btn.png" style="margin-top: 30px;">
				</a>
				</div>
			</div><!-- button end -->
		</form>	
	</div><!-- content_area end -->
		
		
	<!-- footer -->
	<%@include file = "../include/userFooter.jsp" %>
		
	<script>
 
    /* 로그인 버튼 클릭 */
    $(".login_button").click(function(){

        //로그인 메서드 서버 요청
        $("#login_form").attr("action","/login/loginPage");
        $("#login_form").submit();
        
    });
 
	
	window.Kakao.init("a8950654f3c186f927fac4f58b53b0ca");
	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope:'profile,account_email, birthday',
			success : function(authObj){
				window.Kakao.API.request({
					url:'/v2/user/me',
					success:res=>{
						const email = res.kakao_acount.email;
						const name = res.properties.nickname;
						const birth = res.kakao_account.birthday;
						
						console.log(email);
						console.log(name);
						console.log(birth);
						document.login_frm.submit();
					}
				});
			}
		});
	}
	</script>

</body>
</html>
