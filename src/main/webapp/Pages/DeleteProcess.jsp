<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Session/IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");
String category = request.getParameter("category");
System.out.println(category);

BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;

if(sessionId.equals(dto.getId())){
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	dao.close();
	
	if(delResult == 1){
		if(category.equals("gongji")){
			JSFunction.justAlert("삭제되었습니다.", out);			
			response.sendRedirect("../Pages/ListG.jsp");
		}
		else if(category.equals("free")){
			JSFunction.justAlert("삭제되었습니다.", out);
			response.sendRedirect("../Pages/ListF.jsp");
		}
	}
	else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
}
else{
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
	return;
}
%>