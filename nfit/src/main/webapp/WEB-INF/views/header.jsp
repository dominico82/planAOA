<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!---start-header---->
			<div class="header">
				<div class="wrap">
				<div class="header-left">
					<div class="logo">
						<a href="resources/index.html">Runkeeper</a>
					</div>
				</div>
				<div class="header-right">
					<div class="top-nav">
					<ul>
						<li><a href="resources/index.html">Home</a></li>
						<li><a href="resources/about.html">About</a></li>
						<li><a href="resources/features.html">Features</a></li>
						<li><a href="coin.do">코인결제</a></li>
					</ul>
				</div>
				<div class="sign-ligin-btns">
					<ul>
						<li id="memberJoinContainer"><a class="memberJoin" id="memberJoinButton" href="memberJoin.do"><span><i>회원가입</i></span></a></li>
						<li id="loginContainer"><a class="login" id="loginButton" href="#"><span><i>Login</i></span></i></a>
							 <div class="clear"> </div>
				                <div id="loginBox">                
				                    <form id="loginForm">
				                        <fieldset id="body">
				                            <fieldset>
				                                <label for="email">Email Address</label>
				                                <input type="text" name="email" id="email" />
				                            </fieldset>
				                            <fieldset>
				                                <label for="password">Password</label>
				                                <input type="password" name="password" id="password" />
				                            </fieldset>
				                            <label class="remeber" for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
				                            <input type="submit" id="login" value="login" />
				                        </fieldset>
				                        <span><a href="#">Forgot your password?</a></span>
				                    </form>
				                </div>
				            <!-- Login Ends Here -->
						</li>
						<div class="clear"> </div>
					</ul>
				</div>
				<div class="clear"> </div>
				</div>
				<div class="clear"> </div>
			</div>
			</div>
			<!---//End-header---->
</body>
</html>