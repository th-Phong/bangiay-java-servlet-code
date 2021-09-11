<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="main-content-wp" class="home-page">
	<!-- sell area start -->
	<div class="sell-area home2">
		<div class="sell-heading">
			<h2>Best seller of The James</h2>
		</div>
		<div class="sell-slider">
			<c:forEach var="p" items="${ds_bestseller}">
				<div class="single-product">
					<div class="level-pro-new">
						<span>Best seller</span>
					</div>
					<div class="product-img">
						<a href="detailproduct.html?idpro=${p.id}"> <img
							src="img/product/${p.image}" alt="" class="primary-img">
						</a>
					</div>
					<div class="actions">
						<a
							href="addtocart.html?idproC=${p.id}&&size=35&&color=Black&&qty=1">
							<button type="submit" class="cart-btn" title="Add to cart">add
								to cart</button>
						</a>
						<ul class="add-to-link">
							<li><a href="#"> <i class="fa fa-heart-o"></i></a></li>
							<li><a href="#"> <i class="fa fa-refresh"></i></a></li>
						</ul>
					</div>
					<div class="product-price">
						<div class="product-name">
							<a href="detailproduct.html?idpro=${p.id}" title="${p.name}">${p.name}</a>
						</div>
						<div class="price-rating">
							<span>${p.sale} <small>VND</small></span>
							<div class="ratings">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-half-o"></i>
							</div>
						</div>
					</div>

				</div>
			</c:forEach>
		</div>
	</div>
	<!-- sell area end -->
	<!-- product main items area start -->
	<div class="product-main-items">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="location">
						<ul>
							<li><a href="index.html" title="go to homepage">Home<span>/</span></a>
							</li>
							<li><strong> shop</strong><span>/</span></li>
							<li><strong><i><b> ${title}</b></i></strong></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3">
					<div class="product-sidebar">
						<div class="sidebar-title">
							<h2>Shopping Options</h2>
						</div>
						<div class="single-sidebar">
							<div class="single-sidebar-title">
								<h3>Category</h3>
							</div>
							<div class="single-sidebar-content">
								<ul>
									<c:forEach var="j" items="${dscate}">
										<li class="${j.id==id?"current":""}"><a href="productdanhmucnogt.html?id=${j.id}&&title=${j.title}">${j.title}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>

						<div class="single-sidebar price">
							<div class="single-sidebar-title">
								
							</div>

						</div>
						<div class="banner-left">
							<a href="#"> <img src="img/product/banner_left.jpg" alt="">
							</a>
						</div>
					</div>
				</div>
				<div class="col-sm-9">
					<div class="product-bar">
						<ul class="product-navigation" role="tablist">
							<li role="presentation" class="active gird"><a href="#gird"
								aria-controls="gird" role="tab" data-toggle="tab"> <span>
										<img class="primary" src="img/product/grid-primary.png" alt="">
										<img class="secondary" src="img/product/grid-secondary.png"
										alt="">
								</span> Gird
							</a></li>
							<li role="presentation" class="list"><a href="#list"
								aria-controls="list" role="tab" data-toggle="tab"> <span>
										<img class="primary" src="img/product/list-primary.png" alt="">
										<img class="secondary" src="img/product/list-secondary.png"
										alt="">
								</span> List
							</a></li>
						</ul>
						<div class="sort-by">
							<label>Sort By</label> <select name="sort">
								<option value="#" selected>Name</option>
								<option value="#">Price</option>
							</select> <a href="#" title="Set Descending Direction"> <img
								src="img/product/i_asc_arrow.gif" alt="">
							</a>
						</div>
					</div>
					<div class="row">
						<div class="product-content">
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active fade in home2"
									id="gird">
									<c:forEach var="p" items="${dsp_danhmuc_no_gt}">
										<div class="col-lg-4 col-sm-6">
											<div class="single-product">
												
												<div class="product-img">
													<a href="detailproduct.html?idpro=${p.id}" title=""
														class="thumb"> <img class="primary-img-1"
														alt="${p.image}" src="img/product/${p.image}"> <img
														class="primary-img-2" alt="${p.image}"
														src="img/product/${p.image}">
													</a>
												</div>
												<div class="actions">
													<a
														href="addtocart.html?idproC=${p.id}&&size=35&&color=Black&&qty=1"><button
															type="submit" class="cart-btn" title="Add to cart">Buy
															Now</button></a>
													<ul class="add-to-link">
														<li><a class="modal-view" data-target="#productModal"
															data-toggle="modal" href="#"> <i class="fa fa-search"></i></a></li>
														<li><a href="#"> <i class="fa fa-heart-o"></i></a></li>
														<li><a href="#"> <i class="fa fa-refresh"></i></a></li>
													</ul>
												</div>
												<div class="product-price">
													<div class="product-name">
														<a href="?page=detailproduct&id=${p.id}">${p.name}</a>
													</div>
													<div class="price-rating">
														<span> ${p.sale} </span> <small>${p.price}</small>
														<div class="ratings">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star-half-o"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="toolbar-bottom">
								<ul>
									<li><span>Pages:</span></li>
									<c:forEach begin="1" end="${tongSoTrang}" step="1" var="i">
										<li class="${i==trang?"current":""}"><a href="index.html?trang=${i}" >${i}</a></li>
									</c:forEach>
									<li><a
										href="index.html?trang=${trang==tongSoTrang?tongSoTrang:trang+1}">
											<img src="img/product/pager_arrow_right.gif" alt="">
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- product main items area end -->
	<!-- new products area start -->
	<div class="new-product home2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-title">
						<h2>new products</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="features-home2-slider">
					<c:forEach var="p" items="${dsp_new}">
						<div class="col-md-12">
							<div class="single-product">
								<div class="level-pro-new">
									<span>new</span>
								</div>
								<div class="product-img">
									<a href="detailproduct.html?idpro=${p.id}" title=""
										class="thumb"> <img class="primary-img-1" alt="${p.image}"
										src="img/product/${p.image}"> <img class="primary-img-2"
										alt="${p.image}" src="img/product/${p.image}">
									</a>
								</div>
								<div class="actions">
									<a
										href="addtocart.html?idproC=${p.id}&&size=35&&color=Black&&qty=1"><button
											type="submit" class="cart-btn" title="Add to cart" onclick="">BuyNow</button></a>
									<ul class="add-to-link">
										<li><a class="modal-view" data-target="#productModal"
											data-toggle="modal" href="#"> <i class="fa fa-search"></i></a></li>
										<li><a href="#"> <i class="fa fa-heart-o"></i></a></li>
										<li><a href="#"> <i class="fa fa-refresh"></i></a></li>
									</ul>
								</div>
								<div class="product-price">
									<div class="product-name">
										<a href="detailproduct.html?id=${p.id}">${p.name}</a>
									</div>
									<div class="price-rating">
										<span> ${p.sale}.VND </span> <small
											style="text-decoration: line-through;">${p.price}.VND</small>
										<div class="ratings">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-half-o"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
	</div>
	<!-- new product area end -->
	
</div>