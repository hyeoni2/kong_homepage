<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세정보</title>
    
<style>

	.join-container{
	    display: flex;
	    align-items: center;
	    text-align: center;
	    height: 100%;
	   	background-image: url("img/security.png"); 
	    background-size: cover;
	    background-position: center;
	    background-repeat : no-repeat;
	    border: none;	   
	}
	
	#confirmForm{
		border: 2px solid #5A9AF5;
		border-radius : 10px;
		padding: 40px;
		box-shadow: 10px 5px 5px #e4e4e4;
		width: 500px;
	}	
	
	.container_s{
	    width: 100vw;
	    height: 80vh;
	    padding: 0 2rem;
	}
	
	form h3{
	    font-size: 3.0rem;
	    text-transform: uppercase;
	    margin: 15px 0;
	    color: #5A9AF5;
	    opacity: 50%;
	    
	}
	
	
	/* input 부분 */
	.info{
	    position: relative;
	   	margin-top : 5px;
	    box-shadow: 10px 5px 5px #e4e4e4;
	    border-radius : 10px;
	    opacity: 50%;
	    width: 100%;
	    height: 30px;
	   	text-align: left;
	}
	
	.info span{
		font-size: 16px;
		margin-left: 15px;
	
	}
	
	

@media  screen and  (max-width : 1000px){
	#confirmForm{
		margin : 0 auto;
		padding: 20px;
		width: 360px;

	}	



@media  screen and  (max-width : 860px){


	#confirmForm{
		margin : 0 auto;
		padding: 30px;
		width: 400px;

	}	
	

	.join-container{
	
		background: none;
	}

}


</style>
    
</head>
<body>

	<%@include file="../include/inc_menu.jsp" %>
  
 <div class="container_s">
        <div class="join-container">
            <form name="confirmForm" id="confirmForm" method="post">
                 <h3>상세정보</h3>    
 					 <div class="info" id="field_id">
                        <span>회원아이디 : ${sessionScope.user.id }</span><br>
                    </div>   
 					 <div class="info" id="field_id">
                        <span>회원이름 : ${sessionScope.user.name }</span><br>
                    </div>   
 					 <div class="info" id="field_id">
                        <span>email : ${sessionScope.user.email }</span>
                    </div>   
 	
 
                    <input type="button" class="btn" id="changePass" value="비밀번호 변경">
                                      
                    <input type="button" class="btn" id="DeleteMember" value="회원탈퇴" >
                    
                    <input type="button" class="btn" id="main" value="돌아가기" >
            
            </form>
        </div>
    </div>
    	<%@include file="../include/inc_footer.jsp" %>
</body>
<script type="text/javascript">
$(document).ready(function(){


	/*패스워드변경 버튼을 클릭했을 때 */
	$("#changePass").on("click",function(){
		location.href = "${path}/ChangePass.do";
	
	});

	/*회원탈퇴 버튼을 클릭했을 때*/
	$("#DeleteMember").on("click",function(){
		location.href = "${path}/DeleteMember.do";
	
	});
	
	/*메인버튼을 클릭했을 때 */
	$("#main").on("click",function(){
		location.href = "${path}/Index.do";
	
	});
		
		
		
	 
	
});
	

 
 </script>

</html>