<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.OttIdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	String idnum=request.getParameter("idnum");
	String contentnum=request.getParameter("contentnum");
	//System.out.println(idnum+contentnum);
	
	OttIdDao dao=new OttIdDao();
	dao.delConentNum(idnum, contentnum);
	response.sendRedirect("ottlist.jsp?idnum="+idnum);
%>