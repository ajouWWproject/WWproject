<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.opensourceLabel{
	float:left;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="container">
<br><br><br><br> 
	<span>
		<h1 class="panel-title pull-center" style="font-size:30px">
			
			프로젝트 등록 &nbsp;&nbsp;&nbsp;
			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		</h1>
	</span> 
	<br><br><br>
	<div class="col-md-6 col-md-offset-3" style="height: 150%">
    <form action="${pageContext.request.contextPath}/opensouce_register.do"  enctype="multipart/form-data" method="post" id="board_register_from" align="center">
        <div class="required-field-block">
        		<label class = "opensourceLabel">제목  </label>
            <input type="text" placeholder="Title" class="form-control" name="title" id="reportTitle">
        </div>
        <br>
     
        	<input type="text" class="form-control" name="writerId" id="writerId" value="${sessionScope.mvo.id}" readonly="readonly">
        	<br>
        <div class="required-field-block">
        		<label class = "opensourceLabel">기획 배경 </label>
            <textarea rows="10" class="form-control" placeholder="기획 배경을 작성해 주세요 " name="content_back" id="content_back" style="resize: none"></textarea>
        </div>
        <br>
        <br>
        
        <div class="required-field-block">
       		<label class = "opensourceLabel">프로젝트 상세 설명  </label>
            <textarea rows="10" class="form-control" placeholder="프로젝트 상세 설명을 작성해 주세요 " name="content_detail" id="content_detail" style="resize: none"></textarea>
        </div>
        <br>
        <button type="button" class="btn btn-success btn-lg btn3d" id="writeBtn"><span class="glyphicon glyphicon-ok"></span></button>
        <button type="button" class="btn btn-danger btn-lg btn3d" id="resetBtn"><span class="glyphicon glyphicon-remove" ></span></button>
    </form>
    </div>
    <br><br><br>
</div>
<br><br><br>
</body>
</html>