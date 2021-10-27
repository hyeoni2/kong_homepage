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
            <form name="changePassForm" id="changePassForm" method="post" action="${path }/ChangePassProc.do">
                 <h3>change<br>password</h3>   
                      <input type="hidden" name="id" id="id" value="${sessionScope.user.id }">
                    <div class="input_field" id="field_passwd">
                        <label for="field_passwd" id="insert_label" class="label_passwd">비밀번호를 입력해주세요</label>
                        <input type="password" class="input"  name="passwd" id="passwd"> 
                    </div>     
                    <div class="input_field" id="field_newpasswd">
                        <label for="field_passwd" id="insert_label" class="label_newpasswd">새로운비밀번호를 입력해주세요</label>
                        <input type="password" class="input"  name="newpasswd" id="newpasswd"> 
                    </div>     
 
                    <input type="submit" class="btn" id="change" value="change" >
           			 <input type="button" class="btn" id="main" value="돌아가기" >
            </form>
        </div>
    </div>
    	<%@include file="../include/inc_footer.jsp" %>
</body>
<script type="text/javascript">
$(document).ready(function(){

	
	//passwd를 입력하려고 하면 글자가 탑으로(name)
	$("#passwd").focus(function(){
		$(this).css("font-size", "15px").css("margin-top","5px");;
		$(".label_passwd").css("top","5px").css("font-size","12px");
	});
	$("#passwd").blur(function(){
		var idVal = $(this).val();
		if(idVal == ""){
			$(this).css("font-size","5px");
			$(".label_passwd").css("top","17px").css("font-size","15px");
		}
	});	

	//passwd를 입력하려고 하면 글자가 탑으로(name)
	$("#newpasswd").focus(function(){
		$(this).css("font-size", "15px").css("margin-top","5px");;
		$(".label_newpasswd").css("top","5px").css("font-size","12px");
	});
	$("#passwd").blur(function(){
		var idVal = $(this).val();
		if(idVal == ""){
			$(this).css("font-size","5px");
			$(".label_newpasswd").css("top","17px").css("font-size","15px");
		}
	});	
		
		
	/* passwd값 없으면 error메세지 뜨게하기  */
	$("#passwd").on("blur",function(){
		
		var inputVal = $(this).val();
		
		if(inputVal ==""){
			$(this).next().css("display","block").css("color","red");
			$(this).parent().css({"margin-bottom": "30px","border":"1px solid red"});	
			$(this).prev().css("color","red");
			$(this).select();
		}else{
			 $(this).next().css("display","none");
			 $(this).parent().css("margin-bottom", "30px");	
			 $(this).parent().css({"margin-bottom": "30px","border":"1px solid #5A9AF5"});	
			 $(this).prev().css("color","#5A9AF5");
		}		
	});	 
	
	//비밀번호 정규식 체크	
	$("#newpasswd").blur(function () {
		
		var noTrimpw = $("#passwd").val();
		var pw = $.trim(noTrimpw);
	
		var noTrinewmpw = $("#newpasswd").val();
		var newpw = $.trim(noTrinewmpw);
		//숫자포함 8~20개
		var regpw = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
		
		//비밀번호가 맞지않으면
			if(!regpw.test(newpw)){
				$(this).css("color", "red");
				$("#field_newpasswd").css("border", "1px solid red");
				$(".label_newpasswd").text("숫자포함하여 8~20자내로 입력해주세요").css("display", "block").css("color", "red").css("font-size", "15px");
				$("#newpasswd").select();
				$("#newpasswd").focus();
				$("#change").attr("disabled", true);
			}else{
				
				if(pw != newpw){
					$(this).css("color", "#5A9AF5");
					$(".label_newpasswd").text("사용가능한 비밀번호 입니다").css("color", "#5A9AF5").css("font-size", "15px");
					$("#field_newpasswd").css("border", "1px solid #5A9AF5");
					$("#change").attr("disabled", false);
				}else{
					$(this).css("color", "red");
					$("#field_newpasswd").css("border", "1px solid red");
					$(".label_newpasswd").text("중복된 비밀번호는 사용할 수 없습니다.").css("display", "block").css("color", "red").css("font-size", "15px");
					$("#newpasswd").select();
					$("#newpasswd").focus();
					$("#change").attr("disabled", true);
				}
			}	
		
		});
	
	/*메인버튼을 클릭했을 때 */
	$("#main").on("click",function(){
		
		history.back(-1);
	
	});
	
	
	/*보안 버튼을 클릭했을 때 유효성 체크  */
	$("#change").on("click",function(){
		
		//id와 비밀번호 값입력
		var id = $("#id").val();
		var idVal = $.trim(id);
		
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
						changePassForm.submit();					
					}else{
						alert("비밀번호가 일치하지 않습니다.");
						location.href = "${path}/ChangePass.do";
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