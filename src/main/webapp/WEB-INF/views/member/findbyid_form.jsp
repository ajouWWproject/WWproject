<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- findbyid_form.jsp -->
<form action="${pageContext.request.contextPath}/findMemberById.do">
ID <input type="text" name="id">
<input type="submit" value="검색">	
</form>
<!-- 
		findbyid_result.jsp 에서 검색결과를 보여준다
 -->