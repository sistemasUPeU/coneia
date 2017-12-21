function jsConnector() {
	this.get = function(url, data, _callback) {
		connect('GET', url, data, _callback);
	};
	this.post = function(url, data, _callback) {
		connect('POST', url, data, _callback);
	};

}

function connect(type, url, data, _callback) {
	console.log(type);
	console.log(gth_context_path + "/" + url);
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	$.ajax({
		url : "/" + url,
		type : type,
		contentType : 'application/json',
		data : data,
		dataType : 'json',
		timeout : 2000,
		beforeSend : function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		success : function(result) {
			try {
				_callback(result);
			} catch (e) {
				console.log(e);
			}
		},
		error : function() {
			errorMessage({
				title : message.connector.title,
				content : message.connector.error
			});
			console.log(message.connector.title, message.connector.error);
			console.error("Error al conectar : ");
		}
	});
}

function errorMessage(params) {
	params.type = "error";
	showMessage(params);
}

function infoMessage(params) {
	params.type = "info";
	showMessage(params);
}

function successMessage(params) {
	params.type = "success";
	showMessage(params);
}

function showMessage(params) {
	// Esto es por mientras, luego se pondrá segun el plugin del materialize
	alert(params.type + ": " + params.title + "\n" + params.content);
}

var message = {
	connector : {
		title : "Sistema de Gestion del Talento Humano",
		error : "Ocurrió un error al momento de enviar la información, asegurese de que tiene conexión a internet. "
				+ "De lo contrario, comuníquese con el administrador del sistema."
	}
};
