<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- link area start -->
<div class="shopping-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="location">
					<ul>
						<li><a href="index.html" title="Go to homepage">Home<span>/</span></a>
						</li>
						<li><a href="index.jsp?log=1" title="Login"><strong>Login
									page</strong></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- link area end -->
<!-- login area start -->
<div class="login-area">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center">
				<div class="login">
					<div class="login-form-container">
						<div class="login-text">
							<h2>login</h2>
							<span>Please login using account detail bellow.</span>

						</div>
						<div class="login-form">
							<form action="login.html" method="post">
								<input type="text" name="username" placeholder="Username">
								<input type="password" name="password" placeholder="Password">
								<c:if test="${mess!=null}">
									<span style="color: rgb(224, 53, 80);">${mess}</span>
								</c:if>
								<div class="button-box">
									<div class="login-toggle-btn">
										<input type="checkbox" id="remember"> <label
											for="remember">Remember me</label> <a href="#">Forgot
											Password?</a>
									</div>
									<button type="submit" class="default-btn">Login</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- login area end -->