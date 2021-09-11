<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- product main items area start -->
<div class="product-main-items">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="location">
					<ul>
						<li><a href="index.html" title="go to homepage">Home<span>/</span></a></li>
						<li><a href="index.html"><strong> shop </strong><span>/</span></a></li>
						<li><a href="productgioitinh.html?sex=${sex1}"><strong><i><b>
											${sex1}</b></i></strong></a></li>

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
									<li class="${j.id==id?"current":""}"s><a
										href="product.html?id=${j.id}&&sex=${sex1}&&title=${j.title}" >${j.title}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="single-sidebar price">
						<div class="single-sidebar-title">
							
						</div>
						<div class="single-sidebar price">
							
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
								<c:forEach var="p3" items="${dsptgt}">
									<div class="col-lg-4 col-sm-6">
										<div class="single-product">
											
											<div class="product-img">
												<a href="detailproduct.html?idpro=${p3.id}" title=""
													class="thumb"> <img class="primary-img-1"
													alt="${p3.image}" src="img/product/${p3.image}"> <img
													class="primary-img-2" alt="${p3.image}"
													src="img/product/${p3.image}">
												</a>
											</div>
											<div class="actions">
												<a href="addtocart.html?idproC=${p3.id}&&size=35&&color=Black&&qty=1"><button type="submit" class="cart-btn" title="Add to cart">Buy
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
													<a href="detailproduct.html?idpro=${p3.id}">${p3.name}</a>
												</div>
												<div class="price-rating">
													<span> ${p3.sale}.VND </span> <small>${p3.price}.VND</small>
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

							<div role="tabpanel" class="tab-pane fade home2" id="list">
								<div class="product-catagory">
									<div class="single-list-product">
										<div class="col-sm-4">
											<div class="list-product-img">
												<a href="single-product.html"> <img
													src="img/product/1.png" alt="">
												</a>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="list-product-info">
												<a href="single-product.html" class="list-product-name">
													Cras neque metus</a>
												<div class="price-rating">
													<span class="old-price">$700.00</span> <span>$800.00</span>
													<div class="ratings">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-half-o"></i> <a href="#" class="review">1
															Review(s)</a> <a href="#" class="add-review">Add Your
															Review</a>
													</div>
												</div>
												<div class="list-product-details">
													<p>
														Nunc facilisis sagittis ullamcorper. Proin lectus ipsum,
														gravida et mattis vulputate, tristique ut lectus. Sed et
														lorem nunc. Vestibulum ante ipsum primis in faucibus orci
														luctus et ultrices posuere cubilia Curae; Aenean eleifend
														laoreet congue. Vivamus adipiscing nisl ut dolor dignissim
														semper. Nul <a href="single-product.html">Learn More</a>
													</p>
												</div>
											</div>
										</div>
									</div>
									<div class="single-list-product">
										<div class="col-sm-4">
											<div class="list-product-img">
												<a href="single-product.html"> <img
													src="img/product/6.png" alt="">
												</a>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="list-product-info">
												<a href="single-product.html" class="list-product-name">
													Cras neque metus</a>
												<div class="price-rating">
													<span class="old-price">$700.00</span> <span>$800.00</span>
													<div class="ratings">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-half-o"></i> <a href="#" class="review">1
															Review(s)</a> <a href="#" class="add-review">Add Your
															Review</a>
													</div>
												</div>
												<div class="list-product-details">
													<p>
														Nunc facilisis sagittis ullamcorper. Proin lectus ipsum,
														gravida et mattis vulputate, tristique ut lectus. Sed et
														lorem nunc. Vestibulum ante ipsum primis in faucibus orci
														luctus et ultrices posuere cubilia Curae; Aenean eleifend
														laoreet congue. Vivamus adipiscing nisl ut dolor dignissim
														semper. Nul <a href="single-product.html">Learn More</a>
													</p>
												</div>
											</div>
										</div>
									</div>
									<div class="single-list-product">
										<div class="col-sm-4">
											<div class="list-product-img">
												<a href="single-product.html"> <img
													src="img/product/3.png" alt="">
												</a>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="list-product-info">
												<a href="single-product.html" class="list-product-name">
													Cras neque metus</a>
												<div class="price-rating">
													<span class="old-price">$700.00</span> <span>$800.00</span>
													<div class="ratings">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-half-o"></i> <a href="#" class="review">1
															Review(s)</a> <a href="#" class="add-review">Add Your
															Review</a>
													</div>
												</div>
												<div class="list-product-details">
													<p>
														Nunc facilisis sagittis ullamcorper. Proin lectus ipsum,
														gravida et mattis vulputate, tristique ut lectus. Sed et
														lorem nunc. Vestibulum ante ipsum primis in faucibus orci
														luctus et ultrices posuere cubilia Curae; Aenean eleifend
														laoreet congue. Vivamus adipiscing nisl ut dolor dignissim
														semper. Nul <a href="single-product.html">Learn More</a>
													</p>
												</div>
											</div>
										</div>
									</div>
									<div class="single-list-product">
										<div class="col-sm-4">
											<div class="list-product-img">
												<a href="single-product.html"> <img
													src="img/product/4.png" alt="">
												</a>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="list-product-info">
												<a href="single-product.html" class="list-product-name">
													Cras neque metus</a>
												<div class="price-rating">
													<span class="old-price">$700.00</span> <span>$800.00</span>
													<div class="ratings">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-half-o"></i> <a href="#" class="review">1
															Review(s)</a> <a href="#" class="add-review">Add Your
															Review</a>
													</div>
												</div>
												<div class="list-product-details">
													<p>
														Nunc facilisis sagittis ullamcorper. Proin lectus ipsum,
														gravida et mattis vulputate, tristique ut lectus. Sed et
														lorem nunc. Vestibulum ante ipsum primis in faucibus orci
														luctus et ultrices posuere cubilia Curae; Aenean eleifend
														laoreet congue. Vivamus adipiscing nisl ut dolor dignissim
														semper. Nul <a href="single-product.html">Learn More</a>
													</p>
												</div>
											</div>
										</div>
									</div>
									<div class="single-list-product">
										<div class="col-sm-4">
											<div class="list-product-img">
												<a href="single-product.html"> <img
													src="img/product/5.png" alt="">
												</a>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="list-product-info">
												<a href="single-product.html" class="list-product-name">
													Cras neque metus</a>
												<div class="price-rating">
													<span class="old-price">$700.00</span> <span>$800.00</span>
													<div class="ratings">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-half-o"></i> <a href="#" class="review">1
															Review(s)</a> <a href="#" class="add-review">Add Your
															Review</a>
													</div>
												</div>
												<div class="list-product-details">
													<p>
														Nunc facilisis sagittis ullamcorper. Proin lectus ipsum,
														gravida et mattis vulputate, tristique ut lectus. Sed et
														lorem nunc. Vestibulum ante ipsum primis in faucibus orci
														luctus et ultrices posuere cubilia Curae; Aenean eleifend
														laoreet congue. Vivamus adipiscing nisl ut dolor dignissim
														semper. Nul <a href="single-product.html">Learn More</a>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="toolbar-bottom">
							<ul>
								<li><span>Pages:</span></li>
								<c:forEach begin="1" end="${tongSoTrang}" step="1" var="i">
									<li class="${i==trang?"current":""}"><a href="productgioitinh.html?trang=${i}&&sex=${sex1}">${i}</a></li>
								</c:forEach>
								<li ><a
									href="productgioitinh.html?trang=${trang==tongSoTrang?tongSoTrang:trang+1}&&sex=${sex1}">
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