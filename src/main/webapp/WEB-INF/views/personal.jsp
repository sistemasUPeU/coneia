<%
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("dni") == null || sesion.getAttribute("rol") == null) {
		response.sendRedirect("/CONEIA/");

	} else {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personal</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="../../../jspf/general.jspf"%>
<link href="<c:url value='/resources/css/alertify.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='http://fonts.googleapis.com/icon?family=Material+Icons'></c:url>"
	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lobster+Two"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Crimson+Text"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cinzel"
	rel="stylesheet">
</head>
<style>
div.container {
	max-width: 1200px
}

label {
	display: block;
	float: left;
	width: 100%;
}

.dataTables_wrapper .dataTables_filter {
	float: none;
	width: 50%;
	margin-left: 25%;
}

.special_row {
	width: 40%;
	margin-top: 7%;
	margin-bottom: 1%;
}

.collapsible li.active .i {
	-ms-transform: rotate(180deg); /* IE 9 */
	-webkit-transform: rotate(180deg); /* Chrome, Safari, Opera */
	transform: rotate(180deg);
}

.ajs-message.ajs-custom {
	color: #31708f;
	background-color: #d9edf7;
	border-color: #31708f;
	z-index: 999999
}
.muestra2{
	margin-left: 35%;
}
.fa{
	width: 35px;height: 35px;margin-right:1em;
}
#cuerpo{
	width:85%;
}
@media only screen and (max-width: 900px) {
	#cuerpo{
	width:95%;
	}
}

@media only screen and (max-width: 600px) {
.achon{
	font-size:22px;
	font-weight:bold;
}
#table{
	margin-bottom:4em;
}
.muestra2{
	margin-bottom:4em;
	margin-left: 30%;
}
	.fa{
		width:15px;
		height:15px;
	}
	.terraza {
		font-size: 12px;
	}
	h2 {
		font-size: 16px;
	}
	.chama {
		padding: 1px;
	}
	.dataTables_wrapper .dataTables_filter {
		float: none;
		width: 100%;
		margin-left: 0%;
	}
	.special_row {
		width: 90%;
		padding: 0px;
		margin-top: 7%;
		margin-bottom: 1%;
	}
	#slide-out {
		width: 30%;
	}
	.cola {width ="1em";
		
	}
}
</style>
<body>
		<%@include file="../../../jspf/header.jspf"%>
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>

	</div>
	<div id="main">
		<div class="wrapper">
			<%@include file="../../../jspf/aside_left.jspf"%>
			<section id="content">


				<div class="section">					
					<h2 class="center achon" style="font-family: 'Cinzel', serif;">Staff Coneia</h2>
					
					<div id="table-datatables">
						<div id="cuerpo" class="container">
							 <a class="btn-floating btn-large waves-effect waves-light #00e676 green accent-3 right modal-trigger" onclick="nuevo()" href="#modalon2"><i class="material-icons">person_add</i></a>
							
							<div id="table" class="row"></div>



						</div>

					</div>

					<div id="modalon" class="modal">
						<div class="modal-content ">
							<div class="row">
								<div class="container" style="width: 95%">
										<div id="cant"></div>
								</div>
	
							</div>
						</div>
					</div>
					<div id="modalon2" class="modal">
						<div class="modal-content ">
							<div class="row">
								<div class="container" style="width: 95%">
									<div id="cant2"></div>
								</div>
							
							</div>
						</div>
					</div>

				</div>







			</section>
			
		</div>

	</div>
	<%@include file="../../../jspf/footer.jspf"%>
	<script type="text/javascript">
		$(window).on("load", function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 200);
		})

		$('.progress').fadeOut('fast');
		$('#loader-wrap').fadeOut('fast');
		$('#loader-wrap1').fadeOut('fast');
	</script>

	<script
		src="<c:url value='/resources/js/plugins/chartist-js/chartist.min.js'></c:url>"
		type="text/javascript"></script>
	<!-- masonry -->
	<script
		src="<c:url value='/resources/js/plugins/masonry.pkgd.min.js'></c:url>"
		type="text/javascript"></script>

	<!-- imagesloaded -->
	<script
		src="<c:url value='/resources/js/plugins/imagesloaded.pkgd.min.js'></c:url>"
		type="text/javascript"></script>

	<!-- magnific-popup -->
	<script
		src="<c:url value='/resources/js/plugins/magnific-popup/jquery.magnific-popup.min.js'></c:url>"
		type="text/javascript"></script>

	<script
		src="<c:url value='https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js'></c:url>"
		type="text/javascript"></script>
		<script
		src="<c:url value='https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/businessCore/personal.js'></c:url>"
		type="text/javascript"></script>
</body>
</html>
<%
	}
%>