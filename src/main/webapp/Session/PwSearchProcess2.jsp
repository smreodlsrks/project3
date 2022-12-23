<%@page import="utils.JSFunction"%>
<%@page import="membership.MembershipDTO"%>
<%@page import="membership.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String answer = request.getParameter("answer");

if(answer.equals(session.getAttribute("answer"))){
	request.setAttribute("answer1", answer);
	request.getRequestDispatcher("./PwSearch2.jsp").forward(request, response);
} else {
	JSFunction.alertBack("질문의 답변이 틀렸습니다.", out);
}
%>