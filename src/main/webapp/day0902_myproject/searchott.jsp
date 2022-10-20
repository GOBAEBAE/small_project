<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.OttDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.OttDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	String idnum=request.getParameter("idnum");
	String word=request.getParameter("word");
	//word="우";
	OttDao dao=new OttDao();
	
	List<OttDto> list=dao.searchOtt(word);
	
	//json 배열 선언
	JSONArray arr=new JSONArray();
	
	for(OttDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("num", dto.getNum());
		ob.put("title", dto.getTitle());
		ob.put("photo", dto.getPhoto());
		ob.put("idnum",idnum);
		
		//배열에 추가
		arr.add(ob);
	}
%>
<%=arr.toString()%>

