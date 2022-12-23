<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울특별시교육청 > 회원유형확인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
	#frm:hover { color:rgb(130, 174, 212); cursor:pointer; }
</style>
<script> 
	function SignUp2(){		
		    open("./SignUp2.jsp",
		  		"signUp2",
			    "width=990, height=700, left=100, top=100, "
		    	+ "location=no, toolbar=no, menubar=no, "
		    	+ "scrollbars=yes, resize=no");
		    self.close();			
	}
</script>
</head>
<body>
	<img src="../Images/sign1.png" /> 
	<div style="margin-left:50px;">
	- 실제 정보와 가입 정보가 차이가 있을 경우 인증이 되지 않을 수 있습니다.
	</div> <br /><br />
	
	<div style="margin-left:300px; border:1px solid rgb(220, 220, 220); background-color:rgb(251, 251, 251); width:250px; height:400px;" onclick="location.href='./SignUp2.jsp'">
		<div id="frm" style="border:1px dotted rgb(220, 220, 220); margin:5px; background-color:rgb(251, 251, 251); width:240px; height:390px; text-align:center;">
			<br />
			<h2>만 14세 이상</h2>
			<h4>일반회원</h4>
			<i class="bi bi-person-circle" style="font-size:160px;"></i>
		</div>
	</div>
	
</body>
</html>