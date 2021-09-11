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
							<li><strong> Manager Products</strong></li>
						</ul>
					</div>
				</div>
			</div>


			<!-- Cart start -->
			<div class="row" style="width: auto;">
				<div class="col-md-12" style="width: auto">
					<div class="" style="width: auto;">
						<form action="adminxoachonproduct.html" method="post">
							<table class="table-bordered table table-hover"
								style="width: auto;">
								<thead>
									<tr>
										<th>
											<button type="submit" >Xóa chọn</button>
										</th>
										<th class="cart-item-img">Idproduct</th>
										<th class="cart-product-name">Name</th>
										<th class="unit-price">Price</th>
										<th class="quantity">Amount</th>
										<th class="quantity">Image</th>
										<th class="quantity">Category</th>
										<th class="subtotal">Sale</th>
										<th class="quantity">Description</th>									
										<th class="subtotal">Sex</th>
										<th class="remove-icon"></th>
										<th class="remove-icon"></th>
									</tr>
								</thead>

								<tbody class="text-center">
									<c:forEach var="p" items="${dsproduct}">
										<tr>
											<td style="width: 40px;"><input name="xoachon" value="${p.id}"
												type="checkbox" /></td>
											<td style="width: 40px;">${p.id} </td>
											<td>${p.name}</td>
											<td>${p.price} </td>
											<td>${p.amount}</td>
											<td style="width: 180px;"><image alt="${p.image}" src="img/product/${p.image}"/></td>
											<td>${p.category}</td>
											<td>${p.sale}</td>
											<td style="width: 330px;">${p.description}</td>										
											<td>${p.sex}</td>
											<td><a href="suaproduct.html?idpro2=${p.id}&&hinh=${p.image}">
													<img src="img/cart/btn_edit.gif" alt="">
											</a></td>
											<td><a href="adminxoasanpham.html?idpro2=${p.id}"> <img
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
							<button id="btnred" onclick="location.href='index.html?adminthemsanpham=ok'"
								type="submit" style="background-color: green;">Thêm mới</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
    