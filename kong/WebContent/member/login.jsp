<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String referer = request.getHeader("referer"); %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

</head>

<body>
	<%@include file="../include/inc_menu.jsp" %>
	
  
    <img class="wave" src="${path }/img/wave.png" >
    <div class="container">
        <div class="Loginimg">
        	<a href="${path }/Join.do">
            	<img src="${path }/img/login.svg">
            </a>
        </div>
        <div class="login-container">
            <form name="loginForm" method="post">
                <img class="logo" src="${path }/img/logo2.png">
                <h2>Welcome!</h2>
                <div class="input-div user" id="user">
                    <div class="i">
                        <i class="fas fa-user" id="fa-user"></i>
                    </div>
                    <div>
                       	<label for="field_id" id="insert_label" class="label_id">아이디를 입력해주세요</label>
                        <input class="input" id="id" name="id" type="text" >
                    </div>
                </div>
                <div class="input-div password" id="lock">
                    <div class="i">
                        <i class="fas fa-lock"  id="fa-lock"></i>
                    </div>
                    <div>
                         <label for="field_passwd" id="insert_label" class="label_passwd">비밀번호를 입력해주세요</label>
                        <input class="input" name="passwd" type="password" id="passwd">
                    </div>
                </div>
                <a class="forget" href="#">비밀번호를 잊으셨나요?</a>
                <input type="submit" class="btn" value="login" id="login">
                <input type="button" class="btn" value="signup" id="signup">
            </form>
        </div>
    </div>

    	<%@include file="../include/inc_footer.jsp" %>
</body>

<script>
$(document).ready(function(){
	

	//id를 입력하려고 하면 글자가 탑으로(id)
	$("#id").focus(function (){	
		$(this).css("font-size", "18px").css("margin-top","5px");
		$(".label_id").css("top","5px").css("font-size","12px");
		$("#user").css("border-bottom", "2px solid #5A9AF5");
		$("#fa-user").css("color", "#5A9AF5");
	});
	
	$("#id").blur(function(){
		var idVal = $(this).val();
		if(idVal == ""){
			$(this).css("font-size","5px");
			$(".label_id").css("top","17px").css("font-size","18px").css("color" ,"red");
			$("#user").css("border-bottom", "2px solid red");
			$("#fa-user").css("color", "red");
		}else{
			
			$(".label_id").css("font-size","12px").css("top","5px").css("color" ,"#5A9AF5");
			
		}
	});	

	
	//passwd를 입력하려고 하면 글자가 탑으로(id)
	$("#passwd").focus(function (){	
		$(this).css("font-size", "18px").css("margin-top","5px");
		$(".label_passwd").css("top","5px").css("font-size","12px");
		$("#lock").css("border-bottom", "2px solid #5A9AF5");
		$("#fa-lock").css("color", "#5A9AF5");
		
	});
	
	
	$("#passwd").blur(function(){
		var idVal = $(this).val();
		
		if(idVal == ""){
			$(this).css("font-size","5px");
			$(".label_passwd").css("top","17px").css("font-size","18px").css("color" ,"red");
			$("#lock").css("border-bottom", "2px solid red");
			$("#fa-lock").css("color", "red");
		}else{
			$(".label_passwd").css("font-size","12px").css("top","5px").css("color" ,"#5A9AF5");
			
		}
	});	
	
	/*로그인 버튼을 클릭했을 때 유효성 체크  */
	$("#login").on("click",function(){
		
		//id와 비밀번호 값입력
		var id = $("#id").val();
		var passwd = $("#passwd").val();
		
		if(id != "" && passwd != ""){
			$.ajax({
				url: "LoginProc.do",
				type: "POST",
				dataType: "json",
				data : "id="+id+"&passwd="+passwd,
				success : function (data){
					if(data.message == "1"){
						alert("로그인되었습니다.");						
						location.href= "Index.do";					
					}else{
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");
						location.href = "Login.do";						
					}
				},
				error : function () {
					alert("system error");					
				}
				 
			});
		
		}
		
	});
	
	/*가입 버튼을 클릭했을 때 유효성 체크  */
	$("#signup").on("click",function(){
		location.href = "${path}/Join.do";
		
	});
	

	
	
});
</script>
</html>