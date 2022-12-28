<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파도서관</title>
<style>
	* { color:rgb(83, 83, 83); font-size:14px; }
	a { text-decoration:none; color:rgb(83, 83, 83); }
	.bttmul li {
		float:left; padding-right:10px; margin-top:10px; margin-right:10px;
	}
	.bttmul li:not(:last-child) { border-right:1px solid grey; }
</style>
</head>
<body>
	<hr style="border-width:3px; color:rgb(10, 10, 10);"/>
	
	
	<div class="container" style="margin-top:; margin-bottom:15px;">
		<ul class="bttmul">
			<li>정보공개알림</li>
			<li>개인정보처리방침</li>
			<li>이용서비스현장</li>
			<li>이용규정</li>
			<li>이메일무단수집거부</li>
			<li>전화번호안내</li>
			<li><a href="../Pages/map.jsp">오시는길</a></li>
		</ul>
		<script>
			function moveout(select){
				if(select.value != ""){
					window.open(select.value, '_blank');			
				}
			}
		
		</script>
		<select name="linkbttm" style="float:right; margin-bottom:15px; padding:2px;
			width:200px;" onchange="moveout(this)">
		    <option value=""> 타기관 바로가기 </option>
		    <option value="https://e-lib.sen.go.kr/index.php">전자도서관</option>
		    <option value="http://lib.sen.go.kr/books/index.do">사서추천도서포털</option>
		    <option value="https://everlearning.sen.go.kr/index.do">평생학습포털(에버러닝)</option>
		    <option value="http://gnlib.sen.go.kr">강남도서관</option>
		    <option value="http://gdlib.sen.go.kr">강동도서관</option>
		    <option value="http://gslib.sen.go.kr">강서도서관</option>
		    <option value="http://gplib.sen.go.kr">개포도서관</option>
		    <option value="http://gclib.sen.go.kr">고척도서관</option>
		    <option value="http://grlib.sen.go.kr">구로도서관</option>
		    <option value="http://nslib.sen.go.kr">남산도서관</option>
		    <option value="http://nslib.sen.go.kr">남산도서관</option>
		    <option value="http://dblib.sen.go.kr">도봉도서관</option>
		</select>
	</div>
	<hr style="clear:both" />
	<div class="container">
		<div style="font-size:14px; margin-left:25px;">(우) 05725 서울 송파구 동남로 263 (오금동, 송파도서관)대표전화02-3434-3333/팩스번호02-448-8790</div>
		<div style="font-size:12px; margin-left:25px;">Copyright © 2017 Songpa Public Library. All Rights Reserved.</div>
	</div> <br /><br />
	
</body>
</html>