<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울특별시교육청 송파도서관</title>
<script>
	function js(){		
	    alert("ㅈㅅㅈㅅ 준비중임미두");
	}
	
	function login(){		
	    open("../Session/LoginForm.jsp",
	     "login",
	     "width=990, height=750, left=100, top=100,"
	     + "location=no, toolbar=no, menubar=no,"
	     + "scrollbars=yes, resize=no");
	}
	
	function SignUp(){		
	    open("../Session/SignUp1.jsp",
	    	"SignUp",
	    	"width=990, height=750, left=100, top=100, "
	    	+ "location=no, toolbar=no, menubar=no,"
	    	+ "scrollbars=yes, resize=no");
	}	
</script>
<style>
	li { list-style:none; }
	a { text-decoration:none; }
	.menu { overflow:hidden; }
	.submenu > li {
  		line-height: 50px; float:left; margin-right:10px;
	}
	.submenu {
		width: 0;
  		height: 0;
  		overflow: hidden;
	}
	.menu > li:hover .submenu {
	    height:50px; width:100%; 
	}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm" style="background-color:rgb(252, 136, 13);">
  <div class="container-fluid">
    <ul class="navbar-nav ms-auto">
    	<li class="nav-item">
        	<a class="nav-link text-light" href="#" onclick="js()">비대면자격확인인증</a>
        </li>
        <%
		if(session.getAttribute("UserId") == null){
		%>
		<li class="nav-item">
        	<a class="nav-link text-light" href="#" onclick="login()">로그인</a>
        </li>
        <li class="nav-item">
       	    <a class="nav-link text-light" href="#" onclick="SignUp()">회원가입</a>
        </li>
		<%
		} else {
		%>
		<li class="nav-item">
       	    <span style="font-weight:bold;" class="nav-link text-light"><%= session.getAttribute("UserName") %>님 환영합니다.</span>
        </li>
        	<% if(request.getQueryString() == null){ %>
			<li class="nav-item">
				<a class="nav-link text-light" href="../Session/Logout.jsp?redirectUrl=<%= request.getRequestURL() %>" >로그아웃</a>
	        </li>
	        <%} else { %>
	        <li class="nav-item">
				<a class="nav-link text-light" href="../Session/Logout.jsp?&redirectUrl=<%= request.getRequestURL() %>?<%= request.getQueryString() %>" >로그아웃</a>
	        </li>
		<%
			}
		}
		%>
        <li class="nav-item">
       		<a class="nav-link text-light" href="#">사이트맵</a>
        </li>
        <li class="nav-item">
       		<a href="https://www.facebook.com/songpalib" target="_blank"><img src="../Images/fcbook.png" /></a>
        </li>
        <li class="nav-item">
       		<a href="https://twitter.com/songpalib" target="_blank"><img src="../Images/twit.png" /></a>
        </li>        
        <li class="nav-item">
       		<a href="https://www.instagram.com/songpalib/" target="_blank"><img src="../Images/insta.png" /></a>
        </li>
        <li class="nav-item">
       		<a href="https://www.youtube.com/channel/UCcK6FvscT8rmn1KB-8M32BA" target="_blank"><img src="../Images/youtube.png" /></a>
        </li>
    </ul>
  </div>
</nav>
<nav class="navbar navbar-expand-sm bg-light navbar-dark">
	<div class="container">
    	<a class="navbar-brand" href="/Project2/Main/main.jsp">
        	<img src="https://splib.sen.go.kr/resources/homepage/splib/img/splib_logo.png" style="width:130px;"> 
	    </a>
    	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	      	<ul class="navbar-nav ms-auto menu">
		        <li class="nav-item">
		        	<a class="nav-link" href="#" style="color:rgb(85, 85, 85); font-size:20px;">자료검색</a>
		        	<ul class="submenu">
		        		<li><a href="#">자료검색</a></li>
		        		<li><a href="#">스마트도서관자료검색</a></li>
		        		<li><a href="#">자료목록</a></li>
		        		<li><a href="#">희망도서신청</a></li>
		        		<li><a href="#">대출베스트</a></li>
		        		<li><a href="#">사서추천도서</a></li>
		        		<li><a href="#">주제별책추천</a></li>
		        		<li><a href="#">(성격기반)독서유형별 책추천</a></li>
		        		<li><a href="#">송파특색도서(특화자료)</a></li>
		        		<li><a href="#">전자도서관</a></li>
		        	</ul>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="#" style="color:rgb(85, 85, 85); font-size:20px;">프로그램</a>
		        	<ul class="submenu">
		        		<li><a href="#">도서관일정</a></li>
		        		<li><a href="#">독서문화행사</a></li>
		        		<li><a href="#">독서캠페인</a></li>
		        		<li><a href="#">평생교육강좌</a></li>
		        		<li><a href="#">동아리</a></li>
		        		<li><a href="#">다솜갤러리</a></li>
		        	</ul>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="#" style="color:rgb(85, 85, 85); font-size:20px;">열린공간</a>
		        	<ul class="submenu">
		        		<li><a href="../Pages/ListG.jsp">공지사항</a></li>
		        		<li><a href="#">자주하는질문</a></li>
		        		<li><a href="#">도서관에바란다</a></li>
		        		<li><a href="#">발간자료</a></li>
		        		<li><a href="#">좌석예약</a></li>
		        		<li><a href="#">봉사신청</a></li>
		        		<li><a href="#">설문조사</a></li>
		        		<li><a href="#">청렴자료실</a></li>
		        		<li><a href="#">도서관이벤트</a></li>
		        		<li><a href="#">이달의정보</a></li>
		        		<li><a href="#">손으로읽는BOOK</a></li>
		        	</ul>
		        </li>  
		        <li class="nav-item">
		        	<a class="nav-link" href="#" style="color:rgb(85, 85, 85); font-size:20px;">도서관안내</a>
		        	<ul class="submenu">
		        		<li><a href="#">도서관현황</a></li>
		        		<li><a href="#">도서관협력서비스</a></li>
		        		<li><a href="#">송파특색사업</a></li>
		        		<li><a href="#">이용안내</a></li>
		        		<li><a href="#">교육청상징</a></li>
		        		<li><a href="../Pages/map.jsp">오시는길</a></li>
		        		<li><a href="#">비대면확인자격인증</a></li>
		        	</ul>
		        </li> 
		        <li class="nav-item">
		        	<a class="nav-link" href="#" style="color:rgb(85, 85, 85); font-size:20px;">마이라이브러리</a>
		        	<ul class="submenu">
		        		<li><a href="#">내서재</a></li>
		        		<li><a href="#">개인공지사항</a></li>
		        		<li><a href="#">신청내역</a></li>
		        		<li><a href="#">문의관리</a></li>
		        		<li><a href="#">회원정보</a></li>
		        	</ul>
		        </li> 
			</ul>
		</div>
	</div>
</nav>

</body>
</html>