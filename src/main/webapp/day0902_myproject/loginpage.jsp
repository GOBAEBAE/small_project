<%@page import="java.util.List"%>
<%@page import="data.dto.OttIdDto"%>
<%@page import="data.dao.OttIdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0902 login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Barlow:wght@100&family=Cute+Font&family=Dongle:wght@300;400&family=Gaegu&family=Gamja+Flower&family=Hi+Melody&family=Josefin+Sans:wght@200&family=Jua&family=Single+Day&display=swap"
        rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<style>
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    *{
    	font-family: 'GangwonEdu_OTFBoldA';
    	color:white;
    }
    div.logbox
    {
    	color: white;
    	width: 700px;
    	position : absolute;
    	left:50%;
    	margin-left:-350px;
    	top:250px;
  		display: flex;
  		justify-content: center;
  		flex-wrap: wrap;
 	 }
 	 div.profile{
	 	 width: 100px;
	 	 height: 150px;
	 	 display: flex;
  		justify-content: center;
  		cursor: pointer;
  		margin: 10px 10px;
  		align-items: center;
  		
 	 }
 	 div.profile img{
	 	 width: 75px;
	 	 height: 100px;
 	 }
 	 h1.subject{
 		 position : absolute;
 		 width:500px;
 		 left:50%;
 		 top:150px;
    	margin-left:-250px;
 	 }
</style>
</head>
<%
	OttIdDao dao=new OttIdDao();
	List<OttIdDto> list=dao.getList();

%>
<body style="background-color: black;">
<h1 class="subject">계정을 선택하거나 추가하세요</h1>
<div class="logbox">

<div class="profile">
	<figure>
		<img src="../save/addid.png" onclick="location.href='addid.jsp'">
		<figcaption align=center>계정 추가</figcaption>
	</figure>
	<%
		for(OttIdDto dto:list){%>
			<div class="profile">
				<figure>
					<img src="../save/<%=dto.getProfileimage()%>" 
					onclick="location.href='ottlist.jsp?idnum=<%=dto.getNum()%>'">
					<figcaption align=center><%=dto.getOttid() %></figcaption>
				</figure>
			</div>
		<%}
	%>
	
</div>
<script type="text/javascript">
	$("#idchk").click(function () {
		var a=confirm("")
	})
</script>
</body>
</html>