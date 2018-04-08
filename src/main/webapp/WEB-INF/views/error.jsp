<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONEIA</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="../../../jspf/general.jspf"%>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<style>
#site-layout-example-top {
	height: 60px;
}

#titulo2 {
	font-size: 90px;
}

.card-container {
		margin-left:25%;
		cursor: pointer;
		height: 150px;
		perspective: 600;
		position: relative;
		width: 300px;
		text-align: center;
		
	}
	.card {
		height: 100%;
		position: absolute;
		transform-style: preserve-3d;
		transition: all 1s ease-in-out;
		width: 100%;
	}
	.card:hover {
		transform: rotateY(180deg);
	}
	.card .side {
		backface-visibility: hidden;
		border-radius: 6px;
		height: 100%;
		position: absolute;
		overflow: hidden;
		width: 100%;
	}
	.card .back {
		background: white;
		color: #0087cc;
	
		text-align: center;
		transform: rotateY(180deg);
	}

@media only screen and (max-width: 600px) {

	#site-layout-example-top {
		height: 120px;
	}
	#titulo2 {
		font-size: 30px;
	}
	img{width: 100px;height:100px}
}

@media only screen and (min-width: 601px) and (max-width: 1100px) {
}
</style>

<script>
var context_path = "<%=request.getContextPath()%>";
</script>
</head>
<body class="">
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
			<div class="container">
				<div class="browser-window" style="padding-top: 10%">
					<div class="top-bar"></div>
					<div class="content">
						<div class="row">

							<div  class="white col s12 m12 l12"
								style="height: auto;">
								<div class="col m6 s12">
									<div class="center">
										
										<div style="padding-top: 15%">
											<div >
												<img style="width: 75%; height: auto;"
											src="<c:url value="/resources/img/cones.png"/>">
											</div>
										
										</div>
									
									</div>
									

								</div>
								<div class="col m6 s12" style="font-family: 'Montserrat', sans-serif;">
									<div class="row" >
										<h4 for=""><b style="color:#64dd17 ;">Felicitaciones!</b></h4>
										<p>${sessionScope.nombre} ${sessionScope.apellidos} te has inscrito satisfactoriamente,
										te esperamos este 04 de junio en Lima :)</p>
										<p>Por el momento no te puedes inscribir a los talleres y ponencias, pronto se habilitará esta opción.</p>
										<br />
										<div class="row" >
										<div class="col s8">Cuéntale a todos tus amigos que ya te has inscrito:</div>
										<div class="col s4">
											<div class="center">
											<a href="https://www.facebook.com/XIIICONEIAUPeULima/"  target="_blank"><img style="width: 50%; height:auto;"
											src="<c:url value="/resources/img/fb.png"/>"></a>
										</div>
										</div> 
										</div>
										
										
										
										<p class="center s12">
											<button onclick="HomePage()"
												class="btn waves-effect waves-light">Volver</button>
											<p></p>
								</div>
								</div>
								
								<br>
								<br>
								
							</div>
						</div>
					</div>
					<div class="top-bar">
						
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

			location.href = context_path;

		}
		$(window).on("load", function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 200);
		})
	</script></
										body>
</html>