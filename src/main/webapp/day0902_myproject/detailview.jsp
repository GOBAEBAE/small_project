<%@page import="java.util.List"%>
<%@page import="data.dto.OttIdDto"%>
<%@page import="data.dao.OttIdDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.OttDto"%>
<%@page import="data.dao.OttDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content view</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Barlow:wght@100&family=Cute+Font&family=Dongle:wght@300;400&family=Gaegu&family=Gamja+Flower&family=Hi+Melody&family=Josefin+Sans:wght@200&family=Jua&family=Single+Day&display=swap"
        rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<%
	String num=request.getParameter("num");
	//dao 생성
	OttDao dao=new OttDao();
	OttDto dto=dao.getDetail(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");
	String ottString=dto.getOtt();
	String []otts=ottString.split(",");
	
	String idnum=request.getParameter("idnum");
	OttIdDao daoid=new OttIdDao();
	OttIdDto dtoid=daoid.getIdnum(idnum);
	
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
  	 margin-top: 30px;
    }
    img.mainphoto{
    	width: 210px;
    	height: 300px;
    	border-radius: 10px;
    	 margin-left: auto;
    	 margin-bottom: 10px;
    }
    div.dbox{
    	display: flex;
    }
    img.logo{ height: 30px;}
    div.bts{ display: flex; justify-content: space-evenly;}
    #addre{
		cursor: pointer;
	}
	label.heartbtn{
		cursor: pointer;
	}
	a.link-ott{
		color:white;
		text-decoration: none;
	}
	a.link-ott:hover {
		text-decoration: underline;
	}
</style>
<script type="text/javascript">
$(function(){
	var contentnum="<%=dto.getNum()%>";
	//console.log(contentnum);
	listre(contentnum);
	//댓글 달기 클릭
	$("#addre").click(function () {
		var contentnum="<%=dto.getNum()%>";
		var ottid="<%=dtoid.getOttid()%>";
		var txt=$("#retxt").val();
		//console.log(contentnum,ottid,txt);
		
		$.ajax({
			type:"get",
			url:"addre.jsp",
			dataType:"html",
			data:{"contentnum":contentnum,"ottid":ottid,"txt":txt},
			success:function(data){
				//alert("추가되었습니다");
				
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
		location.reload();
		});//click
	});//function
	
	function listre(contentnum) {
		$.ajax({
			type:"get",
			url:"listre.jsp",
			dataType:"json",
			data:{"contentnum":contentnum},
			success:function(data){
				var s="";
				s+="<table class='table table-dark'>";
				s+="<tr align=center>";
				s+="<td style='width:100px'>작성자</td>";
				s+="<td style='width:300px'>댓글내용</td>";
				s+="<td style='width:200px'>작성일</td></tr>";
				$(data).each(function (i,e) {
					s+="<tr>";
					s+="<td>"+e.ottid+"</td>";
					s+="<td>"+e.txt+"</td>";
					s+="<td>"+e.writeday+"</td></tr>";
				});//each
				s+="</table>";
				$("#table_re").html(s);
				
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
		
		//좋아요
		$("label.heartbtn").click(function () {
			var heartclass=$(this).find("i").attr("class");
			//console.log(heartclass);
			var idnum="<%=idnum%>";
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
	}//jq
	</script>
</head>

<body style="background-color: black;">
<div class='mainbox'>
	<h1 align="center"><%=dto.getTitle() %></h1><br>
	<div class='dbox' style="width: 100%;">
		<div class="headbox" style="width: 400px;">
		<br><br>
		<h4>첫 방송일 : <%=sdf.format(dto.getStartday()) %></h4>
		<h4>출연배우 : <div><%=dto.getActors() %></div></h4>
		<hr>
		<%//좋아요 나오게
		String heartclass="bi-heart";
		String []arrCN=dtoid.getContentnum().split(",");
		for (int i=1;i<arrCN.length;i++){
			if(arrCN[i].equals(dto.getNum())){
				heartclass="bi-heart-fill";
			}
		}
		%>
		<label class="heartbtn" cnum="<%=dto.getNum()%>"><i class="bi <%=heartclass%>" style="color:red;"></i>좋아요</label>
		<br><hr><br>
		<h3>다시보기</h3>
		<%for(String ott:otts) {%>
			<div><img src="../save/<%=ott %>.png" class="logo"> <a class="link-ott" href="http://www.<%=ott%>.com"><%=ott %> 보러가기<i class="bi bi-box-arrow-up-right" ></i>></a> </div>
		<%} %>
		</div>
		<div style="align:center">
		<img src="../save/<%= dto.getPhoto() %>" class="mainphoto"><br> 
		<div class="bts">
		<button type="button" class="btn btn-outline-warning" onclick="location.href='updatecontent.jsp?num=<%=num %>&idnum=<%=dtoid.getNum()%>'">수정</button>
		<button type="button" class="btn btn-outline-danger" id="delbtn" >삭제</button>
		<script type="text/javascript">
			$("#delbtn").click(function () {
				var chk=confirm("<%=dto.getTitle()%>을(를) 삭제하시려면 [확인]을 눌러주세요");
				if(!chk) return;
				location.href="deleteaction.jsp?num=<%=num %>&idnum=<%=dtoid.getNum()%>";
			})
		</script>
		<button type="button" class="btn btn-outline-primary" onclick="location.href='ottlist.jsp?idnum=<%=dtoid.getNum()%>'">목록</button>
		</div>
		</div>
	</div>
	<br><hr>
	<div class="input-group">
	<input type="text" style="width: 600px; color: black;" id="retxt" >&nbsp;&nbsp;
	<label id="addre"><i class="bi bi-chat-dots" ></i>댓글달기</label> 
	</div>
	<div id="table_re">
	</div>
</div>
</body>
</html>