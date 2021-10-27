<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>Insert title here</title>

	<%@include file="../include/inc_menu.jsp" %>
	<script type="text/javascript" src="${path}/js/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script src="${path }/js/jQuery.MultiFile.min.js" type="text/javascript" language="javascript"> </script>
</head>

<style>
	.get_board_section{
		width: 100vw;
		padding: 40px;
		display: grid;
		left : 10%;
	}
	
	.get_board_section h2{
		margin-left: 10px;
		color: #5A9AF5;
		font-size: 50px;
	}
	
	#h2{
		width: 80vw;
		border-bottom: 2px solid #e4e4e4;
		margin-bottom: 20px;
	}	
	
	.board_table{
		width: 80vw;
		height: 30vh;
	
		
	}

	th{
		text-align: center;
		width: 120px;
		border: 1px solid #e4e4e4;
		margin-left: 10px;
		background-color: #e9f1fc;
	}
	
	td{
		border: 1px solid #e4e4e4;
		padding: 10px;
	}
	
	input{
		width: 100%;
	}
	
	.getBtn{
		width: 60px;
		height: 30px;
		background: #5A9AF5;
		border-radius : 20px;
		border: none;
		color: white;
		margin-left: 20px;	
		margin-top: 1%;
	}
	
	#register_btn{
		margin-left: 50%;
	}
	
	#content{
		width: 100%;
	}
	
	.thumb {
    width: 100px;
    height: 100px;
    margin: 0.2em -0.7em 0 0;
	}
	
	#cancel_btn{
		position : absolute;
		margin-bottom : 50px;
		margin-right : 10px;
	}
	
	
</style>

<body>

    <section class="get_board_section"> 
    	<div id="h2">    	
    		<h2>게시글 작성</h2>
    	</div>
      <form id="register" name="registerForm" method="post" action="${path }/GetBorderArg.do" enctype="multipart/form-data"> 
       
        <table class="board_table">
 			<thead>
                <tr>
                    <th>게시판 유형</th>
                    <td>
                        <select name="type">
                            <option value="공지사항">공지사항</option>
                            <option value="Java">Java</option>
                            <option value="Java Script">Java Script</option>
                            <option value="Ajax">Ajax</option>
                            <option value="My Batis">My Batis</option>
                            <option value="Oracle">Oracle</option>
                            <option value="Spring">Spring</option>
                            <option value="Jquery">Jquery</option>
                            <option value="Html">Html</option>
                            <option value="Css">Css</option>
                            <option value="Security">Security</option>
                            <option value="Tomcat">Tomcat</option>
                            <option value="Maven">Maven</option>
                            <option value="Git-hub">Git-hub</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>글쓴이</th>
                    <td>
                        ${sessionScope.user.id }
                        <input type="hidden" name="writer" id= "writer" value="${sessionScope.user.id }" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <th>게시판 제목</th>
                    <td>
                        <input type="text" name="subject" id="subject">
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                        <input type="file"  name="board_img" id="board_img" accept="image/*">
						<div class="img_container" id="img_container" >
						     
							
						</div>
                    </td>
                </tr>
		</thead>
         <tbody>
                <tr>
                    <th>내용</th>                    
                    <td>
                    	<textarea rows="30" cols="180" id="content" name="content">           
                    		
                    	</textarea>
                    </td>
                    
                </tr> 
         </tbody>
                <tr>
                    <td colspan="2">
                    	<button type="submit" class="getBtn" id="register_btn">등록</button>
                    	<button type="button" class="getBtn" id="list_btn">목록</button>
                    </td>
                </tr> 
        </table>
	</form>

        
    </section>

	<script type="text/javascript">
		var oEditors = [];
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI:"${path}/js/smartEditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});

		
	</script>
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
		
	
	   $("input[type='file']").change(function(e){
	
	      //div 내용 비워주기
	      $('#img_container').empty();
	
	      var files = e.target.files;
	      var arr =Array.prototype.slice.call(files);
	      
	      //업로드 가능 파일인지 체크
	      for(var i=0;i<files.length;i++){
	        if(!checkExtension(files[i].name,files[i].size)){
	          return false;
	        }
	      }
	      
	      preview(arr);
	     
	     
	  	});
		  
		  
	    function checkExtension(fileName,fileSize){

	      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	      var maxSize = 20971520;  //20MB
	      
	      if(fileSize >= maxSize){
	        alert('파일 사이즈 초과');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      
	      if(regex.test(fileName)){
	        alert('업로드 불가능한 파일이 있습니다.');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      return true;
	    }
		    
	    
	    function preview(arr){
	      arr.forEach(function(f){
	        
	        //파일명이 길면 파일명...으로 처리
	        var fileName = f.name;
	        if(fileName.length > 10){
	          fileName = fileName.substring(0,7)+"...";
	        }
	        
	        //div에 이미지 추가
	        var str = '<div style="display: inline-flex; padding: 10px;"><li style="list-style: none;">';
	        str += '<span id ="fileName">'+fileName+'</span><br>';
	        
	        //이미지 파일 미리보기
	        if(f.type.match('image.*')){
	          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	            
	        	str += '<img id= "img_file" src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
	            str += '<button type="button" id="cancel_btn" value="x">x</button>';
	            str += '</li></div>';
	            $(str).appendTo('#img_container');
	            
	        	//취소버튼
	        	$("#cancel_btn").on("click",function(){
	        		
	        		$("#img_file").remove();
	        		$("#board_img").val("");
	        		$("#fileName").text("");
	        		$("#cancel_btn").css("display", "none");
	        	
	        	});
	        	/* 취소 종료 */
	          } 
	          reader.readAsDataURL(f);
	        }else{
	          str += '<img id= "img_file" src="${path}/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
	          $(str).appendTo('#img_container');
	        }
	      });//arr.forEach
	    }
	    


	
	
	$("#register_btn").on("click",function(){

		//스마트에디터로 content부분 값 넘겨 받는 부분
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
		$("#register").submit();
	
	});
	
	
	
	//목록으로
	$("#list_btn").on("click",function(){
		
		location.href = "${path}/BoardList.do";
	
	});
	

	
	

	
});	


</script>

</html>