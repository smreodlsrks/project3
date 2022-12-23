<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울특별시교육청 > 회원유형확인 > 이용약관동의 > 본인확인</title>
<style>
a { text-decoration:none; color:black; }
a:hover { text-decoration:none; color:rgb(43, 116, 192); }
</style>
<script>
	var rNum = "";
	function phoneConfirm(){
		rNum = "";
		for(var i=1; i<=6 ; i++){
		    rNum += parseInt(Math.random()*10);
		}
		alert("인증번호는 '"+rNum+"'입니다.");
		if(document.getElementById("clocking").style.display == "none"){
			document.getElementById("clocking").style.display = "inline";
		}
	}
	
	function check(){
		if(rNum == document.getElementById('rConfirm').value){
			location.href="./MembershipForm.jsp"
		} else {
			alert("입력하신 인증번호가 틀렸습니다.\n"
					+"인증번호를 재발급 받으세요.")
		}
	}
</script>
</head>
<body>
	<img src="../Images/sign3-1.png" /><br />
	<div style="width:826px; border-left:1px solid rgb(204, 204, 204); border-right:1px solid rgb(204, 204, 204);
		 background-color:rgb(243, 243, 243); font-weight:bold; margin-left:59px; margin-top:-4px;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I-PIN 신규발급 [<a href="http://www.siren24.com/index.jsp" target="_blank">http://www.siren24.com/index.jsp</a>]
	</div>
	<img src="../Images/sign3-2.png" /><br /><br />
	<button type="button" style="background-color:white; border:0; margin-left:52px; cursor:pointer;" onclick="phoneConfirm();"><img src="../Images/phoncf.png" /> </button>
	<div style="position:relative; left:20px; bottom:80px; display:none;" id="clocking";>
		<input type="text" id="rConfirm" /> <button type="button" onclick="check()">확인</button>
	</div>
	
	
</body>
</html>