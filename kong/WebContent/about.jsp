<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<%@include file="include/inc_menu.jsp" %>
	
    <div class="card_container">
       	
		<div id="slider" class="owl-carousel">
           
            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/java.png" alt=""></div>
                    <h2>java</h2>
                    <p>
                    	프로젝트는 'Java'라는 언어를 기반으로 제작하였고, 
                    	모든 작업은 Controller를 거쳐서 Action에서 받아서 처리하였다.
                    	DTO의 getter를 이용하여서 실행할 sql문에 필요한 데이터를
                    	만들어 DAO에 보내고, 보낸 DAO에서 실행된 결과값을 DTO에 있는 
                    	setter에 저장하여서 화면에 적용하였다.
                    </p>  
               	 </div>
            </div>

            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/javascript.png" alt=""></div>
                    <h2>java script</h2>
                    <p>
                    	Controller에서 Action단으로 넘어가서 DAO로 전송한 전송값을 얻었을 때,
                    	성공하게 되면 전달되는 값과 함께 location.href를 이용하여서
                    	다시 Controller를 거쳐서 전달하였고, 실패하게 되면 경고메세지와 함께
                    	다시 그 전의 단계로 돌아갈 수 있도록 적용하였다.
					</p>  
               	 </div>
            </div>
           
            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/ajax2.png" alt=""></div>
                    <h2>ajax</h2>
                    <p>
						회원가입을 할 시에 중복되는 값에 대한 검사나, 
						유효성에 관한 검사를 하기 위한 자료를
						POST형식으로 Controller로 전송하여서 결과에 대한 값을
						새로고침하지 않고 화면에 바로 나타낼 수 있도록
						적용하였다.
						
                    </p>  
               	 </div>
            </div>

            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/mybatis.png" alt=""></div>
                    <h2>my batis</h2>
                    <p>
                    	Model2방식으로 사용하던 DAO방식에서 SQL문을 분리시켜서 XML로
                    	저장하였고, 해당 Parameter의 값과 ResultType에 대한 결과 값을
                    	이용하여서 '?'의 값을 setter를 이용해서 받아오는 방식에서 DTO안에 변수를
                    	이용하여서 해당 값을 받아서 DAO로 전송하는 방식으로 적용하였다.
					</p>  
               	 </div>
            </div>

            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/oracle.png" alt=""></div>
                    <h2>oracle</h2>
                    <p>
                    	member와 board와 reply테이블의 전반적인 형태를
                    	설계하였으며, 해당 테이블들에 필요한 시퀀스를
                    	부여하고, Primary Key를 이용하여서 중복을 방지하였다.
                    </p>  
               	 </div>
            </div>
            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/jquery.png" alt=""></div>
                    <h2>jquery</h2>
                    <p>
                    	해당 jsp에서 input라인에 focus를 주었을 때와 blur를 주었을 때를
                    	구분하기 위해서 id를 부여하고 해당 아이디에 관련된 함수를 
                    	불러와서 css의 변화를 적용하였다.
                    </p>  
               	 </div>
            </div>

            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/html.png" alt=""></div>
                    <h2>html</h2>
                    <p>
                    	html5를 이용하여서 해당 jsp의 모든 메뉴부분, 
                    	footer, index, member, board, about을 디자인하고
                    	구성하였다.
                    </p>  
               	 </div>
            </div>

            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/css.png" alt=""></div>
                    <h2>css</h2>
                    <p>
                    	구성한 html에 스타일을 주어서 버튼의 색, 사이즈나
                    	글자의 색, 사이즈를 적용하고 반응형으로 변환할 수 있도록
                    	@media태그를 이용하여서 크기에 따른 변화를 적용하였다. 
					</p>  
               	 </div>
            </div>

            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/securityicon.png" alt=""></div>
                    <h2>security</h2>
                    <p>
                    	해당 member테이블 안에 데이터가 있는 사람만
                    	로그인이 가능하도록 설정하고 board테이블은
                    	sessionScope에 id가 없는 즉 로그인이 되지 않은 상태에서는
                    	접근할 수 없도록 경고 메세지와 함께 로그인을 하도록
                    	로그인 컨트롤러로 이동시키는 작업을 적용하였다.
					</p>  
               	 </div>
            </div>

            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/tomcat.png" alt=""></div>
                    <h2>tomcat</h2>
                    <p>
                    	WAS는 톰캣을 적용하였으며, 톰캣의 패스를 설정하여서 
                    	이미지, CSS, JS의 경로를 path로 간략화 시켜서 앞의
                    	경로를 제외하고 img/.jpg, css/.css, js/.js로 설정하였다.
					</p>  
               	 </div>
            </div>

            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/maven.png" alt=""></div>
                    <h2>maven</h2>
                    <p>
                    	대부분의 jar파일들은 maven 프로젝트 안에 있는 pom.xml에
                    	추가하여서 빌드시켜서 이용하였다.	
                    </p>  
               	 </div>
            </div>

            <div class="content-area">       
                <div class="card_content">            
                    <div class="img-area"><img src="img/about/github.png" alt=""></div>
                    <h2>git-hub</h2>
                    <p>
                    	해당 프로젝트는 깃허브를 이용하여서 프로젝트 버전을 관리하였다.
					</p>  
               	 </div>
            </div>
            
        </div>         
    </div>
    
 	<%@include file="include/inc_footer.jsp" %>
</body>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
    <script>

        $('#slider').owlCarousel({
            loop: true,
            margin: 90,
            nav: false,
            autoplay:true,
            responsive:{
                0:{
                    items:1,
                    
                },
                600:{
                    items:3,
                    margin: 30,
                },
                1000:{
                    items:4,
                    margin: 50
                }
            }
        })

    </script>
</html>

