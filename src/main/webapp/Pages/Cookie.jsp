<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파도서관 환경개선공사 안내</title>
<script>
	function makeCookie(checkbox){
		if(checkbox.checked==true){
			document.cookie = "main=value; path=/";
			self.close();
			opener.parent.location.reload();
		}
		//쿠키 삭제방법
		//else{
		//	document.cookie = "main=; path=/; max-age=0";
		//}		
	}
	
	function move(){
		self.close();
		opener.parent.location.href="#";
	}
</script>
</head>
<body>
	<div style="width:438px;">
	<img src="../Images/공사안내문.png" style="cursor:pointer;" onclick="move()" /><br />
	<label style="cursor:pointer;"><input type="checkbox" id="cookie" style="float:left;" onclick=makeCookie(this) />오늘하루 열지않음</label>
	<button type="button" onclick="self.close()" 
		style="float:right; cursor:pointer; background-color:white; border:none;">X</button>
	</div>
</body>
</html>