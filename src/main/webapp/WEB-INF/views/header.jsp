<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
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
			width: 80%;
			height: 40px;
			padding-left: 10px;
			border: 1px solid #bbb;
			border-radius: 5px;
		}
	</style>
	
	



<body>
	<nav class="navbar navbar-default navbar-inverse" role="navigation">
		<div class="container-fluid">
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
					<li><a href="${pageContext.request.contextPath}/board_list.do">OpenSource</a></li>
					<li><a href="${pageContext.request.contextPath}/board_wirte.do">Write</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><p class="navbar-text">이미 계정이 있으신가요?</p></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>로그인</b> <span class="caret"></span></a>
						<ul id="login-dp" class="dropdown-menu">
							<li>
								<div class="row">
									<div class="col-md-12">
										<form class="form" role="form" method="post" action="login.do"
											accept-charset="UTF-8" id="login-nav">
											<div class="form-group">
												<label class="sr-only" for="exampleInputEmail2">ID </label>
												<input type="text" class="form-control" id="id" placeholder="아이디" required>
											</div>
											<div class="form-group">
												<label class="sr-only" for="exampleInputPassword2">Password</label>
												<input type="password" class="form-control" id="password" placeholder="비밀번호" required>
											</div>
											<br>
											<div class="form-group">
												<button type="submit" id="loginBtn" class="btn btn-primary btn-block">로그인</button>
											</div>
											<br>
										</form>
									</div>
									<div class="bottom text-center">새로 오셨나요?&nbsp;&nbsp;<button class="btn" id="register-member" onclick="document.getElementById('register-form').style.display='block'"><b>회원가입</b></button></div>
								</div>
							</li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="register-form" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px; border-radius:20px; padding: 30px;" >
			<div class="w3-center">
				<span onclick="document.getElementById('register-form').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
				<h2 style="font-weight:bold;">회원가입</h2>
				<br>
			</div>

			<form class="w3-container" action="/action_page.php">
				<div class="w3-section">
					<label><b>아이디</b></label><br>
					<input class="register-form-input" type="text" placeholder="사용할 아이디를 입력해주세요" name="usrname" required>&nbsp;&nbsp;
					<button class="btn" style="background-color: #EF5350; color: #fff; width: 85px; height: 40px;">중복 확인</button><br><br>
					
					<label><b>비밀번호</b></label><br>
					<input class="register-form-input" type="password" placeholder="비밀번호를 입력해주세요" name="psw" required><br><br>
					<label><b>비밀번호 확인</b></label><br>
					<input class="register-form-input" type="password" placeholder="비밀번호를 한번 더 입력해주세요" name="psw" required><br><br>
					<label><b>이름</b></label><br>
					<input class="register-form-input" type="text" placeholder="이름을 입력해주세요" name="psw" required><br><br>
					<label><b>전화번호</b></label><br>
					<input class="register-form-input" type="text" placeholder="'-'를 제외한 휴대폰 번호를 입력해주세요" name="psw" required><br><br>
					<br>
					
					<button class="btn btn-primary btn-block register-btn" type="submit">회원가입</button>
				</div>
			</form>

		</div>
	</div>



</body>