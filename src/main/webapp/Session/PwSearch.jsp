<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	table { border:none; border-collapse:collapse; }
	td { padding:10px; border:1px solid #b9babb; }
	.c_imp { color:red; }
</style>
<script>
	function comfotable(idx, lengthx, next){
		if(document.getElementById(idx).value.length == lengthx)
			document.getElementById(next).focus();
	}
</script>
</head>
<body>
    <h2 style="margin-left:30px; margit-top:30px;">비밀번호 찾기</h2>
		<form action="./PwSearchProcess.jsp" style="margin-left:30px;" onsubmit="return formValidate(this);">
			<table>
				<tr>
		            <td><span class="c_imp">*</span> 아이디</td>
		            <td>
		                <input type="text" name="id" value="" />
		            </td>
		        </tr>
				<tr>
		            <td><span class="c_imp">*</span> 휴대전화</td>
		            <td>
		                <input type="text" id="m1" name="mobile1" value="" maxlength="3" size="1" onkeyup="comfotable('m1', 3, 'm2')" /> -
		                <input type="text" id="m2" name="mobile2" value="" maxlength="4" size="2" onkeyup="comfotable('m2', 4, 'm3')" /> -
		                <input type="text" id="m3" name="mobile3" value="" maxlength="4" size="2" />	                
		            </td>
		        </tr>
		    </table>
		    <br />
			<input type="submit" value="제출" style="border-radius:5px; border:1px solid grey; width:50px; height:30px; margin-left:135px;" />
		</form>	    
</body>
</html>