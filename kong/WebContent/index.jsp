<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="include/inc_menu.jsp" %>
<section>
       
        <div class="content_index">
            <div class="textBox">
                <h2>MVC2 방식으로 만든 홈페이지</h2>
               	<p style="text-align: right; opacity: 50%;"> Project Made by Suhyeon
                <p>보여지는 홈페이지는 Servlet을 이용한 Controller<br> 
                    jstl을 이용한 JSP파일<br> 
                    javascript를 이용한 버튼 효과<br> 
                    Css를 이용한 디자인 기법을 활용하여 제작하였습니다.<br>
                    그 외에 적용된 자세한 내용은 더보기를 클릭해주세요.
                </p>
                    <a href="#">더보기</a>
		      
		        <div class="tumb_index">
			        <ul class="thumb">
			            <li><img class="m" src="${path }/img/m.png" onclick="imgSlider('1','img/Code_thinking.svg')"></li>
			            <li><img class="v" src="${path }/img/v.png" onclick="imgSlider('2','img/Responsive.svg')"></li>
			            <li><img class="c" src="${path }/img/c.png" onclick="imgSlider('3','img/java.svg')"></li>
			        </ul>
		    	</div>
           	 </div>
	            
	            <div class="imgBox">
	                <img src="${path }/img/logo.png" class="img" style="width: 600px;">
	            </div>     
        </div>
        
        
    </section>

 	
    <script type="text/javascript">

        function imgSlider(color , anything){
            document.querySelector('.img').src = anything;
     
            if(color == '1'){
               $(".m").attr("src", "img/changeM.png");
               $(".v").attr("src", "img/v.png");
               $(".c").attr("src", "img/c.png");
            }else if(color == '2'){
               $(".m").attr("src", "img/m.png");
               $(".v").attr("src", "img/changeV.png");
               $(".c").attr("src", "img/c.png");
            }else{
               $(".m").attr("src", "img/m.png");
               $(".v").attr("src", "img/v.png");
               $(".c").attr("src", "img/changeC.png");
            }
      

        }
    </script>
 	<%@include file="include/inc_footer.jsp" %>
</body>
</html>