<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONEIA</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="png"
	href="<c:url value='/resources/img/coneia.png'></c:url>">
<!-- Global Styles-->
<link href="<c:url value='/resources/css/materialize.min.css'></c:url>"
	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Bellefair"
	rel="stylesheet">
</head>
<body class="#ff5252 red accent-2">
	<div class="container">
		<br />

		<h3 class="center"
			style="font-family: 'Bellefair', serif; color: white">
			<b>CONEIA 2018</b>- Login
		</h3>
		<div id="user-login" class="row" style="margin-top: 15%">
			<div class="col s12 z-depth-6 card-panel">
				<form class="login-form">

					<div class="row margin">
						<div class="input-field col s12 center">
							<br /> <br /> <img
								class="home mdi-action-open-with large icon-demo size-icon"
								src="<c:url value="/resources/img/coneia3.jpg"/>"
								style="width: 50%; cursor: pointer; margin-left: 10%; margin-top: -5%; outline-color: none"></img>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-social-person-outline prefix"></i> <input
								class="validate" id="user_dni" type="text"
								onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
								maxlength=8  required aria-required="true" autofocus> <label for="user_dni"
								data-error="Campo vacío" data-success="" class=""style="width:100%">Ingrese
								su DNI</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<a id="logon" class="btn waves-effect waves-light col s12">Login</a>
						</div>
					</div>

				</form>
			</div>
		</div>



	</div>

	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'></c:url>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/resources/js/plugins/materialize.min.js'></c:url>"
		type="text/javascript"></script>
	<script>
		var url = window.location.href;
		var arr = url.split("/");
		var context_path = arr[0] + "//" + arr[2] + "/CONEIA"
		$(".home").click(function() {
			var link = context_path + "/"

			location.href = link;
		})

		$("#logon").click(function() {
			var dni = $("#user_dni").val();
			$.get("logon", {op:1,dni:dni}, function(data) {
// 				alert(data);
				var login = JSON.parse(data);
		        if(login.op==1){
		        	var link = context_path + "/principal"

					location.href = link;           
		        }else{
		        	$("#user_dni").next("label").attr('data-error','Número no registrado');
		        	$("#user_dni").removeClass("valid");
		        	$("#user_dni").addClass("invalid");
		        }
			});
		});

		$("#user_dni").keypress(function(e) {
			console.log(e.which);
			if (e.which == 13) {
				$("#logon").click();
			}
		});
	</script>
</body>
</html>