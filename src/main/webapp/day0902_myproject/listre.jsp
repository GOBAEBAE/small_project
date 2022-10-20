<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.OttreDao"%>
<%@page import="data.dto.OttreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<% 
	String contentnum=request.getParameter("contentnum");
	//System.out.print(contentnum);
	//contentnum="1";
	OttreDao dao=new OttreDao();
	List<OttreDto> list=dao.getAllRe(contentnum);
	//json 배열 선언
	JSONArray arr=new JSONArray();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd a HH:mm");
			
	for(OttreDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("contentnum", dto.getContentnum());
		ob.put("ottid", dto.getOttid());
		ob.put("txt", dto.getTxt());
		String writedays=sdf.format(dto.getWriteday());
		ob.put("writeday",writedays);
		//배열에 추가
		arr.add(ob);
	}
%>

<%=arr.toString()%>