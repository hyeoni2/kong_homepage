<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보안확인</title>
    
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

	.security{
		text-align: center;
	}

	.security .simg{
	    width: 80%;
	   	
	}

	#insert_label{
		font-size: 15px;
		position: absolute;
		z-index: 1;
		transition: all .4s cubic-bezier(.25,.8,.25,1);
		transition-duration: 0.3s;
		color: #5A9AF5;
    	font-size: 20px;
    	font-weight : bold;
		left: 10px;
	}
	
	form h3{
	    font-size: 3.0rem;
	    text-transform: uppercase;
	    margin: 15px 0;
	    color: #5A9AF5;
	    opacity: 50%;
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
                 <h3>confirm<br> security</h3>   
                      
                        <input type="hidden" class="input"  name="id" id="id" value="${sessionScope.user.id }"> 
                    <div class="input_field" id="field_passwd">
                        <label for="field_passwd" id="insert_label" class="label_passwd">비밀번호를 입력해주세요</label>
                        <input type="password" class="input"  name="passwd" id="passwd"> 
                    </div>     
 
                    <input type="submit" class="btn" id="confirm" value="confirm" onclick="confirm();">
            </form>
        </div>
    </div>
    	<%@include file="../include/inc_footer.jsp" %>
</body>
<script type="text/javascript">
$(document).ready(function(){

	
	//passwd를 입력하려고 하면 글자가 탑으로(name)
	$("#passwd").focus(function(){
		$(this).css("font-size", "18px").css("margin-top","5px");;
		$(".label_passwd").css("top","5px").css("font-size","12px");
	});
	$("#passwd").blur(function(){
		var idVal = $(this).val();
		if(idVal == ""){
			$(this).css("font-size","5px");
			$(".label_passwd").css("top","17px").css("font-size","18px");
		}
	});	
		
		
	/* passwd값 없으면 error메세지 뜨게하기  */
	$("#passwd").on("blur",function(){
		
		var inputVal = $(this).val();
		
		if(inputVal ==""){
			$(this).next().css("display","block").css("color","red");
			$(this).parent().css({"margin-bottom": "30px","border":"1px solid red"});	
			$(this).prev().css("color","red");
		}else{
			 $(this).next().css("display","none");
			 $(this).parent().css("margin-bottom", "30px");	
			 $(this).parent().css({"margin-bottom": "30px","border":"1px solid #5A9AF5"});	
			 $(this).prev().css("color","#5A9AF5");
		}		
	});	 
	
	
	/*보안 버튼을 클릭했을 때 유효성 체크  */
	$("#confirm").on("click",function(){
		
		var id = $("#id").val();
		var idVal = $.trim(id);
		//id와 비밀번호 값입력
		var passwd = $("#passwd").val();
		var passwdVal = $.trim(passwd);
		
		if(passwd != ""){
			$.ajax({
				url: "${path}/passwdCheck.do",
				type: "POST",
				dataType: "json",
				data : "id="+idVal+"&passwd="+passwdVal,
				success : function (data){
					if(data.message == "1"){
						location.href= "${path}/Update.do";					
					}else{
						alert("비밀번호가 일치하지 않습니다.");
					}
				},
				error : function () {
					alert("system error");					
				}
				 
			});
		
		}
		
	});
		

	
});
	

 
 </script>

</html>