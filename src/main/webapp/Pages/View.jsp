<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>    
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);
Cookie[] cookies = request.getCookies();
boolean ckIsAlive = false;
if (cookies != null) {
    for (int i=0 ; i<cookies.length ; i++) {
        if (cookies[i].getName().equals(session.getAttribute("UserId")+num)){
        	ckIsAlive = true;
        }
    }
}
if(ckIsAlive == false){
	dao.updateVisitCount(Integer.parseInt(num));
	Cookie cookie = new Cookie(session.getAttribute("UserId")+num, "visited");
	response.addCookie(cookie);
} 
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;      
        form.method = "post"; 
        form.action = "DeleteProcess.jsp";
        form.submit();
    }
}
</script>
</head>
<body>
<h2>회원제 게시판 - 상세 보기(View)</h2>
<jsp:include page="../Main/Top.jsp" />
<form name="writeFrm">
<input type="hidden" name="num" value="<%= num %>" />  
    <table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%= dto.getNum() %></td>
            <td>작성자</td>
            <td><%= dto.getName() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%= dto.getPostdate() %></td>
            <td>조회수</td>
            <td><%= dto.getVisitcount() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%= dto.getTitle() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100">
                <%= dto.getContent().replace("\r\n", "<br/>") %>
            </td> 
        </tr>
        <tr>
            <td colspan="4" align="center">
            	<%
            	if(session.getAttribute("UserId") != null){
	            	if(session.getAttribute("UserId").toString().equals("admin")
	            			|| session.getAttribute("UserId").toString().equals(dto.getId())){
	            %>
                <button type="button" onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>';">
                    수정하기</button>
                <button type="button" onclick="deletePost();">삭제하기</button>                 
	            <%
	            }}
	            %>
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기
                </button>
            </td>
        </tr>
    </table>
</form>
<jsp:include page="../Main/Bottom.jsp" />
</body>
</html>
