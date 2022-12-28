<%@ page import="utils.BoardPage"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<%
BoardDAO dao = new BoardDAO(application);

Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
String pageSizeN = request.getParameter("pageSizeN");

if(pageSizeN != null){
	session.setAttribute("pageSizeN", pageSizeN);
}
if(searchWord != null){
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
int totalCount = dao.selectCountG(param);

/******* 페이지 처리 start *******/
int pageSize = 0;
if(session.getAttribute("pageSizeN") != null){
	pageSize = Integer.parseInt(session.getAttribute("pageSizeN").toString());
} else {
	pageSize = 10;
	
}
int blockPage =
	Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

/*
Math.ceil(전체 게시물 갯수 / 페이지당 출력할 게시물 갯수) => 결과값의 올림처리
가령 게시물의 갯수가 51개라면 나눴을때의 결과가 5.1이 된다.
이때 무조건 올림처리하여 6페이지가 나오게 된다.
만약 totalCount를 double로 형변환 하지 않으면 소수점 값이 나오지 않아
올림처리가 되지 않으므로 주의해야한다.
*/
int totalPage = (int)Math.ceil((double)totalCount / pageSize);

/*
목록에 처음 진입했을때는 페이지 관련 파라미터가 없는 상태이므로 무조건
1page로 지정한다. 만약 파라미터 pageNum이 있다면 request내장객체를 통해
받아온 후 페이지 번호로 지정한다.
*/
int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp);

int start = (pageNum - 1) * pageSize;
int end = pageSize;
param.put("start", start);
param.put("end", end);
/******* 페이지 처리 end *******/

List<BoardDTO> boardLists = dao.selectListPageG(param);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울특별시교육청 송파도서관 > 열린공간 > 공지사항</title>
<style>
	th { padding:8px; }
	td { border-top:1px solid grey; padding:8px; }
</style>
</head>
<body>
	<jsp:include page="../Main/Top.jsp" />
	<br />
	<div class="container">
		<br />
	    <h2 style="font-weight:bold;">공지사항</h2>
	    <br />
	    <hr />
	    <form>
	    	<span style="font-weight:bold;">총 게시물 : <%= totalCount %>건</span> &nbsp;
		    <select name="pageSizeN" style="width:200px; height:28px; margin-top:16px; margin-bottom:12px;">
		    	<option value="">한페이지당 게시물수</option>
		        <option value="10">10개씩 보기</option>
		        <option value="20">20개씩 보기</option>
		        <option value="40">40개씩 보기</option>
		    </select>
		    <input type="submit" value="이동" style="background-color:rgb(38, 106, 196); border-radius:5px; border:none; color:white; width:44px; height:28px;" />
		</form>
		
		    <table style="width:90%; border-top:2px solid grey; border-bottom:2px solid grey; text-align:center; margin-top:16px;">
		        <tr>
		            <th width="10%">번호</th>
		            <th width="40%">제목</th>
		            <th width="20%">작성자</th>
		            <th width="20%">작성일</th>
		            <th width="10%">조회수</th>
		        </tr>
			<%
			if (boardLists.isEmpty()) {
			%>
		        <tr>
		            <td colspan="5" align="center">
		                등록된 게시물이 없습니다^^*
		            </td>
		        </tr>
			<%
			}
			else {
			    int virtualNum = 0;
				int countNum = 0;
			    for (BoardDTO dto : boardLists)
			    {
			        virtualNum = totalCount- (((pageNum -1) * pageSize) + countNum++);   
			%>
		        <tr align="center">
		            <td><%= virtualNum %></td>
		            <td align="left"> 
		                <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
		            </td>
		            <td align="center"><%= dto.getId() %></td>
		            <td align="center"><%= dto.getPostdate() %></td>
		            <td align="center"><%= dto.getVisitcount() %></td>    
		        </tr>
			<%
			    }
			}
			%>
		    </table>
		    <div style="text-align:center;">
		    	<%= BoardPage.pagingStr(totalCount, pageSize,
		        				blockPage, pageNum, request.getRequestURI()) %>
		    </div>
		    <table border="1" width="90%">
		        <tr align="center">
		            <td>
			            <form>
						    <select name="searchField"> 
						        <option value="title">제목</option> 
						        <option value="content">내용</option>
						        <option value="id">작성자</option>
						    </select>
						    <input type="text" name="searchWord" />
						    <input type="submit" value="검색하기" />
					    </form>
			            <button type="button" onclick="location.href='Write.jsp';">글쓰기
		                </button>
		            </td>
		        </tr>
		    </table>
	</div>
    <jsp:include page="../Main/Bottom.jsp" />
</body>
</html>