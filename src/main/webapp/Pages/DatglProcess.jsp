<%@page import="model1.board.DatglDAO"%>
<%@page import="model1.board.DatglDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Session/IsLoggedIn.jsp"%>
<%
String num = request.getParameter("num");
String id = request.getParameter("id");
String content = request.getParameter("content");

DatglDTO dto = new DatglDTO();

dto.setNumm(num);
dto.setIdm(id);
dto.setContentm(content);

DatglDAO dao = new DatglDAO(application);

int iResult = dao.insertWrite(dto);
dao.close();

if(iResult == 1){	
	response.sendRedirect("View.jsp?num="+num);
} else {
	JSFunction.alertBack("댓글작성에 실패하였습니다.", out);
}
%>