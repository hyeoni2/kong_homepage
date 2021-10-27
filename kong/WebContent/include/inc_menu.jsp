<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<%@include file="inc_header.jsp" %>
<body>
        <nav>
            <input type="checkbox" id="check">
            <label for="check">
                <i class="fas fa-bars" id="btn"></i>
                <i class="fas fa-times" id="cancel"></i>
            </label>
           		 <img src="${path }/img/nav_logo.png">

            <ul>
                <li><a href="${path }/Index.do">home</a></li>
                <li><a href="${path }/BoardList.do">Board</a></li>
                <li><a href="${path }/About.do">About</a></li>

       	<c:choose>
       		<c:when test="${empty sessionScope.user}">
                <li><a href="${path }/Login.do">Login</a></li>
       		</c:when>
       		<c:otherwise>
                <li>
	                <a href="${path }/View.do">${ sessionScope.user.name}님/</a>
	                <a href="${path }/Logout.do">로그아웃</a>
                </li>
       		</c:otherwise>   
       </c:choose>
            </ul>
        </nav>
</body>
</html>