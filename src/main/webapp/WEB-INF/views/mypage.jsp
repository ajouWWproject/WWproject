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
		      	width: 100%;"
		      }
		      
		      th {
		      	text-align: center;
		      	width: 25%;"
		      }
		     
        </style>
        
    </head>
    <body>
    	<jsp:include page="header.jsp" />
        
        <div class="sidebar-menu hidden-xs hidden-sm">
            <div class="top-section">
                <div class="profile-image">
                    <img src="${pageContext.request.contextPath}/resources/img/profile.jpg" alt="Volton">
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
	                            <h4 class="widget-title">About Me</h4>
	                            <div class="about-image">
	                                <img src="${pageContext.request.contextPath}/resources/img/8.jpg" alt="about me">
		                        </div>
	
								<div id="register-form">
									<div class="w3-modal-content w3-card-4 w3-animate-zoom"
										style="max-width: 600px; border-radius: 20px; padding: 30px;">
										<div class="w3-center">
											<h2 style="font-weight: bold;">My Information</h2>
											<br>
										</div>
	
										<form action="">
											<table>
												<tr>
													<th></th>
													<td>
														<c:choose>
															<c:when test="${mvo.profile_path == null}">
																<img style="width:50%;" src="${pageContext.request.contextPath}/resources/img/user.png" border='0' onclick='document.all.file.click(); document.all.filePath.value=document.all.file.value; this.src=document.all.file.value'>
															</c:when>
															<c:otherwise>
																<img style="width:50%;" src="${pageContext.request.contextPath}/resources/img/user.png" border='0' onclick='document.all.file.click(); document.all.filePath.value=document.all.file.value; this.src=document.all.file.value'>
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											
												<tr>
													<th><label><b>아이디</b></label></th>
													<td><input class="register-form-input" id="id_e" type="text" value="${mvo.id}" name="id_e" readonly="readonly"></td>
												</tr>
												<tr>
													<th><label><b>비밀번호</b></label></th>
													<td><input class="register-form-input" id="pw_e" type="password"
														placeholder="바꿀 비밀번호를 입력해주세요" name="pw_e" required></td>
												</tr>
												<tr>
													<th><label><b>비밀번호 확인</b></label></th>
													<td><input class="register-form-input" id="pwOk_e"
														type="password" placeholder="비밀번호를 한번 더 입력해주세요" name="pwOk_e"
														required></td>
												</tr>
												<tr>
													<th><label><b>이름</b></label></th>
													<td><input class="register-form-input" id="name_e"
														type="text" placeholder="이름을 입력해주세요" value="${mvo.name}" name="name_e" required></td>
												</tr>
												<tr>
													<th><label><b>전화번호</b></label></th>
													<td><input class="register-form-input" type="text" id="phone_e"
														placeholder="'-'를 제외한 휴대폰 번호를 입력해주세요" value="${mvo.phone}" name="phone_e" required></td>
												</tr>
											</table>
											
											<input type="file" name="file" style="display: none;"> 
											<input type="text" name="filePath" id="filePath" style="display: none;"> 
											
											<button class="btn btn-primary btn-block register-btn"
												type="submit">수정</button>
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
                            <h4 class="widget-title">My Portfolio</h4>
                            <p>Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Maecenas et lorem molestie, maximus justo dignissim, cursus nisl. Nullam at ante quis ex pharetra pulvinar quis id dolor. Integer lorem odio, euismod ut sem sit amet, imperdiet condimentum diam.</p>
                        </div>
                    </div>
                    <div class="row projects-holder">
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
                    </div> <!-- my projects -->
                    </div>
                    <hr>

                    <!-- CONTACT -->
                    <div class="page-section" id="like">
                    <div class="row">
                        <div class="col-md-12">
                            <h4 class="widget-title">What I Like</h4>
                            <p>Vestibulum ac iaculis erat, in semper dolor. Maecenas et lorem molestie, maximus justo dignissim, cursus nisl. Nullam at ante quis ex pharetra pulvinar quis id dolor. Integer lorem odio, euismod ut sem sit amet, imperdiet condimentum diam.</p>
                        </div>
                    </div>
                    <div class="row projects-holder">
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
                    </div> <!-- like project -->
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