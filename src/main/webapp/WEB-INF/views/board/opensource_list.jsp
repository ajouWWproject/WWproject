<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<script	src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
		<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
		<script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
		<script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
		
		<meta name="robots" content="noindex">
		<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
		<link rel="mask-icon" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
		<link rel="canonical" href="https://codepen.io/inf3cti0n95/pen/vyEvgy?limit=all&page=32&q=comment" />
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300" rel="stylesheet">
		
		<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery.min.js"></script>
		
		
		
		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> 
			addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
		</script>
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		
		
		 <!---strat-slider---->
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style2.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr.custom.28468.js"></script>
		
		
		<style class="cp-pen-styles">
			body {
				background: rgb(255, 255, 255);
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
				$(".card").on("click", function(){
					var boardNo = $(this).children("#boardNo").val();
					location.href = "${pageContext.request.contextPath}/board/moveToDetail.do?boardNo="+boardNo;
				});
				
			});
		</script>
		
		

		
	</head>
	
	<body>
		<jsp:include page="../header.jsp" />
	

	<div class="card-container">
			<c:forEach var="bvo" items="${requestScope.bvoList}">
				<div class="card" id="card${bvo.board_no}">
					<input type="hidden" id="boardNo" value="${bvo.board_no}">
					<div class="card-image" style="background-color: #fff;">
						<img style="width: 100%; position: relative; border-top-right-radius: 5px; border-top-left-radius: 5px;"
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
							<c:choose>
								<c:when test="${bvo.board_like == 'true'}">
									<li><i class="fa fa-heart" aria-hidden="true"></i></li>
								</c:when>
								<c:otherwise>
									<li><i class="fa fa-heart-o" aria-hidden="true"></i></li>
								</c:otherwise>
							</c:choose>
							<li>${bvo.hits}</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>	
	</body>
</html>
