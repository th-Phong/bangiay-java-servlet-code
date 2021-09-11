<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="main-content-wp" class="detail-product-page">

	<!-- single product area start -->
	<div class="Single-product-location home2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="location">
						<ul>
							<li><a href="index.html" title="Go to homepage">Home<span>/</span></a>
								<c:forEach var="p" items="${chitietsanpham}">
									<li><strong><i><b> ${p.name}</b></i></strong></li>
								</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- single product area end -->

	<!-- single product details start -->
	<div class="single-product-details">
		<c:forEach var="p" items="${chitietsanpham}">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="single-product-img tab-content">
							<div class="single-pro-main-image tab-pane active"
								id="pro-large-img-1">
								<a href="#"> <img class="optima_zoom"
									src="img/product/${p.image}"
									data-zoom-image="img/product/${p.image}">
								</a>
							</div>
						</div>
						<div class="product-page-slider"></div>
					</div>
					<div class="col-sm-6">
						<div class="single-product-details">
							<a href="detailproduct.html?idpro=${p.id}" class="product-name"
								style="color: green; font-size: 25px"> ${p.name} </a>
							<div class="list-product-info">
								<div class="price-rating">
									<div class="ratings">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star-half-o"></i> <a href="#" class="review">1
											Review(s)</a> <a href="#" class="add-review">Add Your Review</a>
									</div>
								</div>
							</div>
							<div class="avalable">
								<p>
									Availability:<span> In stock</span>
								</p>
							</div>
							<div class="item-price">
								<span>${p.sale}.VND </span> <span class="price-new"
									style="text-decoration: line-through; font-size: 14px;">${p.price}.VND</span>


								<form action="addtocart.html?idproC=${p.id}" method="POST">
									<input type="hidden" name="namess" value=""> <input
										type="hidden" name="idproductss" value="">
									<div class="select-catagory">
										<div class="color-select">
											<label class="required"> <em>*</em> Color
											</label>
											<div class="input-box">
												<select name="color" id="color">
													<option value="">-- Please Select --</option>
													<option value="Black" selected="selected">Black</option>
													<option value="Blue">Blue</option>
													<option value="Green">Green</option>
												</select>
											</div>
										</div>

										<div class="size-select">
											<label class="required"> <em>*</em> Size
											</label>
											<div class="input-box">
												<select name="size" id="size">
													<option value="">-- Please Select --</option>
													<option value="35" selected="selected">35</option>
													<option value="36">36</option>
													<option value="37">37</option>
													<option value="38">38</option>
													<option value="39">39</option>
													<option value="40">40</option>
												</select>
											</div>
										</div>

									</div>
									<div class="cart-item">
										<div class="single-cart">
											<div class="cart-plus-minus">
												<label>Qty: </label> <input class="cart-plus-minus-box"
													type="text" name="qty" value="1" min="1" max="10" >
											</div>
											<input class="cart-btn" type="submit" value="Add to cart" name="submit"></input>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- single product details end -->
	<!-- single product tab start -->
	<div class="single-product-tab-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="single-product-tab">
						<ul class="single-product-tab-navigation" role="tablist">
							<li role="presentation" class="active"><a href="#tab1"
								aria-controls="tab1" role="tab" data-toggle="tab">Product
									Description</a></li>
							<li role="presentation"><a href="#tab2" aria-controls="tab2"
								role="tab" data-toggle="tab">comments</a></li>
							<li role="presentation"><a href="#tab3" aria-controls="tab3"
								role="tab" data-toggle="tab">product tag</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content single-product-page">
							<div role="tabpanel" class="tab-pane fade in active" id="tab1">
								<div class="single-p-tab-content">
									<c:forEach var="p" items="${chitietsanpham}">
										<p>${p.description}</p>
									</c:forEach>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="tab2">
								<div class="single-p-tab-content">
									<div class="row">

										<div
											style="padding: 20px; border: 1px dotted gray; width: 100%; margin: 5px; border-radius: 10px;">
											<STRONG>Tên người bình luận</STRONG>

											<p style="padding-left: 30px">Nội dug bình luận</p>
										</div>

										<form action="" method="POST"
											style="margin-top: 20px; border: 1px dotted gray; padding-left: 10px; padding-top: 5px; border-radius: 10px">
											<input
												style="margin-top: 10px; font-family: inherit; font-size: inherit; line-height: inherit; height: 40px; display: block; padding: 10px 10px; border: 1px solid #ddd; width: 35%; margin-bottom: 15px;"
												type="text" name="namemember" placeholder="Tên của bạn"><br>
											<textarea placeholder="Nội dung..."
												style="font-family: inherit; font-size: inherit; line-height: inherit; height: 50px; display: block; padding: 5px 10px; border: 1px solid #ddd; width: 95%; margin-bottom: 15px; resize: none;"
												name="noidung"></textarea>
											<br> <input
												style="display: block; border: none; outline: none; background: #4fa327; color: #fff; padding: 8px 20px; margin-bottom: 50px;"
												type="submit" name="submitcomment" value="ADD COMMENT">
										</form>

									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="tab3">
								<div class="single-p-tab-content">
									<div class="add-tab-title">
										<p>add your tag</p>
									</div>
									<div class="add-tag">
										<form action="#">
											<input type="text">
											<button type="submit">add tags</button>
										</form>
									</div>
									<p class="tag-rules">Use spaces to separate tags. Use
										single quotes (') for phrases.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- single product tab end -->
	<!-- upsell product area start-->
	<div class="upsell-product home2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-title">
						<h2>new products</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="upsell-slider">
					<c:forEach var="p2" items="${dsp_new2}">
						<div class="col-md-12">
							<div class="single-product">
								<div class="level-pro-new">
									<span>new</span>
								</div>
								<div class="product-img">
									<a href="detailproduct.html?idpro=${p2.id}" title=""
										class="thumb"> <img class="primary-img-1"
										alt="${p2.image}" src="img/product/${p2.image}"> <img
										class="primary-img-2" alt="${p2.image}"
										src="img/product/${p2.image}">
									</a>
								</div>
								<div class="list-product-info">
									<div class="price-rating">
										<div class="ratings">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-half-o"></i> <a href="#" class="review">1
												Review(s)</a> <a href="#" class="add-review">Add Your Review</a>
										</div>
									</div>
								</div>
								<div class="product-price">
									<div class="product-name">
										<a href="detailproduct.html?idpro=${p2.id}"><b><i>${p2.name}</i></b></a>
									</div>
									<div class="price-rating">
										<span>${p2.sale}.VND</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- upsell product area end-->
</div>