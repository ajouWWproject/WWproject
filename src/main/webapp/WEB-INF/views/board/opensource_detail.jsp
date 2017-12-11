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

<style class="cp-pen-styles">


input, textarea {
  outline: none;
  border: none;
  display: block;
  margin: 0;
  padding: 0;
  -webkit-font-smoothing: antialiased;
  font-family: "PT Sans", "Helvetica Neue", "Helvetica", "Roboto", "Arial", sans-serif;
  font-size: 1rem;
  color: #555f77;
}
input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {
  color: #ced2db;
}
input::-moz-placeholder, textarea::-moz-placeholder {
  color: #ced2db;
}
input:-moz-placeholder, textarea:-moz-placeholder {
  color: #ced2db;
}
input:-ms-input-placeholder, textarea:-ms-input-placeholder {
  color: #ced2db;
}

p {
  line-height: 1.3125rem;
}

.comments {
  margin: 2.5rem auto 0;
  max-width: 60.75rem;
  padding: 0 1.25rem;
}

.comment-wrap {
  margin-bottom: 1.25rem;
  display: table;
  width: 100%;
  min-height: 5.3125rem;
}

.photo {
  padding-top: 0.625rem;
  display: table-cell;
  width: 3.5rem;
}
.photo .avatar {
  height: 2.25rem;
  width: 2.25rem;
  border-radius: 50%;
  background-size: contain;
}

.comment-block {
  padding: 1rem;
  background-color: #fff;
  display: table-cell;
  vertical-align: top;
  border-radius: 0.1875rem;
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.08);
}
.comment-block textarea {
  width: 100%;
  resize: none;
}

.comment-text {
  margin-bottom: 1.25rem;
}

.bottom-comment {
  color: #acb4c2;
  font-size: 0.875rem;
}

.comment-date {
  float: left;
}

.comment-actions {
  float: right;
}
.comment-actions li {
  display: inline;
  margin: -2px;
  cursor: pointer;
}
.comment-actions li.complain {
  padding-right: 0.75rem;
  border-right: 1px solid #e1e5eb;
}
.comment-actions li.reply {
  padding-left: 0.75rem;
  padding-right: 0.125rem;
}
.comment-actions li:hover {
  color: #0095ff;
}
</style>

