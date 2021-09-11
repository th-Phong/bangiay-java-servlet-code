<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="main-content-wp" class="checkout-page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="location">
					<ul>
						<li><a href="index.html" title="go to homepage">Home<span>/</span></a>
						</li>
						<li><strong> checkout</strong></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<c:if test="${sessionScope.order.tongtien==0||sessionScope.order==null}">
				<div class="shopping-button">
					<h2>Giỏ hàng rỗng :))</h2>
					<button id="btnred" onclick="location.href='index.html'"
						type="submit">Bắt đầu mua sắm</button>
				</div>
			</c:if>
		<c:if test="${sessionScope.order.tongtien!=0&&sessionScope.order!=null}">
			<div id="wrapper" class="wp-inner clearfix">
				<form method="POST" action="addorder.html" name="form-checkout">
					<div class="section" id="customer-info-wp">
						<div class="section-head">
							<h1 class="section-title">Thông tin khách hàng</h1>
						</div>
						<div class="section-detail">

							<div class="form-row clearfix">
								<div class="form-col fl-left">
									<label for="fullname">Họ tên</label> <input type="text"
										name="name" id="name" value="${sessionScope.acc.name}"
										required>
								</div>
								<div class="form-col fl-right">
									<label for="email">Email</label> <input type="email"
										name="email" id="email" value="${sessionScope.acc.email}"
										required>
								</div>
							</div>
							<div class="form-row clearfix">
								<div class="form-col fl-left">
									<label for="address">Địa chỉ</label> <input type="text"
										name="address" id="address"
										value="${sessionScope.acc.address}" required>
								</div>
								<div class="form-col fl-right">
									<label for="phone">Số điện thoại</label> <input type="tel"
										name="phone" id="phone" value="${sessionScope.acc.phone}"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-col">
									<label for="notes">Ghi chú</label>
									<textarea name="note" placeholder="..."></textarea>
								</div>
							</div>
						</div>
					</div>

					<div class="section" id="order-review-wp">
						<div class="section-head">
							<h1 class="section-title">Thông tin đơn hàng</h1>
						</div>
						<div class="section-detail">
							<table class="shop-table">
								<thead>
									<tr>
										<td>Sản phẩm</td>
										<td>Tổng</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="p" items="${sessionScope.order.items}">
										<tr class="cart-item">
											<td class="product-name"><a
												href="detailproduct.html?idpro=${p.pro.id}">${p.pro.name}
													(size:${p.size}) x <strong class="product-quantity">${p.soluong}</strong>
											</a></td>
											<td class="product-total">${p.pro.sale*p.soluong}.VND</td>
										</tr>
									</c:forEach>
								</tbody>

								<tfoot>
									<tr class="order-total">
										<td>Tổng đơn hàng:</td>
										<td><strong class="total-price" style="font-size: 20px">${sessionScope.order.tongtien}
										</strong> VNĐ</td>
									</tr>
								</tfoot>
							</table>
							<div id="payment-checkout-wp">
								<ul id="payment_methods">
									<li><input type="radio" id="direct-payment"
										checked="checked" name="payment-method"
										value="Thanh toán tại cửa hàng"> <label
										for="direct-payment">Thanh Toán Khi Nhận Hàng</label></li>
									<li><input type="radio" id="payment-home"
										name="payment-method" value="Thanh toán online"> <label
										for="payment-home">Thanh Toán Online</label></li>
								</ul>
							</div>
							<div class="place-order-wp clearfix">
								<input type="submit" id="order-now" value="Đặt hàng" name="ok">
							</div>
						</div>

					</div>
				</form>
			</div>
		</c:if>
	</div>
	<br>
</div>