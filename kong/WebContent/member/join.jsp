<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    
<style>

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

	.join img{
	    width: 90%;
	    margin-top : 10%;
	    opacity: 80%;
	}

@media screen and (max-width : 1000px){

	form h3{
    	padding-left: 15px;
    	
	}
	
	.join img{
	    width: 100%;
	   	margin-top : 50%;

	}

}


</style>
    
</head>
<body>

	<%@include file="../include/inc_menu.jsp" %>
  
 <div class="container">
        <div class="join">
            <a href="${path }/Login.do">
                 <img class="logo" src="${path }/img/logo2.png">
            </a>
        </div>
        <div class="join-container">
            <form name="joinForm" id="joinForm" action="${path }/JoinProc.do" method="post">
                 <h3>join<br> member</h3>   
                    <div class="input_field" id="field_id">
                        <label for="field_id" id="insert_label" class="label_id">아이디를 입력해주세요</label>
                        <input type="text" class="input"  name="id" id="id" > 
                    </div>     
                    <div class="input_field" id="field_name">
                        <label for="field_name" id="insert_label" class="label_name">이름을 입력해주세요</label>
                        <input type="text" class="input"  name="name" id="name"> 
                    </div>     
                    <div class="input_field" id="field_email">
                        <label for="field_email" id="insert_label" class="label_email">이메일을 입력해주세요</label>
                        <input type="text" class="input"  name="email" id="email"> 
                    </div>     
                    <div class="input_field" id="field_passwd">
                        <label for="field_passwd" id="insert_label" class="label_passwd">비밀번호를 입력해주세요</label>
                        <input type="password" class="input"  name="passwd" id="passwd"> 
                    </div>     
                    <div class="input_field" id="field_passwdCk">
                        <label for="field_passwdCk" id="insert_label" class="label_passwdCk">비밀번호확인을 입력해주세요</label>
                        <input type="password" class="input"  name="passwdCk" id="passwdCk"> 
                    </div>     
                    <input type="button" onclick="join();" class="btn" id="signup" value="sign up">
            </form>
        </div>
    </div>
    	<%@include file="../include/inc_footer.jsp" %>
