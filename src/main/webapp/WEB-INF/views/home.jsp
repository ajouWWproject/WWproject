<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	body, html {
		height: 100%;
		margin: 0;
	}
	
	.bg {
		background-image: url("${pageContext.request.contextPath}/resources/img/background.jpeg");
		height: 100%;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
	}
	
	.container {
		padding-top: 450px;

	}
	
	.my_bar {
		height: 50px;
	}
	
	.stylish-input-group .input-group-addon {
		background: white !important;
	}
	
	.stylish-input-group {
		width: 80%;
		border-right: 0;
		box-shadow: 0 0 0;
		border-color: #ccc;
	}
	
	.form-control {
		border-right: 0;
		box-shadow: 0 0 0;
		border-color: #ccc;
	}

	
	.stylish-input-group button {
		border: 0;
		background: transparent;
	}
</style>
</head>
<body>
	<div class="bg">
		<div class="container">
			
				
						<div class="input-group stylish-input-group">
							<input type="text" class="form-control my_bar" placeholder="Search">
							<span class="input-group-addon">
								<button type="submit">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					
				
		</div>
	</div>
</body>
</html>
