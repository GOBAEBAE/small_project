<%@page import="data.dto.OttIdDto"%>
<%@page import="data.dao.OttIdDao"%>
<%@page import="data.dao.OttDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.OttDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0902 my project</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Barlow:wght@100&family=Cute+Font&family=Dongle:wght@300;400&family=Gaegu&family=Gamja+Flower&family=Hi+Melody&family=Josefin+Sans:wght@200&family=Jua&family=Single+Day&display=swap"
        rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<%
	//계정 로그인
	String idnum=request.getParameter("idnum");
	OttIdDao daoid=new OttIdDao();
	OttIdDto dtoid=daoid.getIdnum(idnum);
	
	//dao생성
	OttDao dao=new OttDao();
	
	//list 생성
	List<OttDto> list=dao.getTotalList();
%>
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
   		width: 700px;
  		 position: absolute;
  		 left: 50%;
  		margin-left:-350px;	
  		margin-top: 50px;
    }
    
    div.listbox{
    	width:140px;
    	height:220px;  
    	text-align:center;
    	margin: 15px 15px 15px 15px;
    }
    img.imgbox{
    	width:140px;
    	height: 200px;  
    	margin-bottom: 5px;
    	cursor: pointer;
    }
    
    div.flex1{
    	display: flex;
    	flex-wrap:wrap;
    }
   
   
    img.pbox{
    	width: 30px;
    	height: 40px;
    }
    .heartbtn{
    	font-size: 15px;
    	font-weight:bold;
    	position: relative;
    	top:-43px;
    	left: 48px;
    	opacity: 0.8;
    }
   
    div.title{
    	position: relative;
    	top:-40px;
    }
</style>
<script type="text/javascript">
	$(function () {
		$("button.heartbtn").click(function () {
			var heartclass=$(this).find("i").attr("class");
			//console.log(heartclass);
			var idnum="<%=dtoid.getNum()%>";
			var contentnum=$(this).attr("cnum");
			//빈하트면
			if(heartclass=="bi bi-heart"){
			$(this).find("i").removeClass("bi-heart");
			$(this).find("i").addClass("bi-heart-fill");
			$.ajax({
				type:"get",
				url:"addgood.jsp",
				dataType:"html",
				data:{"idnum":idnum,"contentnum":contentnum},
				success:function(data){
					//alert("변경되었습니다");
					location.reload();
				},//success,
				statusCode:{//에러났을경우
					404:function(){
						alert("json 파일을 찾을 수 없어요!");
					},
					500:function(){
						alert("서버 오류.. 코드를 다시 확인해주세요");
					}
				}
			})//ajax
			}//if 
			//하트면
			else {
				$(this).find("i").addClass("bi-heart");
				$(this).find("i").removeClass("bi-heart-fill");
				$.ajax({
					type:"get",
					url:"deletegood.jsp",
					dataType:"html",
					data:{"idnum":idnum,"contentnum":contentnum},
					success:function(data){
						//alert("변경되었습니다");
						location.reload();
					},//success,
					statusCode:{//에러났을경우
						404:function(){
							alert("json 파일을 찾을 수 없어요!");
						},
						500:function(){
							alert("서버 오류.. 코드를 다시 확인해주세요");
						}
					}
				})//ajax
			}
		});//heart click
		
		$("#word").keyup(function (e) {
			if(e.keyCode==13){
				//seach 함수 호출
				search($(this).val().trim());//앞뒤공백제거후 보내기
			}//if
		});//keyup
		
		// 검색버튼 클릭 시		
		$("#searchbtn").click(function () {
			//seach 함수 호출
			search($("#word").val().trim());
		});//click
		
		
		function search(word) {
			var idnum="<%=dtoid.getNum()%>";
			var word=word;
			//console.log(word);
			$.ajax({
				type:"get",
				url:"searchott.jsp",
				dataType:"json",
				data:{"idnum":idnum,"word":word},
				success:function(data){
					var s="<table><tr>"
					var cnt=data.length;
					if(cnt==0){
						s = "<h4>'"+word+"'단어가 포함된 작품이나 배우는 없습니다!</h4>";
						console.log(s);
					}else{
						s+="<caption align='top' style='width:700px'><h4 style='color:white;'>'"
						+word+"'단어가 포함된 작품이나 배우는 총 "+cnt+"개 작품 입니다!</h4></caption>";
						$(data).each(function(idx,ele){
						s+='<td style="width:175px;"><div class="listbox">';
						//console.log(ele.photo);
						var detailurl="location.href='detailview.jsp?num="+ele.num+"&idnum="+ele.idnum+"'";
						s+='<img class="imgbox" src="../save/'+ele.photo+
						'" onclick='+detailurl+'>';
						s+='<div>'+ele.title+'</div></td>';
						if((idx+1)%4==0) {s+="</tr><tr>";}
						});//each
						if(cnt<4){
							while(cnt>0){
							s+="<td></td>";
							cnt=cnt-1;
							}
						}
					}//else
					s+="</tr></table>";
					$("#searchresult").html(s);
				},//success,
				statusCode:{//에러났을경우
					404:function(){
						alert("json 파일을 찾을 수 없어요!");
					},
					500:function(){
						alert("서버 오류.. 코드를 다시 확인해주세요");
					}
				}
			})//ajax
		};//검색
		
	});//jq
