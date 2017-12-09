<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	var gfv_count = 1;

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

		$("#insertFolderForm").on("click",function() {
			//$('#layerpop').modal();
			alert("추가!!");
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
				alert("기획 배경을 입력해주세요!!");
			} else {
				$("#opensouce_register_from").submit();
			}
		});//writeBtn click
	});

	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
		comSubmit.submit();
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

				프로젝트 등록 &nbsp;&nbsp;&nbsp; <span class="glyphicon glyphicon-pencil"
					aria-hidden="true"></span>
			</h1>
		</span> <br>
		<div class="col-md-6 col-md-offset-3" style="height: 150%">
			<form
				action="${pageContext.request.contextPath}/opensouce_register.do"
				enctype="multipart/form-data" method="post"
				id="opensouce_register_from" align="center">


				<div class="required-field-block" style="float: left">
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown" id="categoryBtn">
							Language Category <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" id="categoryDropdown"></ul>

					</div>

				</div>

				<div class="required-field-block"
					style="float: left; margin-left: 10px;">
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown" id="folderBtn">
							Folder Category <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" id="folderDropdown"></ul>

					</div>

				</div>
				<div class="required-field-block"
					style="float: left; margin-left: 10px;">
					<button type="button" id="" data-toggle="modal"
						data-target="#myModal"
						style="background-color: transparent; border: none;">
						<img style="width: 30px; height: 30px;"
							src="${pageContext.request.contextPath}/resources/img/folder.png">
					</button>
				</div>

				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">프로젝트 폴더 추가</h4>
							</div>
							<form id = "insertFolderForm" action = "${pageContext.request.contextPath}/insertFolder.do">
							
								<div class="modal-body">
										<div class="required-field-block" style="margin-top: 30px">
										<label class="opensourceLabel">폴더명  </label> 
											<input type="text" placeholder="Folder Name" class="form-control" name="folderName" id="folderName">
										
										</div>
								</div>
								<div class="modal-footer">
										<input type="button" value = "추가 " id = "insertFolderBtn" class="btn btn-default" data-dismiss="modal"> 
								</div>
							</form>
						</div>

					</div>
				</div>



				<br>
				<div class="required-field-block" style="margin-top: 30px">
					<label class="opensourceLabel">제목 </label> <input type="text"
						placeholder="Title" class="form-control" name="title" id="title">
				</div>


				<br> <label class="opensourceLabel">작성ID</label> <input
					type="text" class="form-control" name="writerId" id="writerId"
					value="${sessionScope.mvo.id}" readonly="readonly"> <br>
				<div class="required-field-block">
					<label class="opensourceLabel">기획 배경 </label>
					<textarea rows="10" class="form-control"
						placeholder="기획 배경을 작성해 주세요 " name="content_back"
						id="content_back" style="resize: none"></textarea>
				</div>
				<br>


				<div class="required-field-block">
					<label class="opensourceLabel">프로젝트 상세 설명 </label>
					<textarea rows="10" class="form-control"
						placeholder="프로젝트 상세 설명을 작성해 주세요 " name="content_detail"
						id="content_detail" style="resize: none"></textarea>
				</div>
				<br>
				<div id="fileDiv">
					<p>

						<input type="file" style="margin: 0px;" id="file_0" name="file">
						<a href="#this" class="btn" id="delete" name="delete">삭제</a>
					</p>
				</div>
				<input type="hidden" id="categoryNo" name="categoryNo" value="">
				<input type="hidden" id="folderNo" name="folderNo" value="">


				<a href="#this" class="btn" id="addFile">파일 추가</a> <a href="#this"
					class="btn" id="write">작성하기</a> <a href="#this" class="btn"
					id="list">목록으로</a> <br>
				<button type="button" class="btn btn-success btn-lg btn3d"
					id="writeBtn">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<button type="button" class="btn btn-danger btn-lg btn3d"
					id="resetBtn">
					<span class="glyphicon glyphicon-remove"></span>
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