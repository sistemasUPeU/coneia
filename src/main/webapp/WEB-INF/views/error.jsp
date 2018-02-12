<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONEIA</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="../../../jspf/general.jspf"%>
<script>
var context_path = "<%=request.getContextPath()%>";
</script>
</head>
<body class="cyan">
	<!-- Start Page Loading -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<!-- End Page Loading -->



	<div id="error-page">

		<div class="row">
			<div class="col s12">
				<div class="browser-window">
					<div class="top-bar">
						<div class="circles">
							<div id="close-circle" class="circle"></div>
							<div id="minimize-circle" class="circle"></div>
							<div id="maximize-circle" class="circle"></div>
						</div>
					</div>
					<div class="content">
						<div class="row">
							<div id="site-layout-example-top" class="col s12">
								<p class="flat-text-logo center white-text caption-uppercase">Estamos
									construyendo esta página, muy pronto estará disponible</p>
							</div>
							<div id="site-layout-example-right" class="col s12 m12 l12"
								style="height: auto;">
								<div class="row center">
									<h1 class="text-long-shadow col s12" style="font-size: 100px">EN CONSTRUCCIÓN</h1>
								</div>
								<div class="row center">
									<p class="center white-text col s12">Página en construcción</p>
									<p class="center s12">
										<button onclick="HomePage()"
											class="btn waves-effect waves-light">Home Page</button>
									<p></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- ================================================
    Scripts
    ================================================ -->


	<script type="text/javascript">
		function HomePage() {
			//       window.history.back();
			var link = context_path;
// 			context_path + "/#"
console.log(link);
			location.href = context_path;
		
		}
		$(window).on("load", function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 200);
		})
	</script>
</body>
</html>