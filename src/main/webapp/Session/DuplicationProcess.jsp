<%@page import="utils.JSFunction"%>
<%@page import="membership.MembershipDTO"%>
<%@page import="membership.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
MembershipDAO dao = new MembershipDAO(application);
MembershipDTO dto = dao.isMember(id);
dao.close();

if(dto.getId() == null){
	request.setAttribute("id", id);
	request.getRequestDispatcher("./Duplication.jsp").forward(request, response);
} else {
	request.getRequestDispatcher("./Duplication.jsp").forward(request, response);
}
%>