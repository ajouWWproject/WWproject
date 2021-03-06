<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
	
	.register-btn {
         border-radius:10px;
         font-size: 18px;
         align-content: center;
         width: 100%;
         height: 60px;
      }
      
      .register-form-input {
         width: 100%;
         height: 40px;
         padding-left: 10px;
         border: 1px solid #bbb;
         border-radius: 5px;
      }
</style>


<script>
$(document).ready(function() {
	$("#searchBtn").click(function(){
		var keyword = $("#keyword").val();
		location.href = "${pageContext.request.contextPath}/searchByKeyword.do?keyword="+ keyword;
	});
	
	$.ajax({
		type : "post",
		url : "findCategoryList.do",
		dataType : "json",
		success : function(json) {
			var data = "";

			for (var i = 0; i < json.length; i++) {
				data += "<li><a href='${pageContext.request.contextPath}/searchByCategory.do?categoryNo="+ json[i].categoryNo+" value='"+json[i].categoryNo+"'>";
				data += json[i].categoryName + "</a></li>";
			}
			$("#headerCategoryDropdown").html(data);
		}//function
	});//ajax
	
});

	var idCheck = 0;
	var pwCheck = 0;
	
	function checkId() {
        var inputed = $('#register_id').val();
        $.ajax({
            data : {
                id : inputed
            },
            url : "checkId.do",
            success : function(data) {
                if(inputed=="" && data=='0') {
                	$("#register_btn").prop("disabled", true);
                    $("#id_label").html("아이디를 입력해주세요.");
                    $("#id_label").css("color", "#ff0000");
                    idCheck = 0;
                } else if (data == '0') {
                    idCheck = 1;
                    if(idCheck == 1) {
                        $("#id_label").html("사용할 수 있는 아이디입니다.");
                        $("#id_label").css("color", "#42a56b");
	                    if(pwdCheck == 1) {
	                    	$("#register_btn").prop("disabled", false);
	                        signupCheck();
	                    }
                    }
                } else if (data == '1') {
                	$("#register_btn").prop("disabled", true);
                    $("#id_label").html("중복된 아이디입니다.");
                    $("#id_label").css("color", "#ff0000");
                    idCheck = 0;
                } 
            }
        });
    }
	
	
	function checkPw() {
        var inputed = $('#pw').val();
        var reinputed = $('#pwOk').val();
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
        	$("#register_btn").prop("disabled", true);
            $("#pw_label").html("비밀번호가 일치하지 않습니다.");
            $("#pw_label").css("color", "#ff0000");
        }
        else if (inputed == reinputed) {
        	$("#pw_label").css("color", "#42a56b");
        	$("#pw_label").html("비밀번호가 일치합니다.");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {
            	$("#register_btn").prop("disabled", false);
                signupCheck();
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $("#register_btn").prop("disabled", true);
            $("#pw_label").html("비밀번호가 일치하지 않습니다.");
            $("#pw_label").css("color", "#ff0000");
        }
    }
    
    function signupCheck() {
        var name = $("#name").val();
        var phone = $("#phone").val();
        if(name == "" || phone == "") {
        	$(".signupbtn").prop("disabled", true);
        } else {
        	
        }
    }
    
    
    
