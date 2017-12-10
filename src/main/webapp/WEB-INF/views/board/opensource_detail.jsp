<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.opensourceLabel {
	float: left;
}
</style>

<script>
/* 	var gfv_count = 1;

	$(document).ready(function() {

		$.ajax({
			type : "post",
			url : "findCategoryList.do",
			dataType : "json",
			success : function(json) {
				var data = "";

				for (var i = 0; i < json.length; i++) {

					data += "<li><a href='#' value='"+json[i].categoryNo+"'>";
					data += json[i].categoryName + "</a></li>";
				}
				$("#categoryDropdown").html(data);
			}//function
		});//ajax

		$.ajax({
			type : "post",
			url : "findFolderList.do",
			dataType : "json",
			success : function(json) {
				var data = "";

				for (var i = 0; i < json.length; i++) {

					data += "<li><a href='#' value='"+json[i].folderNo+"'>";
					data += json[i].folderName + "</a></li>";
				}
				$("#folderDropdown").html(data);
			}//function
		});//ajax

		$("#insertFolderBtn").on("click",function() {
			//$('#layerpop').modal();
			$("#insertFolderForm").submit();
			
		});

		
		$("#categoryDropdown").on("click", "li >a", function() {
			//alert($(this).attr('value'));
			$("#categoryBtn").text($(this).text());
			$("#categoryNo").val($(this).attr('value'));
		});
		$("#folderDropdown").on("click", "li >a", function() {
			//alert($(this).attr('value'));
			$("#folderBtn").text($(this).text());
			$("#folderNo").val($(this).attr('value'));
		});
		$("#list").on("click", function(e) { //목록으로 버튼
			e.preventDefault();
			fn_openBoardList();
		});

		$("#write").on("click", function(e) { //작성하기 버튼
			e.preventDefault();
			fn_insertBoard();
		});

		$("#addFile").on("click", function(e) { //파일 추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});

		$("#writeBtn").click(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력하세요!");
			} else if ($("#content_back").val() == "") {
				alert("기획 배경을 입력해주세요!!");
			} else if ($("#content_detail").val() == "") {
				alert("상세 내용을 입력해주세요!!");
			} else {
				$("#opensouce_register_from").submit();
			}
		});//writeBtn click
	}); */

	function fn_openBoardList() {
		/* var comSubmit = new ComSubmit(); */
		/* comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
		comSubmit.submit(); */
		location.href = "${pageContext.request.contextPath}/board_list.do";
	}

	function fn_insertBoard() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/sample/insertBoard.do' />");
		comSubmit.submit();
	}

	function fn_addFile() {
		var str = "<p><input type='file' name = 'file' id='file_"
				+ (gfv_count++)
				+ "'><a href='#this' class='btn' name='delete'>삭제</a></p>";
		$("#fileDiv").append(str);
		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container">
		<br> <span>
			<h1 class="panel-title pull-center" style="font-size: 30px">

				프로젝트 상세  &nbsp;<span class="glyphicon glyphicon-list-alt"
					aria-hidden="true"></span>
			</h1>
		</span> <br>
		<div class="col-md-6 col-md-offset-3" style="height: 150%">
			<form
				action="${pageContext.request.contextPath}/opensouce_update.do"
				enctype="multipart/form-data" method="post"
				id="opensouce_register_from" align="center">


				<div class="required-field-block" style="float: left">
					<div >
						<button class="btn btn-primary" type="button"
							data-toggle="dropdown" id="categoryBtn">
							${requestScope.bvo.categoryVO.categoryName}
						</button>
						<ul class="dropdown-menu" id="categoryDropdown"></ul>

					</div>

				</div>

				<div class="required-field-block"
					style="float: left; margin-left: 10px;">
					<div >
						<button class="btn btn-primary " type="button"
							data-toggle="dropdown" id="folderBtn">
							${requestScope.bvo.folderVO.folderName} 
						</button>
						<ul class="dropdown-menu" id="folderDropdown"></ul>

					</div>

				</div>
				
				

				<br>
				<div class="required-field-block" style="margin-top: 30px">
					<label class="opensourceLabel">제목 </label> <input type="text"
						placeholder="Title" class="form-control" name="title" id="title" value = "${requestScope.bvo.title}" readonly="readonly">
				</div>


				<br> <label class="opensourceLabel">작성ID</label> <input
					type="text" class="form-control" name="id" id="writerId"
					value="${requestScope.bvo.memberVO.id}" readonly="readonly"> <br>
				<div class="required-field-block">
					<label class="opensourceLabel">기획 배경 </label>
					<textarea rows="10" class="form-control"
						 name="content_back"
						id="content_back" style="resize: none" readonly="readonly">${requestScope.bvo.content_back}</textarea>
				</div>
				<br>


				<div class="required-field-block">
					<label class="opensourceLabel">프로젝트 상세 설명 </label>
					<textarea rows="10" class="form-control"
						 name="content_detail"
						id="content_detail" style="resize: none" readonly="readonly">${requestScope.bvo.content_detail}</textarea>
				</div>
				<br>
				<div id="fileDiv">
					<p>

						<input type="file" style="margin: 0px;" id="file_0" name="file">
					
					</p>
				</div>
				<input type="hidden" id="categoryNo" name="categoryNo" value="">
				<input type="hidden" id="folderNo" name="folderNo" value="">


				
				<button type="button" class="btn btn-success btn-lg btn3d"
					id="writeBtn">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<button type="button" class="btn btn-danger btn-lg btn3d"
					id="resetBtn">
					<span class="glyphicon glyphicon-remove"></span>
				</button>
				
				
				<button type="button" class="btn btn-info btn-lg btn3d"
					id="moveToList" onclick="fn_openBoardList()">
					<span class="glyphicon glyphicon-th-list"></span>
				</button>
			</form>
		</div>
		<br> <br> <br>
	</div>
	<br>
	<br>
	<br>
</body>
</html>