</script>

</head>

<body style="background-color: black;">
	<div class="mainbox">
	<h1 align="center">Contents Management </h1><br>
	<span style="font-size: 20px;"><img class="pbox" src="../save/<%=dtoid.getProfileimage()%>">&nbsp;<%=dtoid.getOttid() %>님 계정입니다</span>
	<button class="btn btn-outline-primary" onclick="location.href='loginpage.jsp'"><i class="bi bi-people"></i>계정변경</button>
	<br><br>
	<h2>Search Contents&nbsp;</h2>
	<hr>
	<div class="input-group">
	<input type="text" class="form-control" id="word" placeholder="작품명이나 배우 이름을 입력하세요">
	<button type="button" class="btn btn-outline-info" id="searchbtn">
	검색 <i class="bi bi-search"></i></button></div>
	<div id="searchresult"></div>
	<br>
	<h2>My Favorite Contents&nbsp;<i class="bi bi-emoji-heart-eyes"></i></h2>
	<hr>
	<div>
	<table><tr>
	<%
		String []arrCN=dtoid.getContentnum().split(",");
		for (int i=1;i<arrCN.length;i++) {
			OttDto fdto=dao.getDetail(arrCN[i]);
		%>
		<td>
		<div class="listbox">
		<img class="imgbox" src="../save/<%=fdto.getPhoto()%>"
		onclick="location.href='detailview.jsp?num=<%=fdto.getNum()%>&idnum=<%=dtoid.getNum()%>'">
		<button class="btn btn-light heartbtn" cnum="<%=fdto.getNum()%>"><i class="bi bi-heart-fill" style="color:red"></i></button>
		<div class="title"><%=fdto.getTitle() %></div></td>
		<% if(i%4==0) {%></tr><tr>
		<% }} %>
	</tr>
	</table>

	</div>
	<br>
	<h2>All Contents
	<button type="button" class="btn btn-outline-success"  onclick="location.href='insertcontent.jsp?idnum=<%=dtoid.getNum()%>'"><i class="bi bi-cloud-plus"></i>Add Contents </button>
	</h2>
	<hr>
	<div class="flex1">
	
	<%
	int maxNum=dao.getMaxnum();
	//System.out.print(maxNum);
	boolean []chk=new boolean[maxNum+1];
	for (int j=0;j<maxNum;j++){
		//System.out.print(list.get(j).getNum()+",");
		//if(list.get(j).getNum()==null) {continue;}
		//else{
		try{
		//System.out.println(list.get(j).getNum());
		OttDto dto=list.get(j);
		String []arrCN2=dtoid.getContentnum().split(",");
		for (int i=1;i<arrCN2.length;i++) {
			if(arrCN2[i].equals(dto.getNum())){
				int no=Integer.parseInt(dto.getNum());
				chk[no]=true;
			}
			}//for dto
		}
		catch(IndexOutOfBoundsException e) {
			}
		//}//else null
	}//for maxnum
	for (int k=0;k<list.size();k++){
			OttDto dto=list.get(k);
			String heartFill="bi-heart-fill";
			String heartEmpty="bi-heart";
		%>
		<div class="listbox">
		<img class="imgbox" src="../save/<%=dto.getPhoto()%>" 
		onclick="location.href='detailview.jsp?num=<%=dto.getNum()%>&idnum=<%=dtoid.getNum()%>'">
		<%int no=Integer.parseInt(dto.getNum()); %>
		<button class="btn btn-light heartbtn" cnum="<%=dto.getNum()%>"><i class="bi <%=chk[no]?heartFill:heartEmpty %>" style="color:red"></i></button>
		<div class="title"><%=dto.getTitle() %></div>
		</div><!-- listbox -->
	<%}//for%>

	</div>
	</div><!-- mainbox -->
</body>
</html>