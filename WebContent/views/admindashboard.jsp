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
	<div class="shopping-cart">
		<div class="container" style="width: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="location">
						<ul>
							<li><a href="index.html" title="go to homepage">Home<span>/</span></a>
							</li>
							<li><strong> Manager Orders</strong></li>
						</ul>
					</div>
				</div>
			</div>


			<!-- Cart start -->
			<div class="row" style="width: auto;">
				<div class="col-md-12" style="width: auto">
					<div class="" style="width: auto;">
						<form action="xoachonorder.html" method="get">
							<table class="table-bordered table table-hover"
								style="width: auto;">
								<thead>
									<tr>
										<th>
											<button type="submit" >Xóa chọn</button>
										</th>
										<th class="cart-item-img">Id</th>
										<th class="cart-product-name">Địa chỉ</th>
										<th class="unit-price">Tổng tiền</th>
										<th class="quantity">Tên khách hàng</th>
										<th class="quantity">Email</th>
										<th class="quantity">Điện thoại</th>
										<th class="subtotal">Ghi chú</th>
										<th class="quantity">Hình thức thanh toán</th>
										<th class="subtotal">Tình trạng đơn hàng</th>
										<th class="subtotal">User name</th>
										<th class="remove-icon"></th>
										<th class="remove-icon"></th>
									</tr>
								</thead>

								<tbody class="text-center">
									<c:forEach var="o" items="${dsorder}">
										<tr>
											<td><input name="xoachon" value="${o.id}"
												type="checkbox" /></td>
											<td>${o.id} </td>
											<td>${o.diachi}</td>
											<td>${o.tongtien} </td>
											<td>${o.tenkhachhang}</td>
											<td>${o.email} </td>
											<td>${o.phone}</td>
											<td>${o.note}</td>
											<td>${o.hinhthuc}</td>
											<td>${o.tinhtrang} </td>
											<td>${o.username} </td>
											<td><a href="layhoadontheoma.html?mahoadon=${o.id}">
													<img src="img/cart/btn_edit.gif" alt="">
											</a></td>
											<td><a href="xoaorder.html?id=${o.id}"> <img
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
						</form>
						
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-4" style="float: right;">
					<div class="totals">
						<div class="shopping-button">
							<button id="btnred" onclick="location.href='checkout.html'"
								type="submit" style="background-color: green;">Thêm mới</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
