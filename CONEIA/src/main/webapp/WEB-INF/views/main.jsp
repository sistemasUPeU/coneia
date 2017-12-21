<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!--Global Config-->
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>GTH</title>
<link rel="icon"
	href="<c:url value='/resources/img/favicon/favicon.ico'></c:url>">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- Global Styles-->
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/style.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/resources/css/perfect-scrollbar.css'></c:url>"
	rel="stylesheet" type="text/css" />
<!-- Javascript-->
<script src="<c:url value='/resources/js/jquery-1.11.2.min.js'></c:url>"
	type="text/javascript"></script>
<script src="<c:url value='/resources/js/materialize.min.js'></c:url>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/js/perfect-scrollbar.min.js'></c:url>"
	type="text/javascript"></script>
<script src="<c:url value='/resources/js/plugins.min.js'></c:url>"
	type="text/javascript"></script>
<script src="<c:url value='/resources/js/businessCore/connection.js'></c:url>"
	type="text/javascript"></script>
<script>
	var gth_context_path = '${pageContext.request.contextPath}';
</script>

</head>
<body>
	<div id="mobile-collapse-button" class="section">

		<div class="row">

			<div class="col s12 m12 l12">
				<nav class="deep-orange">
				<div class="nav-wrapper">
					<div class="col s12">
						<a href="#!" class="brand-logo">CONEIA</a> <a href="#"
							data-activates="mobile-demo" class="button-collapse"><i
							class="mdi-navigation-menu"></i></a>
						<ul class="right hide-on-med-and-down">
							<li><a href="sass.html">Home</a></li>
							<li><a href="components.html">Programa</a></li>
							<li><a href="javascript.html">Ponentes</a></li>
							<li><a id="register">Registrarse</a></li>
							<li><a href="mobile.html">Sign In</a></li>
						</ul>
						<ul class="side-nav" id="mobile-demo">
							<li><a href="sass.html">Home</a></li>
							<li><a href="components.html">Programa</a></li>
							<li><a href="javascript.html">Ponentes</a></li>
							<li><a href="mobile.html">Registrarse</a></li>
							<li><a href="mobile.html">Sign In</a></li>
						</ul>
					</div>
				</div>
				</nav>
			</div>
		</div>
	</div>

	<div id="space"></div>
	<script type="text/javascript">
		$(document).ready(function() {

			$(".button-collapse").sideNav();
		})

		$("#register")
				.click(
						function() {
							var con = new jsConnector();
						    $.get("inscripcion",null,function (data, status){
						        $("#space").html(data);
						    });
						})
	</script>
</body>
</html>
