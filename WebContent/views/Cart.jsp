<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.rowcell222 {
	height: 120px;
	line-height: 120px;
}
</style>
<div id="main-content-wp" class="cart-page">
	<!-- cart item area start -->
	<div class="shopping-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="location">
						<ul>
							<li><a href="index.html" title="go to homepage">Home<span>/</span></a>
							</li>
							<li><strong> Shopping cart</strong></li>
						</ul>
					</div>
				</div>
			</div>
			<c:if test="${sessionScope.order.tongtien==0||sessionScope.order==null}">
				<div class="shopping-button">
					<h2>Giỏ hàng rỗng :))</h2>
					<button id="btnred" onclick="location.href='index.html'"
						type="submit">Bắt đầu mua sắm</button>
				</div>
			</c:if>
			
			<c:if test="${sessionScope.order.tongtien!=0&&sessionScope.order!=null}">
				<!-- Cart start -->
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table-bordered table table-hover">
								<thead>
									<tr>
										<th class="cart-item-img">Image</th>
										<th class="cart-product-name">Product Name</th>
										<th class="unit-price">Unit Price</th>
										<th class="quantity">Qty</th>
										<th class="quantity">Color</th>
										<th class="quantity">Size</th>
										<th class="subtotal">Subtotal (Price*Qty)</th>
										<th class="remove-icon"></th>
									</tr>
								</thead>

								<tbody class="text-center">
									<c:forEach var="p" items="${sessionScope.order.items}">
										<tr>
											<td class="cart-item-img"><a
												href="detailproduct.html?idpro=${p.pro.id}" title=""
												class="thumb"> <img src="img/product/${p.pro.image}"
													alt="" width="100px" height="100px">
											</a></td>
											<td style="height: 100px; line-height: 100px;"><a
												href="detailproduct.html?idpro=${p.pro.id}" title="">${p.pro.name}</a></td>
											<td style="height: 100px; line-height: 100px;">${p.pro.sale}</td>
											<td style="height: 100px; line-height: 100px;">${p.soluong}</td>
											<td
												style="height: 100px; line-height: 100px; color: ${p.color}">${p.color}</td>
											<td style="height: 100px; line-height: 100px;">${p.size}</td>
											<td style="height: 100px; line-height: 100px;">${p.pro.sale*p.soluong}.VND</td>
											<td class="remove-icon"><a
												href="deleteone.html?idprodel=${p.pro.id}"> <img
													src="img/cart/btn_remove.png" alt="">
											</a></td>
										</tr>
									</c:forEach>
								</tbody>

								<tfoot style="display: none;">
									<tr>
										<td colspan="7">
											<div class="clearfix">
												<div class="fl-right"></div>
											</div>
										</td>
									</tr>
								</tfoot>
							</table>

							<div class="shopping-button">
								<div class="continue-shopping">
									<button id="btnred" type="submit"
										onclick="location.href='index.html'">continue
										shopping</button>
								</div>
								<div class="shopping-cart-left">
									<button id="btnred" type="submit"
										onclick="location.href='deletecart.html'">Clear
										Shopping Cart</button>
									<button id="btnred" type="submit" id="update-cart"
										onclick="location.href='?page=cart'">Update Shopping
										Cart</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-4" style="float: right;">

						<div class="totals">

							<h3>
								Grand Total: <span><i>${sessionScope.order.tongtien}
										<small>VND</small>
								</i></span>
							</h3>
							<div class="shopping-button">
								<button id="btnred" onclick="location.href='checkout.html'"
									type="submit">proceed to checkout</button>
							</div>
						</div>

					</div>
				</div>
				<!-- Cart end -->
			</c:if>

		</div>
	</div>

</div>
