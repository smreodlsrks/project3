<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Session/IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);
String sessionId = session.getAttribute("UserId").toString();
if(!sessionId.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function validateForm(form){
	if(form.title.value == ""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if(form.cate.value == ""){
		alert("카테고리를 선택하세요.");
		return false;
	}
	if(form.content.value == ""){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../Main/Top.jsp" />
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form action="EditProcess.jsp" name="writeFrm" method="post"
	onsubmit="return validateForm(this);">
	<input type="hidden" name="num" value="<%= dto.getNum() %>" />
	<table border="1" width="90%">
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" style="width:90%;"
					value="<%= dto.getTitle() %>" />
			</td>
		</tr>
		<tr>
            <td>카테고리</td>
            <td>
            	<select name="cate">
            		<option value="">카테고리 선택</option>
            	<%
            		if(session.getAttribute("UserId").equals("admin")){
            	%>
            		<option value="gongji" <% if(dto.getCategory().equals("gongji")){ %> selected <% } %>>공지사항</option>
            	<%
            		}
            	%>
            		<option value="free" <% if(dto.getCategory().equals("free")){ %> selected <% } %>>자유게시판</option>
            		<option value="sub1" <% if(dto.getCategory().equals("sub1")){ %> selected <% } %>>sub1</option>
            		<option value="sub2" <% if(dto.getCategory().equals("sub2")){ %> selected <% } %>>sub2</option>
            		<option value="sub3" <% if(dto.getCategory().equals("sub3")){ %> selected <% } %>>sub3</option>
            	</select>
            </td>
        </tr> 
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width:90%; height:100px;"><%= dto.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">작성 완료</button>
				<button type="reset">다시 입력</button>
				<%
				if(dto.getCategory().equals("gongji")){
				%>
					<button type="button" onclick="location.href='ListG.jsp';">목록 보기</button>
				<%
				} else if(dto.getCategory().equals("free")){
				%>
					<button type="button" onclick="location.href='ListF.jsp';">목록 보기</button>
				<%
				}
				%>
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../Main/Bottom.jsp" />
</body>
</html>