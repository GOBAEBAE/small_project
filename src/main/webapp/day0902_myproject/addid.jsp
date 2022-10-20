<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Barlow:wght@100&family=Cute+Font&family=Dongle:wght@300;400&family=Gaegu&family=Gamja+Flower&family=Hi+Melody&family=Josefin+Sans:wght@200&family=Jua&family=Single+Day&display=swap"
        rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
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
   		width: 500px;
  		 position: absolute;
  		 left: 50%;
  		margin-left:-250px;	
  		margin-top: 30px;
    }
    
    #blah{width: 100px;
    	height: 125px;
    	margin: 10px 10px;}
    input {
	color:black;
}
   
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
<body style="background-color: black">
<div class=mainbox>
<form action="addidaction.jsp" method="post" enctype="multipart/form-data">
	<table class="table table-dark">
		<tr>
			<th style="width: 200px;">ID</th>
			<td style="width: 300px" ><input type="text" name="ottid"></td>
		</tr>
		<tr>
			<th>PASSWORD</th>
			<td><input type="password" name="ottpw"></td>
		</tr>
		<tr> 
			<th>Profile Image </th>
			<td><input type="file" name="photo" onchange="readURL(this);" required="required" style="color:white;">
				<img id="blah" src='../myimage/noprofile.png' alt="your image" >
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-outline-success"><i class="bi bi-person-plus-fill"></i>계정 추가</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='loginpage.jsp'">
				<i class="bi bi-person-lines-fill"></i>계정 목록</button>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>