</script>



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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">WW PROJECT</a>
         </div>

         <div class="collapse navbar-collapse"
            id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
             <li><a href="${pageContext.request.contextPath}/board_list.do">프로젝트 </a></li>
            <c:choose>
               <c:when test="${sessionScope.mvo!=null}">
	               <li><a
	                  href="${pageContext.request.contextPath}/opensource_write.do">프로젝트 추가 </a></li>
	              
	           </c:when>
	           <c:otherwise>
	           </c:otherwise>
                  </c:choose>
               <li class="dropdown"><a href="#" class="dropdown-toggle"
                  data-toggle="dropdown" id ="categoryBtn">카테고리<span class="caret"></span></a>
                  <ul class="dropdown-menu" id="headerCategoryDropdown"role="menu">
                     
                  </ul>
                  
                 </li>
            </ul>
            <form class="navbar-form navbar-left" role="search" action="searchByKeyword.do">
               <div class="form-group">
                  <input type="text" class="form-control" id = "keyword" name="keyword" placeholder="검색  키워드">
               </div>
               <button type="submit" id = "searchBtn" class="btn btn-primary">검색</button>
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
                                          <label class="sr-only" for="exampleInputEmail2">ID</label> 
                                          <input type="text" class="form-control" id="id" name="id" placeholder="아이디" required>
                                       </div>
                                       <div class="form-group">
                                          <label class="sr-only" for="exampleInputPassword2">Password</label>
                                          <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>

                                       </div>
                                       <br>
                                       <div class="form-group">
                                          <button type="submit" id="loginBtn"
                                             class="btn btn-primary btn-block">로그인</button>
                                       </div>
                                       <br>
                                    </form>
                                 </div>
                                 <div class="bottom text-center">새로 오셨나요?&nbsp;&nbsp;<button class="btn" id="register-member" onclick="document.getElementById('register-form').style.display='block'"><b>회원가입</b></button></div>
                                 </div>
                              </div>
                           </li>
                        </ul>
                      </li>
                  </ul>
                  
               </c:when>

               <c:otherwise>
                  <ul class="nav navbar-nav navbar-right">
                     <li><p class="navbar-text">${sessionScope.mvo.id }님 로그인</p></li>
                     <li>
                        <button type="button" id="mypageBtn" onclick="location.href='${pageContext.request.contextPath}/myPage/mypage.do'" style="background-color:transparent; border:none;">
                           <img style=" width:30px; height:30px;margin-top:8px;" src="${pageContext.request.contextPath}/resources/img/ic_mypage.png">
                        </button>
                     </li>
                     
                     <form class="navbar-form navbar-right" role="logout" action = "${pageContext.request.contextPath}/logout.do">
                        
                        <button type="submit" class="btn btn-primary">로그아웃 </button>
                     </form>
                  </ul>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
   </nav>
   <div id="register-form" class="w3-modal">
      <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px; border-radius:20px; padding: 30px;" >
         <div class="w3-center">
            <span onclick="document.getElementById('register-form').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
            <h2 style="font-weight:bold;">회원가입</h2>
         </div>

         <form class="w3-container" role="form" method="post" action="${pageContext.request.contextPath}/register.do">
            <div class="w3-section" style="padding:30px;">
               <label><b>아이디</b></label>&nbsp;&nbsp;&nbsp;<p id="id_label" style="display: inline-block; font-size:12px;"></p><br>
               <input class="register-form-input" id="register_id" type="text" placeholder="사용할 아이디를 입력해주세요" name="id" oninput="checkId()" required><br><br>
               <label><b>비밀번호</b></label><br>
               <input class="register-form-input" id="pw" type="password" placeholder="비밀번호를 입력해주세요" name="password" oninput="checkPw()" required><br><br>
               <label><b>비밀번호 확인</b></label>&nbsp;&nbsp;&nbsp;<p id="pw_label" style="display: inline-block; font-size:12px;"></p><br>
               <input class="register-form-input" id="pwOk" type="password" placeholder="비밀번호를 한번 더 입력해주세요" name="pwd" oninput="checkPw()" required><br><br>
               <label><b>이름</b></label><br>
               <input class="register-form-input" id="name" type="text" placeholder="이름을 입력해주세요" name="name" required><br><br>
               <label><b>전화번호</b></label><br>
               <input class="register-form-input" id="phone" type="text" placeholder="'-'를 제외한 휴대폰 번호를 입력해주세요" name="phone" required><br><br>  
            </div>
            <button id="register_btn" class="btn btn-primary btn-block register-btn" type="submit" disabled="disabled">회원가입</button>
         </form>
      </div>
   </div>
 </body>