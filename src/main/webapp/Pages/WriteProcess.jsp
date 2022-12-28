<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Session/IsLoggedIn.jsp"%>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");
String cate = request.getParameter("cate");
String ofile = request.getParameter("ofile");
String sfile = request.getParameter("sfile");

BoardDTO dto = new BoardDTO();

dto.setTitle(title);
dto.setContent(content);
dto.setCategory(cate);
dto.setId(session.getAttribute("UserId").toString());
dto.setOfile(ofile);
dto.setSfile(sfile);

BoardDAO dao = new BoardDAO(application);

int iResult = dao.insertWrite(dto);

dao.close();

if(iResult == 1){
	if(cate.equals("gongji")){
		response.sendRedirect("ListG.jsp");	
	}
	else if(cate.equals("free")){
		response.sendRedirect("ListF.jsp");	
	}	
} else {
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>