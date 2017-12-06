<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   
<a href="${pageContext.request.contextPath}/member/findbyid_form.do">회원검색</a>
<br><br>
<%-- 로그인 실패하면 alert 수행후 다시 메인화면이 제공
		로그인 성공하면 아래 로그인폼 대신 
		아이유님 로그인 
		로그아웃 링크 ( 로그아웃 링크를 누르면 다시 로그인 폼이 제공 )
 --%>
<c:choose>
<c:when test="${sessionScope.mvo==null}">
	<form method="post" action="${pageContext.request.contextPath}/login.do">
	아이디 &nbsp;  &nbsp;<input type="text" name="id" size="10"><br>
	패스워드 <input type="password" name="password" size="10"><br>
	  &nbsp;&nbsp;&nbsp;<input type="submit" value="로그인">
	</form>
	<br>
    <a href="${pageContext.request.contextPath}/member/register_form.do">회원가입</a>
</c:when>	
<c:otherwise>
	${sessionScope.mvo.name} 님 로그인 <br><br>
	<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
</c:otherwise>
</c:choose> 















