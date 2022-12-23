<%@page import="utils.JSFunction"%>
<%@page import="membership.MembershipDTO"%>
<%@page import="membership.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String mobile1 = request.getParameter("mobile1");
String mobile2 = request.getParameter("mobile2");
String mobile3 = request.getParameter("mobile3");
MembershipDAO dao = new MembershipDAO(application);
MembershipDTO dto = dao.searchPw(id, mobile1, mobile2, mobile3);
dao.close();

if(dto.getPassword() != null){
	session.setAttribute("password", dto.getPassword());
	session.setAttribute("quiz", dto.getQuiz());
	session.setAttribute("answer", dto.getAnswer());
	request.getRequestDispatcher("./PwSearch2.jsp").forward(request, response);
} else {
	JSFunction.alertBack("아직 가입되지 않은 회원명입니다. 가입을 진행해주세요.", out);
}
%>