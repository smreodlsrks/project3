<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
String url = request.getParameter("redirectUrl");
response.sendRedirect(url);
%>