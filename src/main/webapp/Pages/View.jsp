<%@page import="model1.board.DatglDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.DatglDAO"%>
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
	dao.updateVisitCount(num);
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
        form.action = "DeleteProcess.jsp?category=<%= dto.getCategory() %>";        
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
	            	}
	            }
            	if(dto.getCategory().equals("gongji")){
	            %>
                <button type="button" onclick="location.href='ListG.jsp';">
                    목록 보기
                </button>
                <%
            	} else if(dto.getCategory().equals("free")){
                %>
                <button type="button" onclick="location.href='ListF.jsp';">
                    목록 보기
                </button>
                <%
                }
                %>
            </td>
        </tr>
    </table>
</form>

<br /><br />

<form action="DatglProcess.jsp">
	<input type="hidden" name="num" value="<%= num %>" />
	<table style="align:center; text-align:center; width:800px;">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" cols="30" rows="10"></textarea>
			</td>
		</tr>
		<tr><td><input type="submit" /></td></tr>
	</table>
</form>

<br /><br />

<%
DatglDAO daoo = new DatglDAO(application);
Map<String, Object> param = new HashMap<String, Object>();
List<DatglDTO> datglLists = daoo.selectListPage(param);
daoo.close();

if (datglLists.isEmpty()) {}
else {
	for (DatglDTO dtoo : datglLists) {
    	if(dtoo.getNumm().equals(num)){
%>
<table style="align:center; text-align:center; width:800px; border:1px solid grey;">
	<tr>
		<td width="30%"><%= dtoo.getIdm() %></td>
		<td width="70%"><%= dtoo.getPostdatem() %></td>
	</tr>
	<tr>
		<td colspan="2"><%= dtoo.getContentm().replace("\r\n", "<br/>") %></td>
	</tr>
</table>
<%
    	}
	}
}
%>
<jsp:include page="../Main/Bottom.jsp" />
</body>
</html>
