<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	//session에서 id 받아오기
	String id=(String)session.getAttribute("id");
%>
<div class="row nav navbar-inverse" style="margin:0px;">
	<div class="col-xs-3">
		<a href="${pageContext.request.contextPath }/home.do" class="navbar-brand">UNDEFINED</a>
	</div>
	<div class="col-xs-4">
		<ul class="nav navbar-nav">
			<%-- 각 페이지의 파라메터를 통해 navbar에 active 시키는 기능 --%>
			<li <c:if test="${param.active eq 'home' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/home.do">HOME</a></li>
			<li <c:if test="${param.active eq 'board' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/board/list.do">게시판</a></li>
			<li <c:if test="${param.active eq 'archive' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/archive/list.do">사진첩</a></li>
			<li <c:if test="${param.active eq 'vistor' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/visitor/visitors.do">방명록</a></li>
			<%-- 아이디가 admin 여부에 따라 보이는 기능 --%>
			<li <c:if test="${id ne 'admin'}">style="display:none;"</c:if> id="navbarAdmin" <c:if test="${param.active eq 'admin' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/admin/list.do">관리페이지</a></li>
		</ul>
	</div>
	<div class="col-xs-5 pull-right">
		<ul class="nav navbar-nav pull-right" style="margin-right: 50px;">
			<%-- 아이디가 null인 경우 info와 로그아웃 탭을 안보이게 하는 기능 --%>
			<li <c:if test="${empty id }">style="display:none;"</c:if>
				id="navbarId"
				<c:if test="${param.active eq 'info' }">class="active"</c:if>><a
				href="${pageContext.request.contextPath }/users/private/info.do">${id }님
					로그인중..</a></li>
			<li <c:if test="${empty id }">style="display:none;"</c:if>
				id="navbarSignout"><a
				href="${pageContext.request.contextPath }/users/signout.do">로그아웃</a></li>
			<%-- 아이디가 null이 아닌경우 로그인과 회원가입이 안보이게 하는 기능 --%>
			<li <c:if test="${not empty id }">style="display:none;"</c:if>
				id="navbarSignin">
				<form action="${pageContext.request.contextPath }/users/signin.do" method="post" id="navSignIn" class="form-group" style="margin-top:10px;">
					<input type="hidden" name="uri" value="${pageContext.request.requestURI }"/>
					<input type="password" name="pwd" placeholder="비밀번호" id="navSigninPwd" style="width: 100px" class="form-control pull-right"/>
					<input type="text" name="id" placeholder="아이디" id="navSigninId" style="width: 100px; margin-right: 3px;" class="form-control pull-right"/>
				</form>			
			</li>
			<li <c:if test="${not empty id }">style="display:none;"</c:if>
				id="navbarSignin">
				<a class="btn" onclick="document.getElementById('navSignIn').submit();">LOGIN</a>
			</li>			
			<li <c:if test="${not empty id }">style="display:none;"</c:if>
				id="navbarSignup"
				<c:if test="${param.active eq 'signUp' }">class="active"</c:if>>
				<a href="${pageContext.request.contextPath }/users/signup.do?uri=${curUri }" class="btn" >회원가입</a>
			</li>
		</ul>
	</div>
</div>
<script>
	//아이디 입력란에 keyup 이벤트가 발생했을때 실행할 함수 등록 
	$("#signupid").on(
			"keyup",
			function() {
				//입력한 아이디 읽어오기
				var inputId = $("#signupid").val();
				//ajax 요청을 이용해서 서버에 전송
				$.ajax({
					url : "${pageContext.request.contextPath}/WEB-INF/users/checkid.do",
					method : "get",
					data : {
						inputId : inputId
					},
					//아이디 중복시 버튼을 막고 display를 통해 가입 가능여부를 유저에게 알려준다.
					success : function(data) {
						$("#signupid").parent().removeClass(
								"has-success has-error");
						if (data.canUse) {
							$("#signupid").parent().addClass("has-success")
									.find(".help-block").hide().parent().find(
											".glyphicon").removeClass(
											"glyphicon-remove").addClass(
											"glyphicon-ok");
							$("#navinsertBtn").attr("disabled", null);
						} else {
							$("#signupid").parent().addClass("has-error").find(
									".help-block").show().parent().find(
									".glyphicon").removeClass("glyphicon-ok")
									.addClass("glyphicon-remove");
							$("#navinsertBtn").attr("disabled", "disabled");
						}
					}
				});
			});
</script>
