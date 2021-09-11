<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	var retVal = confirm("Bạn muốn tiếp tục mua sắm ?");
	if (retVal == true) {
		window.location.href ="/BanGiay/index.html";
		
	} else {
		window.location.href ="/BanGiay/index.html?checkout=ok";
		
	}
</script>

