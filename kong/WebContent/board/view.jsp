<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>Insert title here</title>

	<%@include file="../include/inc_menu.jsp" %>
</head>

<style>
	
	.get_board_section{
		width: 80vw;
		display: grid;
		margin-left : 10%;
		justify-content: center;
		padding: 30px;
	}

	td h3{
		font-size: 55px;
	}
	
	.board_table{
		width: 90%;
		height: 50vh;
	}	
	
	.content_area{
		height: 400px;
	}
	
	.img_container{
		min-width : 60%;
		padding-top: 20px;
	}
	
	.content_img{
		width: 60%;
		
	}

	.no_data_img{
	
		width: 35%;
		
	}
	
	td{
		width: 100vw;
	}
	
	td #user{
		width: 50px;
	}
	
	/* 수정 삭제 목록 버튼 */
	.getBtn{
		width: 70px;
		height: 30px;
		background: white;
		border-radius : 5px;
		border: 1px solid #5A9AF5;
		color: black;
	}
	
	.button{
		position: absolute;
		bottom: 77%;
		right : 10%;
		
	}
	

	/* 경계산  */
	#h2{
		width: 100%;
		border-bottom: 2px solid #e4e4e4;
		margin-bottom: 10px;
		margin-top: 10px;
	
	}	
	
	/* 댓글관련  */
	
	#reply_write{
		display: block;
	}
	
	#reply_btn{
		position: absolute;
		margin-left: 10px;
		margin-top: 10px;
	}
	
	.reply_list{
		list-style: none;
	}
	
	.reply_list li{
		float: left;
	}
	
	.view_writer{
	
		width: 80px;
		
	}
	
	.reply_list .view_reply{
		width : 60%;
		margin-left: 100px;
	}

	#reply_area{
		position : static;
		width: 90%;
		height : 80%;
	
	}
	
	#span{
		float: left;
		margin-top: 20px;
		
	}

	.reply_button a{
		text-decoration: none;
		font-size: 15px;
		color: gray;
	}
	
	/* 대댓글 관련  */
	
	.replys_write{
		display: none;
	}
		
	
	.replys_content{
		margin-left: 14%;
	}
	
	.cancel_btn{
		display: none;
	}
	
	.getBtn_btn{
		position: absolute;
		margin-left: 10px;
		margin-top: 10px;
		width: 70px;
		height: 30px;
		background: white;
		border-radius : 5px;
		border: 1px solid #5A9AF5;
		color: black;
	}
	
	.repleimg{
		width: 10px;
		height: 10px;
	}
	
	/* 반응형  */
	@media  screen and  (max-width : 1050px){
		
		.reply_list .view_reply{
			width : 60%;
		}
		
	}
	
	@media  screen and  (max-width : 900px){
		
		.button{
			position: relative;
			float: right; 		
			left: 20px;
			top: 5px;
		}
		
		.reply_list .view_reply{
			width : 50%;
		}
		

	}
	
	@media  screen and  (max-width : 860px){
	
		td #user{
			width: 30px;
		}
		
		#span{
			font-size: 17px;
		}
		
		.reply_list li{
			float: left;
			margin-left: 10px;
		}
	
	}
	
	@media  screen and  (max-width : 700px){
		.reply_list .view_reply{
			width : 30%;
		}


	}
	
</style>

