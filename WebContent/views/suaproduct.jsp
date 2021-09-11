<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
			URL.revokeObjectURL(output.src) // free memory
		}
	};
</script>

<div class="container">
	<form class="well form-horizontal" action="suaproductsubmit.html"
		method="post" id="contact_form">
		<fieldset>

			<!-- Form Name -->
			<h2>
				<b>Detail product</b>
			</h2>
			<br>
			<!-- Text input-->
			<c:forEach items="${detailpro}" var="p">
				<div class="form-group">
					<label class="col-md-4 control-label">ID Product</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="idproduct" placeholder="Mã sản phẩm"
								class="form-control" type="text" value="${p.id}" required="required">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Name</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="name" placeholder="Name" class="form-control"
								type="text" value="${p.name}" required="required">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Category</label>
					<div class="col-md-4 selectContainer">
						<div class="input-group">
							<select name="idcate" class="form-control selectpicker">
								<c:forEach items="${dscate}" var="cate">
									<option value="${cate.id}"
										<c:if test="${cate.id eq p.category}">selected="selected"</c:if>>${cate.title}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Price</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="price" placeholder="Gía gốc" class="form-control"
								type="text" value="${p.price}" required="required">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Amount</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="amount" placeholder="Số lượng"
								class="form-control" type="text" value="${p.amount}" required="required">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Image</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input type="file" accept="image/*" onchange="loadFile(event)" name="image">
							<img id="output" src="img/product/${p.image}"/>
							
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Sale</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<input name="sale" placeholder="Gía khuyến mãi"
								class="form-control" type="text" value="${p.sale}" required="required">
						</div>
					</div>
				</div>
			


				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Description</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<textarea id="description" name="description" required="required"
								style="width: 450px; height: 100px">${p.description}</textarea>
						</div>
					</div>
				</div>


				<div class="form-group">
					<label class="col-md-4 control-label">Sex</label>
					<div class="col-md-4 selectContainer">
						<div class="input-group">
							<select name="sex" class="form-control selectpicker">
								<option value="${p.sex}" selected="selected">${p.sex}</option>
								<option value="all">all</option>
								<option value="nam">nu</option>
								<option value="nam">nam</option>
							</select>
						</div>
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<br>

						<button type="submit" class="btn btn-warning" name="btnSua">
							SUBMIT <span class="glyphicon glyphicon-send"></span>
						</button>
						<a href="adminproduct.html" style="float: right;">Xem DS</a>
						</td>
					</div>
				</div>
			</c:forEach>
		</fieldset>
	</form>
</div>


