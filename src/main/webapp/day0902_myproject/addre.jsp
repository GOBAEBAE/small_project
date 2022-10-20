<%@page import="data.dao.OttreDao"%>
<%@page import="data.dto.OttreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<jsp:useBean id="dao" class="data.dao.OttreDao"></jsp:useBean>
<jsp:useBean id="dto" class="data.dto.OttreDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	//System.out.println(dto.getContentnum());
	dao.insertRe(dto);
%>