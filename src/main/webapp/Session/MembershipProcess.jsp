<%@page import="membership.MembershipDAO"%>
<%@page import="membership.MembershipDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String sex = request.getParameter("sex");
String birth1 = request.getParameter("birth1");
String birth2 = request.getParameter("birth2");
String birth3 = request.getParameter("birth3");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String zipcode = request.getParameter("zipcode");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String mobile1 = request.getParameter("mobile1");
String mobile2 = request.getParameter("mobile2");
String mobile3 = request.getParameter("mobile3");
String quiz = request.getParameter("quiz");
String answer = request.getParameter("answer");

MembershipDTO dto = new MembershipDTO();
dto.setId(id);
dto.setPassword(password);
dto.setName(name);
dto.setSex(sex);
dto.setBirth1(birth1);
dto.setBirth2(birth2);
dto.setBirth3(birth3);
dto.setEmail1(email1);
dto.setEmail2(email2);
dto.setZipcode(zipcode);
dto.setAddr1(addr1);
dto.setAddr2(addr2);
dto.setPhone1(phone1);
dto.setPhone2(phone2);
dto.setPhone3(phone3);
dto.setMobile1(mobile1);
dto.setMobile2(mobile2);
dto.setMobile3(mobile3);
dto.setQuiz(quiz);
dto.setAnswer(answer);

MembershipDAO dao = new MembershipDAO(application);

int iResult = dao.insertMember(dto);
dao.close();
if(iResult == 1){
%>
	<script>
	self.close();
	opener.parent.alert("회원가입이 정상적으로 완료되었습니다.");
	</script>
<%
} else {
	JSFunction.alertBack("회원가입에 실패하였습니다.", out);
}
%>