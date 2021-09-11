<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">

	<form class="well form-horizontal" action="suaorder.html" method="get"
		id="contact_form">
		<fieldset>

			<!-- Form Name -->
			<h2>
				<b>Detail order</b>
			</h2>
			<br>
			<!-- Text input-->
			<c:forEach items="${order}" var="o">
				<div class="form-group">
					<label class="col-md-4 control-label">ID order</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="idorder" placeholder="ID order" class="form-control"
								type="text" value="${o.id}" >
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Địa chỉ</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="diachi" placeholder="Địa chỉ" class="form-control"
								type="text" value="${o.diachi}">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Hình thức thanh toán</label>
					<div class="col-md-4 selectContainer">
						<div class="input-group">
							<select name="hinhthucthanhtoan"
								class="form-control selectpicker"><option
									value="${o.hinhthuc}" selected="selected">${o.hinhthuc}</option>
								<option value="Thanh toán tại cửa hàng" >Thanh toán tại
									cửa hàng</option>
								<option value="Thanh toán online">Thanh
									toán online</option>
							</select>
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Username</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="username" placeholder="Username"
								class="form-control" type="text" value="${o.username}" disabled="disabled">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Tên khách hàng</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="tenkhachhang" placeholder="Tên khách hàng"
								class="form-control" type="text" value="${o.tenkhachhang}">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Số điện thoại</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="sodienthoai" placeholder="Số điện thoại"
								class="form-control" type="text" value="${o.phone}">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label">Tổng tiền hóa đơn</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="tongtien" placeholder="Tổng tiền hóa đơn"
								class="form-control" type="text" value="${o.tongtien}">
						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">E-Mail</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="email" placeholder="E-Mail Address"
								class="form-control" type="text" value="${o.email}">
						</div>
					</div>
				</div>


				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Ghi chú</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<textarea id="ghichu" name="ghichu" style="width: 300px">${o.note}</textarea>
						</div>
					</div>
				</div>


				<div class="form-group">
					<label class="col-md-4 control-label">Trạng thái đơn hàng</label>
					<div class="col-md-4 selectContainer">
						<div class="input-group">
							<select name="trangthaidonhang" class="form-control selectpicker">
								<option value="${o.tinhtrang}" selected="selected">${o.tinhtrang}</option>
								<option value="Thành công">Thành công</option>
								<option value="Đang xử lý">Đang xử lý</option>
							</select>
						</div>
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<br>

						<button type="submit" class="btn btn-warning" name="btnSua" >
							SUBMIT <span class="glyphicon glyphicon-send"></span>
						</button>
						<a href="order.html" style="float: right;">Xem DS</a></td>
					</div>
				</div>
			</c:forEach>
		</fieldset>
	</form>
</div>

<!-- /.container -->