</body>
<script type="text/javascript">
$(document).ready(function(){

	//id를 입력하려고 하면 글자가 탑으로(id)
	$("#id").focus(function (){
		
		$(this).css("font-size", "18px").css("margin-top","5px");
		$(".label_id").css("top","5px").css("font-size","12px");
	});
	$("#id").blur(function(){
		var idVal = $(this).val();
		if(idVal == ""){
			$(this).css("font-size","5px");
			$(".label_id").css("top","17px").css("font-size","18px");
		}
	});	

	//name을 입력하려고 하면 글자가 탑으로(name)
	$("#name").focus(function(){
		$(this).css("font-size", "18px").css("margin-top","5px");;
		$(".label_name").css("top","5px").css("font-size","12px");
	});
	$("#name").blur(function(){
		var idVal = $(this).val();
		if(idVal == ""){
			$(this).css("font-size","5px");
			$(".label_name").css("top","17px").css("font-size","18px");
		}
	});	
	
	
	//email을 입력하려고 하면 글자가 탑으로(email)
	$("#email").focus(function(){
		$(this).css("font-size", "18px").css("margin-top","5px");;
		$(".label_email").css("top","5px").css("font-size","12px");
	});
	$("#email").blur(function(){
		var idVal = $(this).val();
		if(idVal == ""){
			$(this).css("font-size","5px").css("margin-top","5px");;
			$(".label_email").css("top","17px").css("font-size","18px");
		}
	});	
	
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
	
	//passwdCk를 입력하려고 하면 글자가 탑으로(name)
	$("#passwdCk").focus(function(){
		$(this).css("font-size", "18px").css("margin-top","5px");;
		$(".label_passwdCk").css("top","5px").css("font-size","12px");
	});
	$("#passwdCk").blur(function(){
		var idVal = $(this).val();
		if(idVal == ""){
			$(this).css("font-size","5px");
			$(".label_passwdCk").css("top","17px").css("font-size","18px");
		}
	});	
	
	//아이디 중복체크
	$("#id").blur(
		function() {
			var id = $(this).val();
			var idval = $.trim(id);
			//영문자로 시작 숫자포함 6~20
			var regid = /^[a-z]+[a-z0-9]{5,19}$/;
			
			if(!regid.test(id)){
			$(this).css("color", "red");
			$("#field_id").css("border", "1px solid red");
			$(".label_id").text("영문자 및 숫자 6~20자내로 입력해주세요").css("display", "block").css("color", "red");
			$("#id").select();
			$("#id").focus();
			}else if(idval != ""){
				$.ajax({
					url : "${path}/idCheck.do",
					type : "POST",
					dataType : "json",
					data : "id=" + id ,
					success : function(data) {
						if (data.message == 1) {
							$(".label_id").text("사용가능한 아이디입니다 ").css("display","block").css("color", "#5A9AF5");
							$("#field_id").css("border", "1px solid #5A9AF5");
							$("#id").css("color", "#5A9AF5");
						} else if (data.message == -1) {
							$(".label_id").text("이미사용중인 아이디입니다").css("display", "block").css("color", "red");				
							$("#field_id").css("border", "1px solid red");
							$("#id").select();
						}
					},
					error : function() {
						alert("System Error");
					}
				});	
			}	
			
		});//blur 끝	
		
			
	//비밀번호 정규식 체크	
	$("#passwd").blur(function () {
		
		var noTrimpw = $("#passwd").val();
		var pw = $.trim(noTrimpw);
		//숫자포함 8~20개
		var regpw = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
		
		//비밀번호가 맞지않으면
			if(!regpw.test(pw)){
				$(this).css("color", "red");
				$("#field_passwd").css("border", "1px solid red");
				$(".label_passwd").text("숫자포함하여 8~20자내로 입력해주세요").css("display", "block").css("color", "red");
				$("#passwd").select();
				$("#passwd").focus();
			}else{
				$(this).css("color", "#5A9AF5");
				$(".label_passwd").text("사용가능한 비밀번호 입니다").css("color", "#5A9AF5");
				$("#field_passwd").css("border", "1px solid #5A9AF5");
			}
		});		


	//이메일 정규식 체크	
	$("#email").blur(function () {
		
		var email = $("#email").val();
		var emailVal = $.trim(email);
		//이메일 정규식체크
		var regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
			//
			if(!regemail.test(emailVal)){
				$(this).css("color", "red");
				$("#field_email").css("border", "1px solid red");
				$(".label_email").text("이메일 형식이 올바르지 않습니다.").css("display", "block").css("color", "red");
				$("#email").select();
				$("#email").focus();
			}else if(emailVal != ""){
				$.ajax({
					url  : "emailCheck.do",
					type : "POST",
					dataType : "json",
					data : "email="+emailVal,
					success: function (data) {
						if(data.message == 1){							
							$("#email").css("color", "#5A9AF5");
							$(".label_email").text("사용가능한 이메일입니다.").css("color", "#5A9AF5");
							$("#field_email").css("border", "1px solid #5A9AF5");
						}else if (data.message == -1) {
							$(".label_email").text("이미사용중인 이메일입니다").css("display", "block").css("color", "red");				
							$("#field_email").css("border", "1px solid red");
							$("#email").select();
						}
					},
					error : function () {
						alert("System Error");
						
					}
				})
				
			}else{
				$(this).css("color", "#5A9AF5");
				$(".label_email").text("사용가능한 이메일입니다.").css("color", "#5A9AF5");
				$("#field_email").css("border", "1px solid #5A9AF5");
			}
		});
	
		
	$("#passwdCk").blur(function () {	
		
		var passwd = $("#passwd").val();
		var passwdCk = $("#passwdCk").val();
		if(passwd != "" && passwdCk != ""){
			if(passwd == passwdCk){
				$(this).css("color", "#5A9AF5");
				$(".label_passwdCk").text("비밀번호가 일치합니다").css("color", "#5A9AF5");
				$("#field_passwdCk").css("border", "1px solid #5A9AF5");
			}else{
				$(this).css("color", "red");
				$(this).select();
				$(this).focus();
				$("#field_passwdCk").css("border", "1px solid red");
				$(".label_passwdCk").text("비밀번호가 일치하지 않습니다.").css("display", "block").css("color", "red");
				
			}
		}
	});
		
		
	
	/* name값 없으면 error메세지 뜨게하기  */
	$("#name").on("blur",function(){
		
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
	 
	
	/*signup 버튼을 클릭했을 때 유효성 체크  */
	$("#signup").on("click",function(){
		/*input의 id와 pw값을 입력. */
		var val1 = $("#id").val();
		var val2 = $("#name").val();
		var val3 = $("#email").val();
		var val4 = $("#passwd").val();
		var val5 = $("#passwdCk").val();
			    	
		if(val1 !="" && val2 !="" && val3 !=""  && val4 != "" && val5 != ""){
			  $("#joinForm").submit(); 	
			 }else{
				 if(val1 == ""){				 
					alert("아이디를 입력해주세요");
				 }else if(val2 == ""){
					 alert("이름을 입력해주세요");
				 }else if(val3 == ""){
					 alert("이메일을 입력해주세요");
				 }else if(val4 == ""){
					 alert("비밀번호를 확인해주세요");
				 }
				 
			 }	 
	 
			  	return false;	
		});
	
	});
	

 
 </script>

</html>