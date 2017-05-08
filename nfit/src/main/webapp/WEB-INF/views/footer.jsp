<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	
	
<style>
	.footer-distributed{
	background-color: #292c2f;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	box-sizing: border-box;
	width: 100%;
	text-align: left;
	font: bold 16px sans-serif;

	padding: 25px 50px;
	margin-top: 0px;
}

	.footer-distributed .footer-left,
	.footer-distributed .footer-center,
	.footer-distributed .footer-right{
		display: inline-block;
		vertical-align: top;
	}
	
	/* Footer left */
	
	.footer-distributed .footer-left{
		width: 40%;
	}
	
	/* The company logo */
	
	.footer-distributed h3{
		color:  #ffffff;
		font: normal 36px 'Cookie', cursive;
		margin: 0;
	}
	
	.footer-distributed h3 span{
		color:  #5383d3;
	}
	
	/* Footer links */
	
	.footer-distributed .footer-links{
		color:  #ffffff;
		margin: 20px 0 12px;
		padding: 0;
	}
	
	.footer-distributed .footer-links a{
		display:inline-block;
		line-height: 1.8;
		text-decoration: none;
		color:  inherit;
	}
	
	.footer-distributed .footer-company-name{
		color:  #8f9296;
		font-size: 14px;
		font-weight: normal;
		margin: 0;
	}
	
	/* Footer Center */
	
	.footer-distributed .footer-center{
		width: 35%;
	}
	
	.footer-distributed .footer-center i{
		background-color:  #33383b;
		color: #ffffff;
		font-size: 25px;
		width: 38px;
		height: 38px;
		border-radius: 50%;
		text-align: center;
		line-height: 42px;
		margin: 10px 15px;
		vertical-align: middle;
	}
	
	.footer-distributed .footer-center i.fa-envelope{
		font-size: 17px;
		line-height: 38px;
	}
	
	.footer-distributed .footer-center p{
		display: inline-block;
		color: #ffffff;
		vertical-align: middle;
		margin:0;
	}
	
	.footer-distributed .footer-center p span{
		display:block;
		font-weight: normal;
		font-size:14px;
		line-height:2;
	}
	
	.footer-distributed .footer-center p a{
		color:  #5383d3;
		text-decoration: none;;
	}
	
	
	/* Footer Right */
	
	.footer-distributed .footer-right{
		width: 20%;
	}
	
	.footer-distributed .footer-company-about{
		line-height: 20px;
		color:  #92999f;
		font-size: 13px;
		font-weight: normal;
		margin: 0;
	}
	
	.footer-distributed .footer-company-about span{
		display: block;
		color:  #ffffff;
		font-size: 14px;
		font-weight: bold;
		margin-bottom: 20px;
	}
	
	.footer-distributed .footer-icons{
		margin-top: 25px;
	}
	
	.footer-distributed .footer-icons a{
		display: inline-block;
		width: 35px;
		height: 35px;
		cursor: pointer;
		background-color:  #33383b;
		border-radius: 2px;
	
		font-size: 20px;
		color: #ffffff;
		text-align: center;
		line-height: 35px;
	
		margin-right: 3px;
		margin-bottom: 5px;
	}
	
	/* If you don't want the footer to be responsive, remove these media queries */
	
	@media (max-width: 880px) {
	
		.footer-distributed{
			font: bold 14px sans-serif;
		}
	
		.footer-distributed .footer-left,
		.footer-distributed .footer-center,
		.footer-distributed .footer-right{
			display: block;
			width: 100%;
			margin-bottom: 40px;
			text-align: center;
		}
	
		.footer-distributed .footer-center i{
			margin-left: 0;
		}
	
	}
	
</style>
</head>
<body>
<!-- The content of your page would go here. -->

		<footer class="footer-distributed">

			<div class="footer-left">

				<h3>Nfit <span>company</span></h3>

				<p class="footer-links">
					<a href="index.do">Home</a>
					·
					<a href="about.do">이용안내</a>
					·
					<a href="#">주변센터찾기</a>
					·
					<a href="help.do">고객센터</a>
					·
					<a href="notice.do">공지사항</a>
					·
					<a href="coin.do">코인결제</a>
				</p>

				<p class="footer-company-name">Team Ace Of Ajae &copy; 2017</p>
					
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>테헤란로 14길 6</span> 강남구, 서울특별시</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+02 1544 9970</p>
					<input type="button" value="실시간채팅상담" onclick="window.open('broadcast.do', '채팅', 'width=420, height=240')">
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@company.com">support@company.com</a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span>회사안내</span>
				감사합니다. 보다 노력하여 발전하는 팀이 되도록 하겠습니다. 많이 부족하지만 고생많이했습니다. 	
				</p>

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="https://github.com/dominico82/planAOA"><i class="fa fa-github"></i></a>

				</div>

			</div>

		</footer>

</body>
</html>


