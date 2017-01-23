<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface|Caveat" rel="stylesheet">
<style>
	.welcomeblock{
		display: table;
		width: 100% ;
		height: 800px;
		background-color: #28274b;
	}
	.welcometext{
		display: table-cell;
		vertical-align:middle;
		text-align: center;
		color: #e2583e;
		font-size: 100px;
		font-style: bold;
		font-family: 'Abril Fatface', cursive;		
	}
</style>
<title>WELCOME to Undefined</title>
<jsp:include page="ui/myResource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="ui/navbar.jsp">
	<jsp:param value="home" name="active"/>
</jsp:include>
	<div class="welcomeblock">
	<%-- 배경을 접속하면 Hello 아이디로 지정 --%>
		<c:choose>
			<c:when test="${empty id }">
				<p class="welcometext">Hello, Stranger!</p>
			</c:when>
			<c:otherwise>
				<p class="welcometext">Hello, <strong>${id }</strong> :)</p>
			</c:otherwise>
		</c:choose>	
	</div>
<jsp:include page="ui/footer.jsp"></jsp:include>	
</body>
</html>