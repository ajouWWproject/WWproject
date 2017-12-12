<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>WW</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templatemo-style.css">
        <script src="${pageContext.request.contextPath}/resources/js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<style>
		table {
			width: 100%;
		}
		
		th {
			text-align: center;
			width: 25%;
		}
		
		.card-container {
			position: relative;
			flex-wrap: wrap;
			overflow: hidden;
			padding-top: 15px;
			padding-bottom: 15px;
			display: flex;
			justify-content: space-around;
			align-items: auto;
		}
		
		.card {
			min-width: 275px;
			width: 275px;
			position: relative;
			margin: 15px 15px;
			height: 350px;
			border-radius: 7px;
			background-size: cover;
			background: rgba(0, 0, 0, 0.2);
			box-shadow: 5px 5px 10px 1px rgba(0, 0, 0, 0.3);
			transition: 0.2s all linear;
			border: 1px solid rgba(128, 128, 128, 0.15);
			box-sizing: border-box;
		}
		
		.card .card-social {
			position: absolute;
			height: 75px;
			width: 100%;
			background: red;
			border-bottom-right-radius: 5px;
			border-bottom-left-radius: 5px;
			background: rgba(0, 0, 0, 0.6);
			box-shadow: 2px 2px 10px 0px rgba(0, 0, 0, 0.5);
			top: 275px;
		}
		
		.card .card-social ul {
			padding: 0;
			margin: 0;
			list-style: none;
			width: 100%;
			height: 100%;
			display: flex;
			justify-content: space-around;
		}
		
		.card .card-social ul li {
			height: 100%;
			text-align: center;
			line-height: 75px;
			font-size: 1.5em;
			color: rgba(255, 255, 255, 0.85);
			text-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);
		}
		
		.card .card-social ul li:hover {
			text-shadow: 7px 7px 5px rgba(0, 0, 0, 0.7);
			transition: all 0.1s linear;
		}
		
		.card .card-image {
			width: 100%;
			height: 275px;
			position: relative;
			border-top-right-radius: 5px;
			border-top-left-radius: 5px;
			border-top-right-radius: 5px;
		}
		
		.card .card-info {
			position: relative;
			width: 100%;
			height: 35px;
			line-height: 35px;
			top: -265px;
			border-top-right-radius: 5px;
			border-top-left-radius: 5px;
			font-family: "Open Sans";
			color: rgba(255, 255, 255, 0.85);
		}
		
		.card .card-info .card-title {
			line-height: 35px;
			height: 35px;
			position: relative;
			top: 0px;
			font-size: 25px;
			text-align: center;
			background: rgba(0, 0, 0, 0.6);
			box-shadow: 5px 5px 10px 2px rgba(0, 0, 0, 0.3);
		}
		
		.card .card-info .card-detail {
			line-height: 1.5em;
			font-size: 1em;
			height: 220px;
			background: rgba(0, 0, 0, 0.6);
			position: relative;
			top: 5px;
			padding: 5px 20px 0px 20px;
			opacity: 0;
			transform: scaleY(0);
			transform-origin: center top;
			box-shadow: 5px 5px 10px 2px rgba(0, 0, 0, 0.3);
		}
		
		.card:hover {
			box-shadow: 10px 10px 10px 1px rgba(0, 0, 0, 0.3);
		}
		
		.card:hover .card-info .card-title {
			box-shadow: 10px 10px 10px 1px rgba(0, 0, 0, 0.3);
			transition: 0.3s all linear;
		}
		
		.card:hover .card-info .card-detail {
			opacity: 1;
			box-shadow: 10px 10px 10px 1px rgba(0, 0, 0, 0.3);
			transition: 0.35s all linear;
			transition-delay: 0.1s;
			transform: scaleY(1);
		}
	</style>
	
	<script>
        	$(document).ready(function() {
        		if(${mvo.profile_path == null}) {
        			console.log("없음");
        			$('#profile').attr("src", "${pageContext.request.contextPath}/resources/img/user.png");
        			$('#profile-image').attr("src", "${pageContext.request.contextPath}/resources/img/user.png");
        		} else {
        			console.log("있음");
        			$('#profile').attr("src", "${pageContext.request.contextPath}/resources/upload/${mvo.profile_path}");
        			$('#profile-image').attr("src", "${pageContext.request.contextPath}/resources/upload/${mvo.profile_path}");
        			                                  
        		}        		
        	});
        	
        	function profile_change() {
        		$('#file').trigger("click");
        	}
        	
        	function file_change() {
        		var reader = new FileReader();
        		reader.onload = function (event) {
        		    $('#profile').attr("src", event.target.result);
        		}
        		reader.readAsDataURL($('#file').prop('files')[0]);
        	}
        	
        </script>
        
    </head>
    <body>
    	<jsp:include page="./header.jsp" />
        
        <div class="sidebar-menu hidden-xs hidden-sm">
            <div class="top-section">
                <div class="profile-image">
                    <img id="profile-image" >
                </div>
                <h3 class="profile-title">${mvo.name}</h3>
                <p class="profile-description">${mvo.id}</p>
            </div>
            <div class="main-navigation">
                <ul class="navigation">
                    <li><a href="#top"><i class="fa fa-globe"></i>Welcome</a></li>
                    <li><a href="#about"><i class="fa fa-pencil"></i>About Me</a></li>
                    <li><a href="#portfolio"><i class="fa fa-paperclip"></i>My Portfolio</a></li>
                    <li><a href="#like"><i class="fa fa-link"></i>What I Like</a></li>
                </ul>
            </div>
        </div>
        

        <div class="banner-bg" id="top">
            <div class="banner-overlay"></div>
            <div class="welcome-text">
                <h2>My Space</h2>
                <h5>Manage your own portfolio</h5>
            </div>
        </div>

        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="fluid-container">
                <div class="content-wrapper">
                    <!-- ABOUT -->
                    <div class="page-section" id="about">
	                    <div class="row">
	                        <div class="col-md-12">
	                            <h2 class="widget-title">About Me</h2>
	                       
								<div id="register-form">
									<div class="w3-modal-content w3-card-4 w3-animate-zoom"
										style="max-width: 600px; border-radius: 20px; padding: 30px;">
	
										<form action="${pageContext.request.contextPath}/myPage/editInfo.do" method="post" enctype="multipart/form-data">
											<table>
												<tr>
													<th></th>
													<td style="padding-left:10%;">
														<img id="profile" style="width:50%;" border='0' onclick='profile_change()'>
														<br><br>
													</td>
												</tr>
												<tr>
													<th><label><b>아이디</b></label></th>
													<td><input class="register-form-input" id="id_e" type="text" value="${mvo.id}" name="id" readonly="readonly"><br><br></td>
												</tr>
												<tr>
													<th><label><b>비밀번호</b></label></th>
													<td><input class="register-form-input" id="pw_e" type="password" placeholder="바꿀 비밀번호를 입력해주세요" name="password" required><br><br></td>
												</tr>
												<tr>
													<th><label><b>비밀번호 확인</b></label></th>
													<td><input class="register-form-input" id="pwOk_e" type="password" placeholder="비밀번호를 한번 더 입력해주세요" name="pwOk_e" required><br><br></td>
												</tr>
												<tr>
													<th><label><b>이름</b></label></th>
													<td><input class="register-form-input" id="name_e" type="text" placeholder="이름을 입력해주세요" value="${mvo.name}" name="name" required><br><br></td>
												</tr>
												<tr>
													<th><label><b>전화번호</b></label></th>
													<td><input class="register-form-input" type="text" id="phone_e" placeholder="'-'를 제외한 휴대폰 번호를 입력해주세요" value="${mvo.phone}" name="phone" required><br><br></td>
												</tr>
											</table>
											
											<input type="file" name="file" id="file" onchange="file_change()" style="display: none;">
											
											<br>
											
											<button class="btn btn-primary btn-block register-btn" type="submit">수정</button>
										</form>
									</div>
								</div>
								<hr>
	                        </div>
	                    </div> <!-- #about -->
                    </div>
                    
                    <!-- PROJECTS -->
                    <div class="page-section" id="portfolio">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="widget-title">My Portfolio</h2>
                        </div>
                    </div>
                    <div class="row projects-holder">
						<div class="card-container">
							<c:forEach var="bvo" items="${myBoardList}">
								<div class="card" id = "card${bvo.board_no}" >
									<input type = "hidden" id = "boardNo" value = "${bvo.board_no}">
									<div class="card-image" style="background-color: #fff;">
										<img
											style="width: 100%; position: relative; border-top-right-radius: 5px; border-top-left-radius: 5px;"
											src="${pageContext.request.contextPath}/resources/img/categoryImg/${bvo.categoryVO.photo_path}">
									</div>
									<div class="card-info">
										<div class="card-title">${bvo.title}</div>
										<div class="card-detail">
											작성자 : ${bvo.memberVO.id}<br> 작성일자 : ${bvo.timePosted} <br>
										</div>
									</div>
									<div class="card-social">
										<ul>
											<li><i class="fa fa-comment-o" aria-hidden="true"></i></li>
											<li>${bvo.hits}</li>
										</ul>
									</div>
								</div>
							</c:forEach>
						</div>
					
						
                    </div> <!-- my projects -->
                    </div>
                    <hr>

                    <!-- CONTACT -->
                    <div class="page-section" id="like">
	                    <div class="row">
	                        <div class="col-md-12">
	                            <h2 class="widget-title">What I Like</h2>
	                        </div>
	                    </div>
	                    <div class="row projects-holder">
		                    <div class="card-container">
								<c:forEach var="bvo" items="${likeBoardList}">
									<div class="card" id = "card${bvo.board_no}" >
										<input type = "hidden" id = "boardNo" value = "${bvo.board_no}">
										<div class="card-image" style="background-color: #fff;">
											<img
												style="width: 100%; position: relative; border-top-right-radius: 5px; border-top-left-radius: 5px;"
												src="${pageContext.request.contextPath}/resources/img/categoryImg/${bvo.categoryVO.photo_path}">
										</div>
										<div class="card-info">
											<div class="card-title">${bvo.title}</div>
											<div class="card-detail">
												작성자 : ${bvo.memberVO.id}<br> 작성일자 : ${bvo.timePosted} <br>
											</div>
										</div>
										<div class="card-social">
											<ul>
												<li><i class="fa fa-comment-o" aria-hidden="true"></i></li>
												<li><i class="fa fa-heart" aria-hidden="true"></i></li>
												<li>${bvo.hits}</li>
											</ul>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						
						<%-- <div class="row projects-holder">
	                        <div class="col-md-4 col-sm-6">
	                            <div class="project-item">
	                                <img src="${pageContext.request.contextPath}/resources/img/1.jpg" alt="">
	                                <div class="project-hover">
	                                    <div class="inside">
	                                        <h5><a href="#">Pellentesque porta ligula</a></h5>
	                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam cursus</p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-4 col-sm-6">
	                            <div class="project-item">
	                                <img src="${pageContext.request.contextPath}/resources/img/2.jpg" alt="">
	                                <div class="project-hover">
	                                    <div class="inside">
	                                        <h5><a href="#">Pellentesque porta ligula</a></h5>
	                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam cursus</p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-4 col-sm-6">
	                            <div class="project-item">
	                                <img src="${pageContext.request.contextPath}/resources/img/3.jpg" alt="">
	                                <div class="project-hover">
	                                    <div class="inside">
	                                        <h5><a href="#">Pellentesque porta ligula</a></h5>
	                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam cursus.</p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-4 col-sm-6">
	                            <div class="project-item">
	                                <img src="${pageContext.request.contextPath}/resources/img/4.jpg" alt="">
	                                <div class="project-hover">
	                                    <div class="inside">
	                                        <h5><a href="#">Pellentesque porta ligula</a></h5>
	                                        <p>Quisque mattis sit amet dolor eu scelerisque. Vivamus bibendum massa et nisl tempus commodo.</p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-4 col-sm-6">
	                            <div class="project-item">
	                                <img src="${pageContext.request.contextPath}/resources/img/5.jpg" alt="">
	                                <div class="project-hover">
	                                    <div class="inside">
	                                        <h5><a href="#">Pellentesque porta ligula</a></h5>
	                                        <p>Quisque mattis sit amet dolor eu scelerisque. Vivamus bibendum massa et nisl tempus commodo.</p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-4 col-sm-6">
	                            <div class="project-item">
	                                <img src="${pageContext.request.contextPath}/resources/img/6.jpg" alt="">
	                                <div class="project-hover">
	                                    <div class="inside">
	                                        <h5><a href="#">Pellentesque porta ligula</a></h5>
	                                        <p>Quisque mattis sit amet dolor eu scelerisque. Vivamus bibendum massa et nisl tempus commodo.</p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div> <!-- like project --> --%>
						
						
                   
                    </div>
                    <hr>

                    <div class="row" id="footer">
                        <div class="col-md-12 text-center">
                            <p class="copyright-text">Copyright &copy; 2017 Database Team Project</p>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.10.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/min/plugins.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/min/main.min.js"></script>

    </body>
</html>