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
</head>
<body>
    <%
    if(session.getAttribute("answer").equals(request.getAttribute("answer1"))){
    %>
	    <div style="margin-top:60px; text-align:center;">
	    	해당 아이디의 비밀번호는<br />
	    	"<%= session.getAttribute("password") %>"입니다.
	    	<br /><br />
	    	<button type="button" style="border-radius:5px; border:1px solid grey;
	    		width:50px; height:30px;" onclick="self.close()" >닫기</button>
	    </div>
    <% } else { %>
	    <h2 style="margin-left:30px; margit-top:30px;">비밀번호 찾기</h2>
			<form action="./PwSearchProcess2.jsp" style="margin-left:30px;" onsubmit="return formValidate(this);">
				<table>
					<tr>
			            <td><span class="c_imp">*</span> 질문</td>
			            <td>
			                <%= session.getAttribute("quiz") %>
			            </td>
			        </tr>
					<tr>
			            <td><span class="c_imp">*</span> 답변</td>
			            <td>
			                <input type="text" name="answer" value="" />
			            </td>
			        </tr>
			    </table>
			    <br />
				<input type="submit" value="제출" style="border-radius:5px; border:1px solid grey; width:50px; height:30px; margin-left:135px;" />
			</form>	    
   <%
    }
    %>
</body>
</html>