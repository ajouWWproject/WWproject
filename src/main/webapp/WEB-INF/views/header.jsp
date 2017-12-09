<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#loginInfo {
	   color: rgb(255, 255, 255);
	}
	
	#login-dp {
	   min-width: 250px;
	   padding: 14px 14px 0;
	   overflow: hidden;
	   background-color: rgba(255, 255, 255, .8);
	}
	
	#login-dp .help-block {
	   font-size: 12px
	}
	
	#login-dp .bottom {
	   background-color: rgba(255, 255, 255, .8);
	   border-top: 1px solid #ddd;
	   clear: both;
	   padding: 14px;
	}
	
	#login-dp .social-buttons {
	   margin: 0px 0
	}
	
	#login-dp .social-buttons a {
	   width: 49%;
	}
	
	#login-dp .form-group {
	   margin-bottom: 0px;
	}
	
	.btn-fb {
	   color: #fff;
	   background-color: #3b5998;
	}
	
	.btn-fb:hover {
	   color: #fff;
	   background-color: #496ebc
	}
	
	.btn-tw {
	   color: #fff;
	   background-color: #55acee;
	}
	
	.btn-tw:hover {
	   color: #fff;
	   background-color: #59b5fa;
	}
	
	@media ( max-width :768px) {
	   #login-dp {
	      background-color: inherit;
	      color: #fff;
	   }
	   #login-dp .bottom {
	      background-color: inherit;
	      border-top: 0 none;
	   }
	}
	
	.navbar {
	   position: relative;
	   min-height: 50px;
	   margin-bottom: 0px;
	   border: 1px solid transparent;
	}
	
	.navbar-text {
	   color: #ccc;
	}
	
	.navbar-inverse .navbar-text {
	   color: #eee;
	}
	
	.navbar-inverse .navbar-nav>li>a {
	   color: #eee;
	}
	
	.navbar-inverse .navbar-brand {
	   color: #eee;
	}


</style>




<body>
   <nav class="navbar navbar-default navbar-inverse" role="navigation">
      <div class="container-fluid">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
               <span class="sr-only">Toggle navigation</span> <span
                  class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">WW PROJECT</a>
         </div>

         <div class="collapse navbar-collapse"
            id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
               <li><a href="${pageContext.request.contextPath}/board_list.do">프로젝트 </a></li>
               <li><a
                  href="${pageContext.request.contextPath}/opensource_write.do">프로젝트 추가 </a></li>
               <li class="dropdown"><a href="#" class="dropdown-toggle"
                  data-toggle="dropdown">카테고리<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                     <li><a href="#">Java</a></li>
                     <li><a href="#">C</a></li>
                     <li><a href="#">HTML</a></li>
                     <li class="divider"></li>
                     <li><a href="#">Separated link</a></li>
                     <li class="divider"></li>
                     <li><a href="#">One more separated link</a></li>
                  </ul></li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="검색  키워드">
               </div>
               <button type="submit" class="btn btn-primary">검색</button>
            </form>
            <c:choose>
               <c:when test="${sessionScope.mvo==null}">

                  <ul class="nav navbar-nav navbar-right">
                     <li><p class="navbar-text">이미 계정이 있으신가요?</p></li>
                     <li class="dropdown"><a href="#" class="dropdown-toggle"
                        data-toggle="dropdown"><b>로그인</b> <span class="caret"></span></a>
                        <ul id="login-dp" class="dropdown-menu">
                           <li>
                              <div class="row">
                                 <div class="col-md-12">

                                    <form class="form" role="form" method="post"
                                       action="${pageContext.request.contextPath}/login.do"
                                       accept-charset="UTF-8" id="login-nav">
                                       <div class="form-group">
                                          <label class="sr-only" for="exampleInputEmail2">ID
                                          </label> <input type="text" class="form-control" id="id" name="id"
                                             placeholder="아이디" required>
                                       </div>
                                       <div class="form-group">
                                          <label class="sr-only" for="exampleInputPassword2">Password</label>
                                          <input type="password" class="form-control" id="password"
                                             name="password" placeholder="비밀번호" required>

                                       </div>
                                       <br>
                                       <div class="form-group">
                                          <button type="submit" id="loginBtn"
                                             class="btn btn-primary btn-block">로그인</button>
                                       </div>
                                       <br>
                                    </form>
                                 </div>
                                 <div class="bottom text-center">
                                    새로 오셨나요? <a href="#"><b>회원가입</b></a>
                                 </div>
                              </div>
                           </li>
                        </ul></li>
                  </ul>
               </c:when>

               <c:otherwise>
                  <ul class="nav navbar-nav navbar-right">
                     <li><p class="navbar-text">${sessionScope.mvo.id }님로그인</p></li>
                     <li>
                        <button type="button" id="mypageBtn" onclick="location.href='${pageContext.request.contextPath}/mypage.do'" style="background-color:transparent; border:none;">
                           <img style=" width:30px; height:30px;margin-top:8px;" src="${pageContext.request.contextPath}/resources/img/ic_mypage.png">
                        </button>
                     </li>
                     
                     <form class="navbar-form navbar-right" role="logout" action = "${pageContext.request.contextPath}/logout.do">
                        
                        <button type="submit" class="btn btn-default">로그아웃 </button>
                     </form>

                  </ul>


               </c:otherwise>
            </c:choose>




         </div>
         <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
   </nav>