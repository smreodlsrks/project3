<%@page import="membership.MembershipDTO"%>
<%@page import="utils.JSFunction"%>
<%@page import="membership.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
MembershipDAO dao = new MembershipDAO(application);
MembershipDTO dto = dao.isMember(id);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<style>
	table { border:none; border-collapse:collapse; }
	td { padding:10px; border:1px solid #b9babb; }
	.c_imp { color:red; }
</style>
<script>
	function available(){
		var id = "<%= id %>";
		opener.document.getElementById("id").readOnly = false;
		opener.document.getElementById("id").value = id;
		opener.document.getElementById("idx").checked = true;
		self.close();
	}
</script>
</head>
<body>
    <%
    if(!id.equals("") && dto.getName().equals("0")){
    %>
    	<h2 style="margin-left:30px; margit-top:30px;">아이디 중복검사</h2>
	    <div style="margin-top:60px; text-align:center;">
	    	<%= id %>는 사용할 수 있는 아이디입니다.	    	
	    	<button type="button" onclick="available()" style="border-radius:5px; border:1px solid grey;
	    		width:50px; height:30px; cursor:pointer;">닫기</button>
	    </div>
    <% } else { %>
	    <h2 style="margin-left:30px; margit-top:30px;">아이디 중복검사</h2>
	    	<div style="color:red; margin-left:33px; margin-bottom:15px;"><%= id %>는 이미 존재하는 아이디입니다.</div>
			<form action="./DuplicationProcess.jsp" style="margin-left:30px;" method="get" onsubmit="return formValidate(this);">
				<table>
					<tr>
			            <td><span class="c_imp">*</span> 아이디</td>
			            <td>
			                <input type="text" name="id" value="" />
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