<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="../../../jspf/general.jspf"%>

<style>
	#modal_change_cost {
	width: 35%;
}

@media only screen and (max-width: 600px) {
	#modal_change_cost {
		width: 85%;
	}
}

@media only screen and (min-width: 601px) and (max-width: 1100px) {
	#modal_change_cost {
		width: 50%;
	}
}

</style>

</head>
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

			<div class="container" style="width: 80%;">
				<div class="section">
					<div class="container" id="responsive_row"
						style="margin-top: 37px; margin-bottom: 30px;">

						<div class="row">
							<div class="col s12 center">

								<button
									class="waves-effect btn-large waves-light btn light-blue darken-3 center"
									style="margin-top: 10px;" id="save" onclick="saveChanges()">
									<i class="medium material-icons right"">save</i>Guardar cambios
								</button>

							</div>
						</div>
						<br> <br>


						<div class="card-panel">


							<div class="row" id="">
								<div class="col s12 m9 l9">
									<h5 class="header1">Precios: Temporada 1</h5>
								</div>

								<div class="col s12 m3 l3 center" id="t1">
									<input type="text" id="idactivo" class="hide">
									<div class="switch" style="padding: 10px">
										<label style="font-size: 15px"> Off <input
											type="checkbox" id="1" onclick="activar(this.id)"> <span
											class="lever"></span> On
										</label>

									</div>
								</div>

							</div>


							<div class="row">

								<div class="input-field col s12 m3 l3">
									<i class="material-icons prefix">attach_money</i> <input
										id="p_dele1" type="text" class="validate" name="p_dele1"
										required disabled> <label for="p_dele1">Delegación</label>
								</div>
								<div class="input-field col s12 m3 l3">
									<i class="material-icons prefix">attach_money</i> <input
										id="p_pro1" name="p_pro1" type="text" class="validate"
										required disabled> <label for="p_pro1">Profesional</label>
								</div>
								<div class="input-field col s12 m3 l3">
									<i class="material-icons prefix">attach_money</i> <input
										id="p_alu1" name="p_alu1" type="text" class="validate"
										required disabled> <label for="p_alu1">Alumno</label>
								</div>
								<div class="col s12 m3 l3 center">
									<a
										class="btn-floating btn-large waves-effect waves-light yellow darken-4 center"><i
										class="material-icons prefix" onclick="cambiarPrecios(1)">edit</i></a>
									<!-- 										<a class="btn-floating btn-large waves-effect waves-light yellow darken-4 "style="margin-left: 15px"><i class="material-icons prefix">save</i></a> -->
								</div>

							</div>
						</div>

						<div class="card-panel">
							<div class="row" id="">
								<div class="col s12 m9 l9">
									<h5 class="header2">Precios: Temporada 2</h5>
								</div>

								<div class="col s12 m3 l3 center" id="t2">
									<div class="switch" style="padding: 10px">
										<label style="font-size: 15px"> Off <input
											type="checkbox" id="2" onclick="activar(this.id)"> <span
											class="lever"></span> On
										</label>

									</div>
								</div>

							</div>
							<div class="row">

								<div class="input-field col s12 m3 l3">
									<i class="material-icons prefix">attach_money</i> <input
										id="p_dele2" type="text" class="validate" name="p_dele2"
										required disabled> <label for="p_dele2">Delegación</label>
								</div>
								<div class="input-field col s12 m3 l3">
									<i class="material-icons prefix">attach_money</i> <input
										id="p_pro2" name="p_pro2" type="text" class="validate"
										required disabled> <label for="p_pro2">Profesional</label>
								</div>
								<div class="input-field col s12 m3 l3">
									<i class="material-icons prefix">attach_money</i> <input
										id="p_alu2" name="p_alu2" type="text" class="validate"
										required disabled> <label for="p_alu2">Alumno</label>
								</div>
								<div class="col s12 m3 l3 center">
									<a
										class="btn-floating btn-large waves-effect waves-light yellow darken-4 center"><i
										class="material-icons prefix" onclick="cambiarPrecios(2)">edit</i></a>
									<!-- 										<a class="btn-floating btn-large waves-effect waves-light yellow darken-4 "style="margin-left: 15px"><i class="material-icons prefix">save</i></a> -->
								</div>



							</div>
						</div>
						<div class="card-panel">
							<div class="row" id="">
								<div class="col s12 m9 l9">
									<h5 class="header3">Precios: Temporada 3</h5>
								</div>

								<div class="col s12 m3 l3 center" id="t3">
									<div class="switch" style="padding: 10px">
										<label style="font-size: 15px"> Off <input
											type="checkbox" id="3" onclick="activar(this.id)"> <span
											class="lever"></span> On
										</label>

									</div>
								</div>

							</div>
							<div class="row">

								<div class="input-field col s12 m3 l3">
									<i class="material-icons prefix">attach_money</i> <input
										id="p_dele3" type="text" class="validate" name="p_dele3"
										required disabled> <label for="p_dele3">Delegación</label>
								</div>
								<div class="input-field col s12 m3 l3">
									<i class="material-icons prefix">attach_money</i> <input
										id="p_pro3" name="p_pro3" type="text" class="validate"
										required disabled> <label for="p_pro3">Profesional</label>
								</div>
								<div class="input-field col s12 m3 l3">
									<i class="material-icons prefix">attach_money</i> <input
										id="p_alu3" name="p_alu3" type="text" class="validate"
										required disabled> <label for="p_alu3">Alumno</label>
								</div>
								<div class="col s12 m3 l3 center">
									<a
										class="btn-floating btn-large waves-effect waves-light yellow darken-4 center"><i
										class="material-icons prefix" onclick="cambiarPrecios(3)">edit</i></a>
									<!-- 										<a class="btn-floating btn-large waves-effect waves-light yellow darken-4 "style="margin-left: 15px"><i class="material-icons prefix">save</i></a> -->
								</div>
							</div>
						</div>

					</div>
					<div id="modal_change_cost" class="modal modal-fixed-footer"
						style="height: 465px;">
						
							<div class="modal-content modal-form" style="padding: 23px;">
								<br>
								<div style="text-align: center">
									<h5>Cambiar precios</h5>
								</div>

								<br>
								<div class="row margin hide">
									<div class="input-field col s12">
										<input class="hide" value="${sessionScope.idp}" id="idper"
											name="idper" />
									</div>
								</div>

								<div class="row">
									<div class="input-field col s12">



										<i class="material-icons prefix">attach_money</i> <input
											id="m_del" type="text" class="validate" name="m_del"
											onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
											required> <label for="m_del">Delegación</label>
									</div>
								</div>

								<div class="row">
									<div class="input-field col s12">
										<i class="material-icons prefix">attach_money</i> <input
											id="m_pro" type="text" class="validate" name="m_pro"
											onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
											required> <label for="m_pro">Profesional</label>
									</div>
								</div>

								<div class="row">
									<div class="input-field col s12">
										<i class="material-icons prefix">attach_money</i> <input
											id="m_alu" type="text" class="validate" name="m_alu"
											onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
											required> <label for="m_alu">Alumno</label>
									</div>
								</div>

								<div style="text-align: center;">
									<label id="mensaje" style="color: red" style="width: 100%"></label>
								</div>

							</div>


							<div class="modal-footer">
								<button href="#!"
									class="btn modal-action waves-effect waves-green btn-flat "
									id="saveCost" type="button"
									style="backgroun-color: rgba(45, 200, 70, 0.53);">Guardar</button>
								<button href="#!"
									class="btn modal-action waves-effect waves-green btn-flat submit "
									id="cancel" type="button"
									style="backgroun-color: rgba(45, 200, 70, 0.53);">Cancelar
									</button>

							</div>
						
					</div>

				</div>


			</div>
			</section>
		</div>

	</div>
	<br>
	<br>
	<br>


	<%@include file="../../../jspf/footer.jspf"%>

	<script
		src="<c:url value='/resources/js/plugins/chartist-js/chartist.min.js'></c:url>"
		type="text/javascript"></script>


	<script
		src="<c:url value='/resources/js/businessCore/configurar.js'></c:url>"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(window).on("load", function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 200);
			checkSize()
		})

		$(window).on('resize', function() {
			
			checkSize()
		});

		function activar(valor) {
			
			var select = $("#" + valor).prop('checked');
		
			$("input:checkbox:not('#" + valor + "')").each(function() {
				$(this).prop('checked', false);
			})
			// 			$("#switcher").on("change", function() {
			// 				var status = $(this).prop('checked');

			// 				if (status == false) {

			// 					$("#switcher").prop('checked', false);
			// 				}
			// 			});
		};
		var selector = 0;
		function saveChanges() {
			var selected = 0;
			$("input:checkbox").each(function() {
				var status = $(this).prop('checked');
				
				if (status == true) {
			
					selected = 1;
					selector = $(this).attr('id');
					

				}
			});
			if (selected == 1) {
			
				// 				$("#t" + selector + " ").parents('#t' + selector);
				var idactivo = $("#idactivo").val();

				$.get("activeSeason", {
					ida : idactivo,
					idp : selector
				}, function(data) {
					
					if (data == 1) {
						alertify.alert('Mensaje de alerta',
								'Los cambios se guardaron correctamente',
								function() {
									alertify.success('Ok');

								});
						listarPrecios();
					} else {
						alertify.alert('Mensaje de alerta',
								'Hubo un error al guardar las actualizaciones',
								function() {
									alertify.success('Ok');

								});
					}
				});
			} else {

				alertify.alert('Mensaje de alerta',
						'Debe activar por lo menos una temporada', function() {
							alertify.success('Ok');

						});
			}
		}

		function checkSize() {
			if ($(window).width() <= 600) {
				// your code here

				$(".header1").text("Temporada 1");
				$(".header1").parent().addClass("center");
				$(".header2").text("Temporada 2");
				$(".header2").parent().addClass("center");
				$(".header3").text("Temporada 3");
				$(".header3").parent().addClass("center");

			} else {

				$(".header1").text("Precios: Temporada 1");
				$(".header1").parent().addClass("left").removeClass("center");
				$(".header2").text("Precios: Temporada 2");
				$(".header2").parent().addClass("left").removeClass("center");
				$(".header3").text("Precios: Temporada 3");
				$(".header3").parent().addClass("left").removeClass("center");
			}
		}
	</script>


</body>



</html>