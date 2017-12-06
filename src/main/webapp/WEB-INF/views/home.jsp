<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		/* The image used */
		background-image: url("${pageContext.request.contextPath}/resources/img/background.jpeg");
		/* Full height */
		height: 100%;
		/* Center and scale the image nicely */
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
	}
	
	.container {
		padding-top: 550px;

	}
	
	.stylish-input-group .input-group-addon {
		background: white !important;
	}
	
	.stylish-input-group .form-control {
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

<jsp:include page="header.jsp" />
	<div class="bg">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<div id="imaginary_container">
						<div class="input-group stylish-input-group">
							<input type="text" class="form-control" placeholder="Search">
							<span class="input-group-addon">
								<button type="submit">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
