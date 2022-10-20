<%@page import="data.dao.OttIdDao"%>
<%@page import="data.dto.OttIdDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
//업로드할 폴더
	String realFolder=getServletContext().getRealPath("/save");
	System.out.println(realFolder);
	
	//업로드할 이미지 크기
	int uploadSize=1024*1024*3;
	
	MultipartRequest multiRequest=null; 
	
	multiRequest=new MultipartRequest(request,realFolder,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	String ottid=multiRequest.getParameter("ottid");
	String ottpw=multiRequest.getParameter("ottpw");
	String profileimage=multiRequest.getFilesystemName("photo");
	
	//dto에 담기
	OttIdDto dto=new OttIdDto();
	dto.setOttid(ottid);
	dto.setOttpw(ottpw);
	dto.setProfileimage(profileimage);
	
	OttIdDao dao=new OttIdDao();
	dao.addId(dto);
	
	response.sendRedirect("loginpage.jsp");
%>