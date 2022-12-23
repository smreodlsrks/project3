<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>서울특별시교육청 > 로그인</title>
<style>
	a { text-decoration:none; font-weight:bold; color:grey; }
	a:hover { text-decoration:none; font-weight:bold; color:rgb(37, 134, 202); }
	li { margin-top:15px;}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script>
	function signUp(){		
	    open("../Session/SignUp1.jsp",
	     "signUp",
	     "width=990, height=700, left=100, top=100, "
	     + "location=no, toolbar=no, menubar=no, "
	     + "scrollbars=yes, resize=no");
	}
	function searchId(){		
	    open("../Session/IdSearch.jsp",
	     "idSearch",
	     "width=385, height=240, left=1000, top=150, "
	     + "location=no, toolbar=no, menubar=no, "
	     + "scrollbars=yes, resize=no");
	}
	function searchPw(){		
	    open("../Session/PwSearch.jsp",
	     "pwSearch",
	     "width=385, height=240, left=1000, top=150, "
	     + "location=no, toolbar=no, menubar=no, "
	     + "scrollbars=yes, resize=no");
	}
</script>
</head>
<body>
	<h2 style="margin:20px;"><span style="color:rgb(37, 134, 202);">도서관</span>  방문을 환영합니다</h2><br />
	<div>
		<h2 style="margin-left:330px;">아이디 로그인</h2>
		<form action="LoginProcess.jsp" method="post" name="loginfrm" onsubmit="return validateForm(this)" style="margin-left:150px;">
			<input type="text" class="form-control pd-3" name="user_id" placeholder="아이디" style="padding:10px; width:406px; position:relative; left:50px; margin:10px;" /><br />
			<input type="password" class="form-control pd-3" name="user_pw" placeholder="비밀번호" style="padding:10px; width:406px; position:relative; left:50px; margin:10px;" /><br />
			<div style="height:20px; margin-top:8px; margin-left:112px; color:red; font-size:12px;">
				<%= request.getAttribute("LoginErrMsg")==null ? "":request.getAttribute("LoginErrMsg") %>
			</div>
			<button type="submit" style="border:0; background-color:white; position:relative; left:44px; margin:10px; cursor:pointer;"><img src="../Images/login.png" /></button>
		</form>		
		<a href="#" style="margin-left:210px;" onclick="searchId()">아이디 찾기<i class="bi bi-caret-right-fill"></i></a> &nbsp;
		<a href="#" onclick="searchPw()">비밀번호 찾기<i class="bi bi-caret-right-fill"></i></a>		
	</div>
	<br />
	<ul style="margin-left:150px;">
		<li>회원이 아닌경우 신규가입 하시기 바랍니다. <a href="./SignUp1.jsp"><button type="button" style="background-color:rgb(38, 106, 196); color:white; border:0; border-radius:5px; cursor:pointer;">회원가입 바로가기</button></a></li>
		<li>서울시민이신 경우 신규가입 후 <span style="color:red;">서울시민인증</span>을 하셔야 대출회원자격이 부여됩니다.</li>
		<li>서울시민이 아니시더라도 서울 소재 초·중 ·고등학교에 재직(재학)중이신 경우 <br />
		신규가입 후 <span style="color:red;">서울학생인증</span>을 하시면 대출회원자격이 부여됩니다.</li>
		<li>서울시민이 아니시지만 서울소재 직장, 또는 대학교에 재직(재학)중이신 경우 <br />
		 신규가입 후 재직(재학)증명서를 서울시교육청 도서관·평생학습관에 제시하시면 <br />
		  대출회원자격이 부여됩니다.</li>
	</ul>
</body>
</html>