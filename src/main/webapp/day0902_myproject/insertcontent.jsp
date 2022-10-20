<%@page import="data.dto.OttDto"%>
<%@page import="data.dao.OttDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Contents</title>
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
     div.mainbox{ 
   		width: 600px;
  		 position: absolute;
  		 left: 50%;
  		margin-left:-300px;	
  		margin-top: 30px;
    }
    #blah{width:140px;
    	height: 200px;}
</style>
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</head>
<%
	String idnum=request.getParameter("idnum");

%>
<body  style="background-color: black;">
	<div class="mainbox">
	<form action="insertaction.jsp?idnum=<%=idnum%>" method="post" enctype="multipart/form-data">
		<table class="table table-dark "  style="vertical-align:middle" >
			<tr> 
			<td>Content Title : </td>
			<td><input type="text" name="title" class="form-control" style="width: 300px" required="required"></td>
			</tr>
			<tr> 
			<td>Content Image : </td>
			<td><input type="file" name="photo" style="width: 300px" onchange="readURL(this);" required="required">
				<img id="blah" src='../myimage/noimage.png' alt="your image" >
			</td>
			</tr>
			<tr> 
			<td>Actors : </td>
			<td><input type="text" name="actors" style="width: 300px" class="form-control" required="required"></td>
			</tr>
			<tr> 
			<td>Ott : </td>
			<td><select name="ott" multiple="multiple" style="width: 300px"  size="5" class="form-select" required="required">
					<option style="color: black" value="NETFLIX">NETFLIX</option>
					<option style="color: black" value="WAVVE">WAVVE</option>
					<option style="color: black" value="TVING">TVING</option>
					<option style="color: black" value="DISNEYPLUS">DISNEYPLUS</option>
					<option style="color: black" value="COUPANGPLAY">COUPANGPLAY</option>
				</select></td>
			</tr>
			<tr> 
			<td>Start day : </td>
			<td><input type="date" name="startday" style="width: 300px" class="form-control" required="required">
			</tr>
			<tr>
			<td colspan="2" align="center">
			<button type="submit"  class="btn btn-outline-success"> <i class="bi bi-upload">Upload Content</i></button>
			<button type="button" class="btn btn-outline-primary" onclick="location.href='ottlist.jsp?idnum=<%=idnum%>'">  <i class="bi bi-list"></i>목록</button>
			</td>
			</tr>
		</table>
		
	</form>
	</div>
</body>
</html>