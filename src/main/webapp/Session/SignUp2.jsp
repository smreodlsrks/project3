<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울특별시교육청 > 회원유형확인 > 이용약관동의</title>
<script>
	function SignUp3(){
			if(document.getElementById("agree1").checked == false
					|| document.getElementById("agree2").checked == false
					|| document.getElementById("agree3").checked == false){
				alert("이용약관 동의, 개인정보의 수집 및 이용 동의,\n수집한 개인정보의 제3자 제공에 동의해주세요.");
				return false; 
			}
			location.href="./SignUp3.jsp"
	}
	function Cancel(){
		self.close();
		opener.parent.alert("회원가입을 취소하였습니다.")
	}
</script>
</head>
<body>
	<img src="../Images/sign2.png" /><br />
	<h3 style="margin-left:60px;">이용약관 동의</h3>
	<iframe src="../Text/text1.html" style="border:1px solid rgb(204, 204, 204); width:825px; height:300px; 
		background-color:rgb(243, 243, 243); margin-left:60px;"></iframe><br />
	<label style="cursor:pointer; margin-left:725px;"><input type="checkbox" id="agree1" />이용약관 동의(필수)</label><br /><br />
	<h3 style="margin-left:60px;">개인정보의 수집·이용 동의</h3>
	<iframe src="../Text/text2.html" style="border:1px solid rgb(204, 204, 204); width:825px; height:300px; 
		background-color:rgb(243, 243, 243); margin-left:60px;"></iframe>
	<label style="cursor:pointer; margin-left:597px;"><input type="checkbox" id="agree2" />개인정보의 수집·이용 동의 동의(필수)</label><br /><br />
	<h3 style="margin-left:60px;">수집한 개인정보의 제3자 제공 동의</h3>
	<iframe src="../Text/text3.html" style="border:1px solid rgb(204, 204, 204); width:825px; height:300px; 
		background-color:rgb(243, 243, 243); margin-left:60px;"></iframe><br />
	<label style="cursor:pointer; margin-left:568px;"><input type="checkbox" id="agree3" />수집한 개인정보의 제3자 제공 동의(필수)</label><br /><br />
	
	<button type="button" style="width:80px; height:45px; background-color:black; border-radius:5px; color:white; font-size:14px; margin-left:380px; cursor:pointer;" onclick="SignUp3()" >확인</button>
	<button type="button" style="width:80px; border:grey; height:45px; background-color:grey; border-radius:5px; color:white; font-size:14px; cursor:pointer;" onclick="Cancel()" >취소</button>
	
	
	
</body>
</html>