<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>The James</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<!-- favicon
        ============================================ -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- Bootstrap CSS
        ============================================ -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Bootstrap CSS
        ============================================ -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- owl.carousel CSS
        ============================================ -->
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/owl.theme.css">
<link rel="stylesheet" href="css/owl.transitions.css">
<!-- jquery-ui CSS
        ============================================ -->
<link rel="stylesheet" href="css/jquery-ui.css">
<!-- meanmenu CSS
        ============================================ -->
<link rel="stylesheet" href="css/meanmenu.min.css">
<!-- nivoslider CSS
        ============================================ -->
<link rel="stylesheet" href="lib/css/nivo-slider.css">
<link rel="stylesheet" href="lib/css/preview.css">
<!-- animate CSS
        ============================================ -->
<link rel="stylesheet" href="css/animate.css">
<!-- magic CSS
        ============================================ -->
<link rel="stylesheet" href="css/magic.css">
<!-- normalize CSS
        ============================================ -->
<link rel="stylesheet" href="css/normalize.css">
<!-- main CSS
        ============================================ -->
<link rel="stylesheet" href="css/main.css">
<!-- style CSS
        ============================================ -->
<link rel="stylesheet" href="css/style.css">
<!-- responsive CSS
        ============================================ -->
<link rel="stylesheet" href="css/responsive.css">



<!-- modernizr JS
        ============================================ -->
        
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="views/header.jsp" />
	<c:choose>
		<c:when test="${param.sex!=null&&param.id!=null}">
			<jsp:include page="views/slider2.jsp" />
			<jsp:include page="views/productdanhmuc.jsp" />
		</c:when>
		<c:when test="${param.sex!=null&&param.id==null}">
			<jsp:include page="views/slider2.jsp" />
			<jsp:include page="views/productgioitinh.jsp" />
		</c:when>
		<c:when test="${param.sex==null&&param.id!=null}">
			<jsp:include page="views/slider2.jsp" />
			<jsp:include page="views/homeproductdanhmuc.jsp" />
		</c:when>
		<c:when test="${param.idpro!=null}">
			<jsp:include page="views/detailproduct.jsp" />
		</c:when>
		<c:when test="${param.q!=null}">
			<jsp:include page="views/searchproduct.jsp" />
		</c:when>
		<c:when test="${param.log!=null}">
			<jsp:include page="views/login.jsp" />
		</c:when>
		<c:when test="${param.cart!=null}">
			<jsp:include page="views/Cart.jsp" />
		</c:when>
		<c:when test="${param.checkout!=null}">
			<jsp:include page="views/checkout.jsp" />
		</c:when>
		<c:when test="${param.logintocheckout!=null}">
			<jsp:include page="views/checklogin.jsp" />
		</c:when>
		<c:when test="${param.success!=null}">
			<jsp:include page="views/checkoutperform.jsp" />
		</c:when>
		<c:when test="${param.dsorder!=null}">
			<jsp:include page="views/admindashboard.jsp" />
		</c:when>
		<c:when test="${param.adminpro!=null}">
			<jsp:include page="views/adminproduct.jsp" />
		</c:when>
		<c:when test="${param.admieditpro!=null}">
			<jsp:include page="views/suaproduct.jsp" />
		</c:when>
		<c:when test="${param.ordertheoma!=null}">
			<jsp:include page="views/detailorder.jsp" />
		</c:when>
		<c:when test="${param.adminthemsanpham!=null}">
			<jsp:include page="views/adminthemsanpham.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="views/slider.jsp" />
			<jsp:include page="views/home.jsp" />
		</c:otherwise>
	</c:choose>
	<jsp:include page="views/footer.jsp" />
</body>
</html>
