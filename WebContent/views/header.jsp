<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
	<div class="top-link">
		<div class="container">
			<div class="row">
				<div class="col-md-7 col-md-offset-3 col-sm-9 hidden-xs">
					<div class="site-option"></div>
					<div class="call-support">
						<p>
							<c:if test="${sessionScope.acc!=null}">
								Hello <span>${sessionScope.username}</span>
							</c:if>
						</p>
					</div>
				</div>
				<div class="col-md-2 col-sm-3">
					<div class="dashboard">
						<div class="account-menu">
							<ul>
								<li class="search"><a href="#"> <i class="fa fa-search"></i>
								</a>
									<ul class="search">
										<li>
											<form action="search.html" method="get">
												<input type="text" name="q" placeholder="Search...">
												<button>
													<i class="fa fa-search"></i>
												</button>
											</form>
										</li>
									</ul></li>
								<li><a href="#"> <i class="fa fa-bars"></i>
								</a>
									<ul>
										<li><a href="#">my account</a></li>
										<li><a href="#">my wishlist</a></li>
										<li><a href="index.html?cart=1">my cart</a></li>
										<li><a href="checkout.html">Checkout</a></li>
										<li><a href="#">Blog</a></li>
										<c:if test="${sessionScope.acc!=null}">
											<li><a href="logout.html">Log out</a></li>
										</c:if>
										<c:if test="${sessionScope.acc==null}">
											<li><a href="index.html?log=1">Log in</a></li>
										</c:if>
									</ul></li>
							</ul>
						</div>
						<div class="cart-menu">
							<ul>
								<li><a href="index.html?cart=1"> <img
										src="img/icon-cart.png" alt=""> <c:if
											test="${sessionScope.order!=null}">
											<span>${sessionScope.soluongincart}</span>
										</c:if>
								</a> <c:if test="${sessionScope.order!=null}">

										<div class="cart-info">
											<ul>
												<c:forEach var="p" items="${sessionScope.order.items}">
													<li>
														<div class="cart-img">
															<a href="detailproduct.html?idpro=${p.pro.id}"><img
																src="img/product/${p.pro.image}" alt="" width="70px"
																height="70px"></a>

														</div>
														<div class="cart-details">
															<a href="detailproduct.html?idpro=${p.pro.id}">${p.pro.name}
																- size:${p.size}</a>
															<p>${p.soluong}x ${p.pro.sale}</p>
														</div>
														<div class="btn-remove">
															<a href="deleteone.html?idprodel=${p.pro.id}"></a>
														</div>
													</li>
												</c:forEach>

											</ul>
											<h3>
												Subtotal: <span>${sessionScope.order.tongtien} <small>VND</small></span>
											</h3>
											<a href="checkout.html" class="checkout">checkout</a>
										</div>
									</c:if></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mainmenu-area product-items">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="logo">
						<a href="index.html"> <img src="img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-9">
					<div class="mainmenu">
						<nav>
							<ul>
								<li><a href="index.html">Home</a></li>
								<li class="mega-women"><a
									href="productgioitinh.html?sex=nu">Women</a>
									<div class="mega-menu women">
										<div class="part-1">
											<c:forEach var="j" items="${dscate}">
												<span><a
													href="product.html?id=${j.id}&&sex=nu&&title=${j.title}">${j.title}</a></span>
											</c:forEach>
										</div>
										<div class="part-2">
											<a href="#"> <img src="img/banner/menu-banner.png" alt="">
											</a>
										</div>
									</div></li>
								<li class="mega-men"><a href="productgioitinh.html?sex=nam">Men</a>
									<div class="mega-menu women">
										<div class="part-1">
											<c:forEach var="o" items="${dscate}">
												<span> <a href="product.html?id=${o.id}&&sex=nam">${o.title}</a>
												</span>
											</c:forEach>
										</div>
										<div class="part-2">
											<a href="#"> <img src="img/banner/menu-banner.png" alt="">
											</a>
										</div>
									</div></li>
								
								<li class="mega-jewellery"><c:if
										test="${sessionScope.acc!=null}">
										<a href="logout.html">Logout</a>
									</c:if> <c:if test="${sessionScope.acc==null}">
										<a href="index.html?log=1">Login</a>
									</c:if></li>
								<c:if test="${sessionScope.acc.isadmin==1}">
									<li><a href="order.html">ADMIN ORDER</a></li>
								</c:if>
								<c:if test="${sessionScope.acc.isadmin==1}">
									<li><a href="adminproduct.html">ADMIN PRODUCT</a></li>
								</c:if>
								<li><a href="index.html">Pages</a>
									<div class="sub-menu pages">
										<span> <a href="#">About us</a>
										</span> <span> <a href="#">Blog</a>
										</span> <span> <a href="#">Blog Details</a>
										</span> <span> <a href="index.html?cart=ok">Cart</a>
										</span> <span> <a href="index.html?checkout=ok">Checkout</a>
										</span> <span> <a href="#">Contact</a>
										</span> <span> <a href="#">My account</a>
										</span> <span> <a href="index.html">Shop</a>
										</span> <span> <c:if test="${sessionScope.acc!=null}">
												<a href="logout.html">Logout</a>
											</c:if> <c:if test="${sessionScope.acc==null}">
												<a href="index.html?log=1">Login page</a>
											</c:if>
										</span> <span> <a href="#">Ragister page</a>
										</span> <span> <a href="#">Wishlist</a>
										</span>
									</div></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- header area end -->