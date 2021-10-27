<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    
}

.board_section{
    line-height: 30px;
    display: block;
    margin: 10px;
    padding: 20px;
	min-height: 70vh;
	width: 90%;
}


.board_table{
	
    width: 100%;
    margin : 20px;
    box-shadow: 0 2.5px 2.5px #e4e4e4;
    text-align: center;
  
}

.board_table thead{
    background: #94bbf1;
    color: white;
    line-height: 40px;

}

.board_table tbody td{
    padding: 5px;
}

.board_table tbody td a{
    display: block;
    color: #1f67cc;
    text-decoration: none;
   
}


.board_table tbody td a:hover{
   color: #0b408b;
   font-weight: bold;
    
}

.board_table tbody tr{
    margin-top: 10px;
    box-shadow: 0 2.5px 2.5px #e4e4e4;
    border:  2px solid #8bb8f7;
   
}

.num{
    width: 30px; 
}

.kind{
    width: 100px;    
}

.boardname{
    width: 200px;    
}

.boardwriter{
    width: 150px;    
}

.boardclick{
    width: 50px;    
}

.boardregi_date{
    width: 100px;    
}

.pagingation{

	display: block;
    width: 100%;
    height: 80px;
    margin: 1rem 0;
    font-size: 1.2rem;
    outline: none;
    border: none;
    cursor: pointer;
    color: #fff;
    text-transform: uppercase;
    font-family: 'Noto Sans KR', sans-serif; 
    text-align : center;
}

.pagingation .page{
	padding : 10px;
	color: #5A9AF5;
	text-decoration: none;
}

.search{
	margin-left: 15px;

}

.select{
	height: 30px;
	margin-left: 25px;
}

.searchBar{
	width: 100px;
	height: 30px;
}

.searchBtn{
	width: 60px;
	height: 30px;
	background: #5A9AF5;
	border: none;
	color: white;
}

.newboard{
	float: right;
	display: block;
    height: 30px;
   	margin-left : 30%;
    padding : 10px;
    border-radius: 5px;
    border: none;
    box-shadow: 0 2px 5px #e4e4e4;
    color: white;
    background: #5A9AF5;
	
}

.pagingation #active{
	color: #0b408b;
	padding : 10px;
	text-decoration: none;
}

</style>

</head>
<body>
	<%@include file="../include/inc_menu.jsp" %>


<section class="board_section"> 
	<span id="id" style="display: none;">${sessionScope.user.id }</span>
    <table class="board_table">

		
        <thead>
            <tr>
                <th class="num">
                    #
                </th>
                <th class="kind">
                    게시판 유형
                </th>
                <th class="boardname">
                    게시판 제목
                </th>
                <th class="boardwriter">
                    글쓴이
                </th>
                <th class="boardclick">
                    조회수
                </th>
                <th class="boardregi_date">
                    등록일
                </th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="dto" items="${list }">
       
            <tr>
                <td class="body_num">
                   ${dto.no }
                </td>
                <td class="body_kind">
                    ${dto.type }
                </td>
                <td>
                    <a href="${path }/BoardRead.do?no=${dto.no}&page=${pageNum}&keyword=${paging.dto.keyword}&search=${paging.dto.search}">
                      ${dto.subject }
                    </a>
                </td>
                <td class="body_writer">
                     ${dto.writer }
                </td>
                <td class="body_click">
                     ${dto.searchNum }
                </td>
                <td class="body_regidate">
                     ${dto.change_date }
                </td>
            </tr>

        </c:forEach>    
         <c:if test="${fn:length(list) == 0 }">       
        	<tr>
	        	<td colspan="6">
    				내용이 없습니다.
    	    	</td>
        	</tr>
         </c:if>
        </tbody>
    </table>
    
    <button class="newboard" id="newboard" type="button" onclick="">새글 작성</button>
    
    <div class="search">
   	<form name="searchForm" action="${path }/BoardList.do" method="get">
    	<select name="keyword" class="select">
    		<c:if test="${empty paging.dto.keyword}">
	    		<option value="1" selected>선택</option>
	    		<option value="type" >게시판 유형</option>
	    		<option value="subject">게시판 제목</option>
	    		<option value ="writer">글쓴이</option>
	    		<option value ="subject_writer">제목+글쓴이</option>
    		</c:if>
    		<c:if test="${paging.dto.keyword eq 'type' }">
	    		<option value="1">선택</option>
	    		<option value="type" selected>게시판 유형</option>
	    		<option value="subject">게시판 제목</option>
	    		<option value ="writer">글쓴이</option>
	    		<option value ="subject_writer">제목+글쓴이</option>
    		</c:if>
    		<c:if test="${paging.dto.keyword eq 'subject' }">
	    		<option value="1">선택</option>
	    		<option value="type" >게시판 유형</option>
	    		<option value="subject" selected>게시판 제목</option>
	    		<option value ="writer">글쓴이</option>
	    		<option value ="subject_writer">제목+글쓴이</option>
    		</c:if>
    		<c:if test="${paging.dto.keyword eq 'writer' }">
	    		<option value="1">선택</option>
	    		<option value="type" >게시판 유형</option>
	    		<option value="subject">게시판 제목</option>
	    		<option value ="writer" >글쓴이</option>
	    		<option value ="subject_writer">제목+글쓴이</option>
    		</c:if>
    		<c:if test="${paging.dto.keyword eq 'subject_writer' }">
	    		<option value="1">선택</option>
	    		<option value="type" selected>게시판 유형</option>
	    		<option value="subject">게시판 제목</option>
	    		<option value ="writer">글쓴이</option>
	    		<option value ="subject_writer" selected>제목+글쓴이</option>
    		</c:if>
    	
    	</select>
    	<input class="searchBar" type="text" name="search" value="${paging.dto.search }">
    	<button class="searchBtn" type="submit" onclick="">검색</button>
   </form> 
    </div>
    
    <div class="pagingation">
    	<c:if test="${paging.prev }">
	    	<a class="page" href="${path }/BoardList.do?page=${paging.dto.page-1}">[이전]</a>
    	</c:if>	
    	
    	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="num" >
	    
	    	<a class="page" href="${path }/BoardList.do?page=${num}&keyword=${paging.dto.keyword}&search=${paging.dto.search}"<c:out value="${paging.dto.page == num? 'id=active':''}"/> >
	    	${num } 
	    	</a>	
	    	
    	</c:forEach>
    	
    	 <c:if test="${paging.next }">
	    	<a class="page" href="${path }/BoardList.do?page=${paging.finalPage}">[다음]</a>
    	</c:if>	
		
    </div>
    
    
</section>


 	<%@include file="../include/inc_footer.jsp" %>
</body>

<script type="text/javascript">

$(document).ready(function(){
	
	var id = $("#id").text()
	
	if(id == ""){
		$(".board_section").css("display", "none");
		alert("로그인 후 이용해주세요");
		location.href = "Login.do";
	}

	$("#newboard").on("click",function(){
		
		location.href = "${path}/GetBoarder.do";
	
	});
	
});	


</script>
</html>