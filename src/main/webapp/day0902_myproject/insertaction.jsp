<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.OttDao"%>
<%@page import="data.dto.OttDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%
	String idnum=request.getParameter("idnum");
	//업로드할 폴더
	String realFolder=getServletContext().getRealPath("/save");
	System.out.println(realFolder);
	
	//업로드할 이미지 크기
	int uploadSize=1024*1024*3;
	
	MultipartRequest multiRequest=null; 
	
	multiRequest=new MultipartRequest(request,realFolder,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	
	String title=multiRequest.getParameter("title");
	String photo=multiRequest.getFilesystemName("photo");
	String actors=multiRequest.getParameter("actors");
	String []ott=multiRequest.getParameterValues("ott");

	String startday=multiRequest.getParameter("startday");
	//System.out.println(startday);
	//ott 배열을 문자열로
	String otts="";
	if(ott==null) otts="다시 볼 수 있는 ott 없음";
	else {
		for(String tt:ott){
			otts+=tt+",";
		}
		otts.substring(0, otts.length()-1);
	}
	//날짜변환
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date date = formatter.parse(startday);
	long time = date.getTime();
	Timestamp startdayts = new Timestamp(time);
	
	//dto에 담기
	OttDto dto=new OttDto();
	dto.setTitle(title);
	dto.setPhoto(photo);
	dto.setActors(actors);
	dto.setOtt(otts);
	dto.setStartday(startdayts);
	
	//dao
	OttDao dao=new OttDao();
	dao.insertContents(dto);
	int num=dao.getMaxnum();
	response.sendRedirect("detailview.jsp?num="+num+"&idnum="+idnum);
%>