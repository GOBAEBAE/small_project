<%@page import="data.dto.OttDto"%>
<%@page import="data.dao.OttDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	String num=request.getParameter("num");
	String idnum=request.getParameter("idnum");
	
	OttDao dao=new OttDao();
	OttDto dto=dao.getDetail(num);
	dao.deleteContent(num);
	response.sendRedirect("ottlist.jsp?idnum="+idnum);
%>