<script>
	$(document).ready(function() {
						$("a[name='file']").on("click", function(e) { //파일 이름
							e.preventDefault();
							fn_downloadFile($(this));
						});

						$("#updateBtn").click(function() {
							location.href = "${pageContext.request.contextPath}/updateBoard.do?boardNo="+ ${requestScope.bvo.board_no};
						});

						$("#insertCommentBtn").click(function(){
							//$("#commentForm").submit();
							alert("EEE");
							location.href="${pageContext.request.contextPath}/insertComment.do?boardNo="+ ${requestScope.bvo.board_no}+"&content="+$("#content").text();;
						});
				
					   
					  
	});

	function fn_downloadFile(obj) {
		var fileName = obj.text();
		location.href = "${pageContext.request.contextPath}/board/fileDownload.do?fileName="+ fileName;

	}

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

				프로젝트 상세 &nbsp;<span class="glyphicon glyphicon-list-alt"
					aria-hidden="true"></span>
			</h1>
		</span> <br>
		
		
		
		<div class="col-md-8 col-md-offset-2" style="height: 150%">
			<form action="${pageContext.request.contextPath}/opensouce_update.do"
				enctype="multipart/form-data" method="post"
				id="opensouce_register_from" align="center">


				<div class="required-field-block" style="float: left">
					<div>
						<button class="btn btn-primary" type="button"
							data-toggle="dropdown" id="categoryBtn">
							${requestScope.bvo.categoryVO.categoryName}</button>
						<ul class="dropdown-menu" id="categoryDropdown"></ul>

					</div>

				</div>

				<div class="required-field-block"
					style="float: left; margin-left: 10px;">
					<div>
						<button class="btn btn-primary " type="button"
							data-toggle="dropdown" id="folderBtn">
							${requestScope.bvo.folderVO.folderName}</button>
						<ul class="dropdown-menu" id="folderDropdown"></ul>

					</div>

				</div>

			<div class="required-field-block"
								style="float: right; margin-left: 10px;">
				<button type="button" style="float:right"class="btn btn-info  btn3d"
					id="moveToList" onclick="fn_openBoardList()">
					목록 
				</button>
				</div>
				<br>
				<div class="required-field-block" style="margin-top: 30px">
					<label class="opensourceLabel">제목 </label> <input type="text"
						placeholder="Title" class="form-control" name="title" id="title"
						value="${requestScope.bvo.title}" readonly="readonly">
				</div>


				<br> <label class="opensourceLabel">작성ID</label> <input
					type="text" class="form-control" name="id" id="writerId"
					value="${requestScope.bvo.memberVO.id}" readonly="readonly">
				<br>
				<div class="required-field-block">
					<label class="opensourceLabel">기획 배경 </label>
					<textarea rows="10" class="form-control" name="content_back"
						id="content_back" style="resize: none" readonly="readonly">${requestScope.bvo.content_back}</textarea>
				</div>
				<br>


				<div class="required-field-block">
					<label class="opensourceLabel">프로젝트 상세 설명 </label>
					<textarea rows="10" class="form-control" name="content_detail"
						id="content_detail" style="resize: none" readonly="readonly">${requestScope.bvo.content_detail}</textarea>
				</div>
				<br>
				<c:forEach var="fvo" items="${requestScope.fList}">
					<div id="fileDiv">
						<input type="hidden" id="idx" value="${fvo.fileNo}"> <label
							class="opensourceLabel"> 첨부 파일 : &nbsp; </label> <a href="#this" name="file" style="float: left;">${fvo.file }</a>

					</div>
					<br>
					<br>
				</c:forEach>
				<br> <input type="hidden" id="categoryNo" name="categoryNo"
					value=""> <input type="hidden" id="folderNo"
					name="folderNo" value="">




				<c:if test="${requestScope.bvo.memberVO.id==sessionScope.mvo.id}">
					<button type="button" class="btn btn-warning btn-lg btn3d"
						id="updateBtn">
						수정 
					</button>

					<button type="button" class="btn btn-danger btn-lg btn3d"
						id="removeBtn">
						삭제 
					</button>


				</c:if>


			</form>
			
			<div class="comments">
		
        <c:if test="${sessionScope.mvo!=null}">
			<div class="comment-wrap">
					<div class="photo">
							<div class="avatar" style="background-image: url('https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg')"></div>
					</div>
					
					<div class="comment-block">
							<form id = "commentForm">
									<input type = "hidden" name = "boardNo" value = "${requestScope.bvo.board_no}">
									<textarea name="content" id="comment" cols="30" rows="3" placeholder="Add comment..."></textarea>
							</form>
							<div class="bottom-comment">
									<ul class="comment-actions">
											<li><input type = "button" class="btn-default"  id = "insertCommentBtn"  value = "확인 "></li>
									</ul>								
							</div>
					</div>
			</div>
		</c:if>
		
		<c:forEach var="cvo" items="${requestScope.cvoList}">
		<div class="comment-wrap">
				<div class="photo">
				<c:if test="${cvo.memberVO.profile_path ==''}">
					<div class="avatar" ">
						<img src="${pageContext.request.contextPath}/resources/img/profile.jpg" alt="Volton">
               		</div>
				</div>
				</c:if>
				<div class="comment-block">
						<p class="comment-text">${cvo.content}</p>
						<div class="bottom-comment">
								<div class="comment-date">${cvo.timePosted}</div>
								<ul class="comment-actions">
										<li class="complain">수정 </li>
										<li class="reply">삭제 </li>
								</ul>
						</div>
				</div>
		</div>
	</c:forEach>
		<div class="comment-wrap">
				<div class="photo">
						<div class="avatar" style="background-image: url('https://s3.amazonaws.com/uifaces/faces/twitter/felipenogs/128.jpg')"></div>
				</div>
				<div class="comment-block">
						<p class="comment-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto temporibus iste nostrum dolorem natus recusandae incidunt voluptatum. Eligendi voluptatum ducimus architecto tempore, quaerat explicabo veniam fuga corporis totam.</p>
						<div class="bottom-comment">
								<div class="comment-date">Aug 23, 2014 @ 10:32 AM</div>
								<ul class="comment-actions">
										<li class="complain">Complain</li>
										<li class="reply">Reply</li>
								</ul>
						</div>
				</div>
		</div>
</div>
			
			
		</div>
		<br> <br> <br>
		
	</div>
	<br>
	<br>
	<br>


		<!-- /col-sm-5 -->
</body>
</html>