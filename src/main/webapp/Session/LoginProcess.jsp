<%@page import="membership.MembershipDTO"%>
<%@page import="membership.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
String cookieId = request.getParameter("cookie_id");
if(cookieId==null){}
else if(cookieId.equals("on")){
	Cookie cookie = new Cookie("loginCookie", userId);
	response.addCookie(cookie);
}

MembershipDAO dao = new MembershipDAO(application);
MembershipDTO memberDTO = dao.getMembershipDTO(userId, userPwd);
dao.close();

if(memberDTO.getId() != null){
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
%>
	<script>
	self.close();
	opener.parent.location.reload();
	</script>	
<%
}
else{
	request.setAttribute("LoginErrMsg", "아이디 또는 비밀번호를 잘못 입력했습니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>