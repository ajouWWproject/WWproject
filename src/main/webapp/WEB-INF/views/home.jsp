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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
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
	
	.stylish-input-group .input-group-addon {
		background: white !important;
	}
	
	.stylish-input-group {
		width: 75%;
		margin-left: 15%;
		border-right: 0;
		box-shadow: 0 0 0;
		border-color: #ccc;
	}
	
	.my_bar {
		width:100%;
	    height: 70px;
	    padding: 6px 25px;
	    font-size: 25px;
	    text-align:center;
	    font-style: bold;
	    line-height: 1.42857143;
	    color: #333;
	    background-image: none;
	    border-radius: 20px;
	    background: rgba(255, 255, 255, 0.6);
	    border:none;
	    border-top-right-radius: 0;
	    border-bottom-right-radius: 0;
	}
	
	input {
		-webkit-appearance: none;
		-webkit-box-shadow: none;
		-moz-box-shadow: none;
	    box-shadow: none;
	}
	
	textarea:focus, input:focus, button:focus {
    	outline: none;
	}
	
	.my_button {
	    background: white !important;
		width: 10%;
	    white-space: nowrap;
	    vertical-align: middle;
	    padding: 6px 20px;
	    font-size: 20px;
	    font-weight: 400;
	    line-height: 1;
	    color: #555;
	    text-align: center;
	    background-color: #eee;
	    border-radius: 20px;
	    border-top-left-radius: 0;
	    border-bottom-left-radius: 0;
	   	display: table-cell;
        border-left: 0;
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
			<div class="input-group stylish-input-group">
				<input type="text" class="my_bar" placeholder="Enter whatever you want">
				<span class="my_button">
					<button type="submit">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>	
		</div>
	</div>
</body>
</html>