<body>
<section class="get_board_section"> 

        <table class="board_table">
 			<thead>
                <tr>
                    <td colspan="2" style="color: #5A9AF5;">
                      ${dto.type }
                    </td>
                </tr>
                <tr>
                     <td colspan="2">
                   
                    	 <h3>${dto.subject}</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                      
                       	<span id="span">
							<img id="user" alt="" src="${path }/img/avatar.svg">                       	
	                       	${dto.writer }
	                        <input type="hidden" name="writer" id= "writer" value="${sessionScope.user.id }" readonly="readonly">
							|
							<a>조회수 ${dto.searchNum }</a>
							|
							<a>댓글 ${count }</a>
							|
						<fmt:formatDate value="${dto.regi_date }" type="date" dateStyle="short"/>
						</span>
						<div class="button">
							<button type="submit" class="getBtn" id="edit_btn">수정</button>
                    		<button type="button" class="getBtn" id="list_btn">목록</button>
                    		<button type="submit" class="getBtn" id="delete_btn">삭제</button>
						</div>
					</td>
                </tr>
                <tr>
                	<td>
                		 <div id="h2">    	
    		
    			 		</div>
                	</td>
                </tr>
		</thead>
			
         <tbody>
                <tr>
                    <td class="content_area">
                    	<div class="img_container">
	                    	<c:choose>
	                    		<c:when test="${dto.board_img eq '-'}">
			                 		<img class="no_data_img" alt="" src="${path }/img/nodata.png" >         		
	                    		</c:when>
	                    		<c:otherwise>
			                 		<img class="content_img" alt="" src="${path }/img/boardImg/${dto.board_img}">         		
	                    		</c:otherwise>
	                    	</c:choose>
                    	</div>
                    	<br>
                    	<c:out value="${dto.content}" escapeXml="false" />
                    	<br>
                    </td>
                </tr> 
                
                   <tr>
                	<td>
                		 <div id="h2">    	
    		
    			 		</div>
                	</td>
                </tr>

         </tbody>
	                
        </table>
		<div id="reply_area">
	
	<c:set value="${i=1 }" var="i"></c:set>	
	<c:forEach var="reply" items="${list }">
			<div class="reply_list" id="reply_list">
				<input type="hidden" id="reply_no_${i }" name="reply_no" value="${reply.no}">
					<li class="view_writer">${reply.writer }</li>
				
					<li class="view_reply">
					<c:if test="${reply.indent == 1 }">
						&nbsp;&nbsp;&nbsp;
					</c:if>
						<img class="repleimg" alt="" src="${path}/img/reple2.png">
						${reply.content }
					</li>
					<li class="reply_button">
						<c:if test="${reply.indent < 1 }">
							<c:if test="${sessionScope.user.id eq reply.writer }">
								<a id="write_replys_${i}" class="write_replys" href="#">댓글쓰기</a>							
								<button type="button" class="cancel_btn" id="cancel_btn_${i}" value="x">X</button>
								<a href="">/</a>							
							</c:if>
						</c:if>
							<c:if test="${sessionScope.user.id == reply.writer }">
								<a id="write_delete_${i}" class="write_replys" href="#">삭제</a>							
							</c:if>
					</li>
					<div class="replys_write" id="replys_write_${i}">
			    		<form name="replysForm"  style="width: 100%; padding-top: 5%"  method="post" action="${path }/ReplyGetReplys.do">
								<input type="hidden" name="page" value="${paging.page}">
								<input type="hidden" name="no" value="${reply.no}">
								<input type="hidden" name="board_no" value="${dto.no}">
								<input type="hidden" name="writer" id="writer_${i}" value="${sessionScope.user.id }">
								<textarea class="replys_content" id="replys_content_${i}" cols="100%" rows="3" style="resize: none; width: 70%;" name="content" placeholder="댓글 작성란.."></textarea>
								<button type="submit" class="getBtn_btn" id="replys_btn_${i}">댓글 등록</button>
						</form>	 	
					</div>
			</div>
			<br>
	<c:set value="${i= i+1 }" var="i"></c:set>	
	</c:forEach>	
			 <div id="h2" style="margin-bottom: 30px; margin-top: 30px">    	
    		
    			 		</div>
				<div id="reply_write">
		    		<form name="replyForm"  style="width: 100%" method="post" action="${path }/ReplyGetReply.do">
							<input type="hidden" name="page" value="${paging.page}">
							<input type="hidden" name="no" value="${dto.no}">
							<input type="hidden" name="writer" id="writer" value="${sessionScope.user.id }">
							<textarea id="reply_content" class="reply_content" cols="100%" rows="3" style="resize: none; width: 95%;" name="content" placeholder="댓글 작성란.."></textarea>
							<button type="button" class="getBtn" id="reply_btn">댓글 등록</button>
					</form>	 	
				</div>
		</div> 
    </section>

 	<%@include file="../include/inc_footer.jsp" %>
</body>

<script type="text/javascript">

$(document).ready(function(){
	
	var id = $("#writer").val()
	
	if(id == ""){
		$(".board_section").css("display", "none");
		alert("로그인 후 이용해주세요");
		location.href = "Login.do";
	}

	var total = document.getElementsByClassName("reply_list").length;
	
	
	for(let i = 1; i <= total; i++){
		
		$("#write_replys_"+i).on("click", function(){
			$(".button").css("bottom", "77%");
			$("#replys_write_"+i).show();
			$("#cancel_btn_"+i).show();
						
	  	});

		$("#cancel_btn_"+i).on("click", function(){
			$("#replys_write_"+i).hide();
			$("#cancel_btn_"+i).hide();
			$(".button").css("bottom", "74%");
						
	  	});
		
		
		$("#write_delete_"+i).on("click", function(){
			
			let reply_no = $("#reply_no_"+i).val();
			if(reply_no > 0){
				if(confirm('정말 삭제하시겠습니까?')){
					$.ajax({
						url: "${path}/DeleteReply.do",
						type: "POST",
						dataType: "json",
						data : "no="+reply_no,
						success : function (data){
							if(data.message == "1"){
								alert("삭제가 완료되었습니다");
								document.location.reload(true);

							}else{
								alert("삭제하는 도중 오류가 발생되었습니다");
								return;
							}
						},
						error : function () {
							alert("system error");					
						}
						 
					});
				}
			}
			
						
	  	});

		

		
		$("#replys_btn_"+i).on("click", function(){
			
			var writer = $("#writer_"+i).val()
			var content = $("#replys_content_"+i).val()
		
			if(writer.trim() != "" && content.trim() != ""){	
				replysForm.submit();
			}else{
				alert("댓글을 작성 후 등록해주세요");
				$("#replys_content_"+i).focus();
				return false;
				
			}
		});
		
	}
	
	$("#reply_btn").on("click", function(){
		
		var writer = $("#writer").val()
		var content = $("#reply_content").val()
	
		if(writer.trim() == "" || content.trim() == ""){	
			alert("댓글을 작성 후 등록해주세요");
			return;
		}else{
			replyForm.submit();
		}
	});



	
	
	//목록으로
	$("#list_btn").on("click",function(){
		
		location.href = "${path}/BoardList.do?page=${paging.page}&keyword=${paging.keyword}&search=${paging.search}";
	
	});
	
	//수정으로
	$("#edit_btn").on("click",function(){
		
		location.href = "${path}/BoardEdit.do?no=${dto.no}&page=${paging.page}&keyword=${paging.keyword}&search=${paging.search}";
	
	});

	//삭제로
	$("#delete_btn").on("click",function(){
		
		if(confirm('삭제하시겠습니까?')){
	
			location.href = "${path}/BoardDelete.do?no=${dto.no}";
			
		}
		
	
	});
	
	

	
});	

</script>

</html>