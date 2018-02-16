package pe.edu.upeu.CONEIA.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import pe.edu.upeu.CONEIA.entity.Configuracion;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.service.ConfiguracionService;
import pe.edu.upeu.CONEIA.service.InscripcionService;
import pe.edu.upeu.CONEIA.service.MailService;

@Controller
@RequestMapping("/admin")
public class AdministradorController {
	
	private static String UPLOADED_FOLDER = "C:\\Users\\Harold\\git\\coneia5\\CONEIA\\src\\main\\webapp\\resources\\files";
	
	@Autowired
	private InscripcionService insService;
	
	@Autowired
	private ConfiguracionService confService;

	@Autowired
	public MailService ms;

	public Gson gs = new Gson();
	Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

	
	
	@RequestMapping("/waiting")
	public String main(HttpServletRequest request, HttpServletResponse response) throws IOException {

		return "pendiente";
	}

	@RequestMapping("/aprove")
	public String confirmados(HttpServletRequest request, HttpServletResponse response) throws IOException {

		return "aceptado";
	}
	
	@RequestMapping("/configurar")
	public String configurar(HttpServletRequest request, HttpServletResponse response) throws IOException {

		return "configurar";
	}
	
	@RequestMapping("/responsew")
	public @ResponseBody String responsew(HttpServletRequest request, HttpServletResponse response) {

		Gson g = new Gson();
		insService.PendientesPersonales();
		List<Map<String, Object>> peopleWaitingPersonal = new ArrayList<>();

		List<DetalleInscripcion> lista = insService.PendientesPersonales();
		System.out.println("tamaa;ooo> " + lista.size());
		List<String> ret = new ArrayList<>();
		Map<String, Object> map = null;


		for (DetalleInscripcion c : lista) {
			System.out.println("entro a reccorer");
			map = new HashMap<>();
			map.put("nombre", c.getPersona().getNombre());
			map.put("apellidos", c.getPersona().getApellidos());
			map.put("dni", c.getPersona().getDni());
			map.put("correo", c.getPersona().getCorreo());
			map.put("celular", c.getPersona().getCelular());
			map.put("entidad", c.getPersona().getUniversidad());
			map.put("carrera", c.getPersona().getCarrera());
			map.put("tipo", c.getPersona().getTipo());
			map.put("importe", c.getPersona().getImporte());
			
			map.put("url", c.getInscripcion().getUrlVoucher());
			map.put("nro", c.getInscripcion().getNroVoucher());
			map.put("fecha", c.getInscripcion().getFecha());
			map.put("idinscripcion", c.getInscripcion().getIdinscripcion());
			

			System.out.println(map);
			peopleWaitingPersonal.add(map);

		}
		System.out.println("administrador controller");
		System.out.println(peopleWaitingPersonal);
		System.out.println(gs.toJson(peopleWaitingPersonal));

		return gs.toJson(peopleWaitingPersonal);
	}

	@RequestMapping("/resdelegacion")
	public @ResponseBody String resdelegacion(HttpServletRequest request, HttpServletResponse response) {

		Gson g = new Gson();

		List<Map<String, Object>> peopleWaitingDelegacion = new ArrayList<>();

		List<DetalleInscripcion> lista1 = insService.PendientesDelegacion();
		System.out.println("tamaa;ooo> " + lista1.size());
		List<String> ret = new ArrayList<>();
		Map<String, Object> map = null;


		for (DetalleInscripcion c : lista1) {
			System.out.println("entro a reccorer");
			map = new HashMap<>();
			map.put("nombre", c.getPersona().getNombre());
			map.put("apellidos", c.getPersona().getApellidos());
			map.put("dni", c.getPersona().getDni());
			map.put("correo", c.getPersona().getCorreo());
			map.put("celular", c.getPersona().getCelular());
			map.put("entidad", c.getPersona().getUniversidad());
			map.put("carrera", c.getPersona().getCarrera());
			map.put("tipo", c.getPersona().getTipo());
			map.put("importe", c.getPersona().getImporte());
			
			map.put("url", c.getInscripcion().getUrlVoucher());
			map.put("nro", c.getInscripcion().getNroVoucher());
			map.put("fecha", c.getInscripcion().getFecha());
			map.put("idinscripcion", c.getInscripcion().getIdinscripcion());

			System.out.println(map);
			peopleWaitingDelegacion.add(map);

		}
		System.out.println("administrador controller delegacion");
		System.out.println(peopleWaitingDelegacion);
		System.out.println(gs.toJson(peopleWaitingDelegacion));

		return gs.toJson(peopleWaitingDelegacion);
	}

	@RequestMapping(path = "/getemails", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String enviarCorreo(HttpServletRequest request, HttpServletResponse response) {
		

		List<Map<String, Object>> emails = new ArrayList<>();
		int id = Integer.parseInt(request.getParameter("idinscripcion"));
		int op = Integer.parseInt(request.getParameter("op"));
		int opcion = Integer.parseInt(request.getParameter("opcion"));
		System.out.println(opcion);
		String mensaje = request.getParameter("sms").toString();

		emails = insService.getEmails(id, opcion);
		System.out.println("ya respondio");
		System.out.println("tama;o>>" + emails.size());
		System.out.println(gs.toJson(emails));

		String[] arrayEmail = new String[emails.size()];
		String[] arrayName = new String[emails.size()];
		String[] arrayLastName = new String[emails.size()];
		System.out.println(gs.toJson(emails));
		for (int i = 0; i < emails.size(); i++) {
			System.out.println(emails.get(i).get("email"));
			arrayEmail[i] = emails.get(i).get("email").toString();
			arrayName[i] = emails.get(i).get("nombre").toString();
			arrayLastName[i] = emails.get(i).get("apellidos").toString();

		}

		String header="";
		String body = "";
		String footer = "";
		
		if (op == 1) {
			System.out.println("controller op 1, opcion positiva");
			if(opcion==1) { //confirmacion personal
				header = "Felicitaciones!!\t\r\n";
				body = "Ya estás inscrito en el XIII CONEIA,  te esperamos este 04 de Junio.\t\r Recuerda, que para iniciar sesión la contraseña es tu DNI.\t\r";
				footer = "Cuéntale a todos tus amigos que ya estás inscrit@";
			}else { //confirmacion delegacion
				header = "Felicitaciones!!\t\r\n";
				body = "Tu delegación está inscrita en el XIII CONEIA, te esperamos este 04 de Junio.\t\rRecuerda a tu grupo, que para iniciar sesión la contraseña es su DNI.\t\r";
				footer = "Cuéntale a todos tus amig@s.";
				
				
			}
			
			ms.sendEmail(arrayEmail, arrayName, arrayLastName, header, body, footer);
		} else {
			System.out.println("controller op 2, opcion negativa");
			if(opcion==1) {//observacion personal
				header = "Hola!!\r\n";
				body =  mensaje;
				footer = "No te preocupes, aún tienes tiempo para solucionarlo, ven y únete al XIII CONEIA";
			}else { //observacion delegacion
				header = "Hola!!\r\n";
				body = " Tu delegacion ha sido observada. " + mensaje;
				footer = "Pero no te preocupes, aún tienes tiempo para solucionarlo, ven y únete al XIII CONEIA";
			}
			
			ms.sendEmail(arrayEmail, arrayName, arrayLastName, header, body, footer);
		}

	
		return "1";
	}

	@RequestMapping("/updatestate")
	public @ResponseBody String updateState(HttpServletRequest request, HttpServletResponse response) {

		int re = 0;
		Gson g = new Gson();
		int idins = Integer.parseInt(request.getParameter("idinscripcion"));
		int state = Integer.parseInt(request.getParameter("estado"));


		re = insService.updateState(idins, state);
		System.out.println("respuesta actualizar estado controller" + re);

		return g.toJson(re);
	}

	@RequestMapping("/reportes")
	public String reporteview(HttpServletRequest request, HttpServletResponse response) {

		int re = 0;
		Gson g = new Gson();

		return "reporte";
	}

	@RequestMapping("/tables")
	public @ResponseBody String tables(HttpServletRequest request, HttpServletResponse response) {

		int re = 0;
		Gson g = new Gson();
		String fecha = request.getParameter("fecha");
		int op = Integer.parseInt(request.getParameter("op"));

		List<Map<String, Object>> peopleWaitingDelegacion = null;

		System.out.println(fecha + ", " + op);

		List<String> ret = new ArrayList<>();
		Map<String, Object> map = null;

		switch (op) {
		case 1:
			peopleWaitingDelegacion = new ArrayList<>();
			List<DetalleInscripcion> lista1 = insService.Personal(fecha);
			System.out.println("tamaa;ooo1> " + lista1.size());

			for (DetalleInscripcion c : lista1) {
				System.out.println("entro a reccorer");
				map = new HashMap<>();
				map.put("nombre", c.getPersona().getNombre());
				map.put("apellidos", c.getPersona().getApellidos());
				map.put("dni", c.getPersona().getDni());
				map.put("correo", c.getPersona().getCorreo());
				map.put("celular", c.getPersona().getCelular());
				map.put("entidad", c.getPersona().getUniversidad());
				map.put("carrera", c.getPersona().getCarrera());
				map.put("tipo", c.getPersona().getTipo());
				map.put("importe", c.getPersona().getImporte());

				map.put("url", c.getInscripcion().getUrlVoucher());
				map.put("nro", c.getInscripcion().getNroVoucher());
				map.put("fecha", c.getInscripcion().getFecha());
				map.put("idinscripcion", c.getInscripcion().getIdinscripcion());

				System.out.println(map);
				peopleWaitingDelegacion.add(map);

			}
			System.out.println("administrador controller delegacion");
			System.out.println(peopleWaitingDelegacion);
			System.out.println(gs.toJson(peopleWaitingDelegacion));

			break;
		case 2:
			peopleWaitingDelegacion = new ArrayList<>();
			List<DetalleInscripcion> lista2 = insService.Delegacion(fecha);
			System.out.println("tamaa;ooo2> " + lista2.size());

			for (DetalleInscripcion c : lista2) {
				System.out.println("entro a reccorer");
				map = new HashMap<>();
				map.put("nombre", c.getPersona().getNombre());
				map.put("apellidos", c.getPersona().getApellidos());
				map.put("dni", c.getPersona().getDni());
				map.put("correo", c.getPersona().getCorreo());
				map.put("celular", c.getPersona().getCelular());
				map.put("entidad", c.getPersona().getUniversidad());
				map.put("carrera", c.getPersona().getCarrera());
				map.put("tipo", c.getPersona().getTipo());
				map.put("importe", c.getPersona().getImporte());

				map.put("url", c.getInscripcion().getUrlVoucher());
				map.put("nro", c.getInscripcion().getNroVoucher());
				map.put("fecha", c.getInscripcion().getFecha());
				map.put("idinscripcion", c.getInscripcion().getIdinscripcion());

				System.out.println(map);
				peopleWaitingDelegacion.add(map);

			}
			System.out.println("administrador controller delegacion");
			System.out.println(peopleWaitingDelegacion);
			System.out.println(gs.toJson(peopleWaitingDelegacion));
			break;

		}
		
		return gs.toJson(peopleWaitingDelegacion);
	}
	
	
	@RequestMapping("/aceptados")
	public @ResponseBody String aprobados(HttpServletRequest request, HttpServletResponse response) {

		int re = 0;
		Gson g = new Gson();
		
		int op = Integer.parseInt(request.getParameter("op"));

		List<Map<String, Object>> peopleaprove = null;

		

		List<String> ret = new ArrayList<>();
		Map<String, Object> map = null;

		switch (op) {
		case 1:
			peopleaprove = new ArrayList<>();
			List<DetalleInscripcion> lista1 = insService.AprobadosPersonal();
//			System.out.println("tamaa;ooo1> " + lista1.size());

			for (DetalleInscripcion c : lista1) {
				System.out.println("entro a reccorer");
				map = new HashMap<>();
				map.put("nombre", c.getPersona().getNombre());
				map.put("apellidos", c.getPersona().getApellidos());
				map.put("dni", c.getPersona().getDni());
				map.put("correo", c.getPersona().getCorreo());
				map.put("celular", c.getPersona().getCelular());
				map.put("entidad", c.getPersona().getUniversidad());
				map.put("carrera", c.getPersona().getCarrera());
				map.put("tipo", c.getPersona().getTipo());
				map.put("importe", c.getPersona().getImporte());
				

				map.put("url", c.getInscripcion().getUrlVoucher());
				map.put("nro", c.getInscripcion().getNroVoucher());
				map.put("fecha", c.getInscripcion().getFecha());
				map.put("idinscripcion", c.getInscripcion().getIdinscripcion());
				map.put("fechaupdate", c.getInscripcion().getFechaUpdate());

				System.out.println(map);
				peopleaprove.add(map);

			}
			System.out.println("administrador controller personal aprobados");
			System.out.println(peopleaprove);
			System.out.println(gs.toJson(peopleaprove));

			break;
		case 2:
			peopleaprove = new ArrayList<>();
			List<DetalleInscripcion> lista3 = insService.AceptadosDelegacion();
			System.out.println("tamaa;ooo2> " + lista3.size());

			for (DetalleInscripcion c : lista3) {
				System.out.println("entro a reccorer");
				map = new HashMap<>();
				map.put("nombre", c.getPersona().getNombre());
				map.put("apellidos", c.getPersona().getApellidos());
				map.put("dni", c.getPersona().getDni());
				map.put("correo", c.getPersona().getCorreo());
				map.put("celular", c.getPersona().getCelular());
				map.put("entidad", c.getPersona().getUniversidad());
				map.put("carrera", c.getPersona().getCarrera());
				map.put("tipo", c.getPersona().getTipo());
				map.put("importe", c.getPersona().getImporte());

				map.put("url", c.getInscripcion().getUrlVoucher());
				map.put("nro", c.getInscripcion().getNroVoucher());
				map.put("fecha", c.getInscripcion().getFecha());
				map.put("idinscripcion", c.getInscripcion().getIdinscripcion());
				map.put("fechaupdate", c.getInscripcion().getFechaUpdate());

					System.out.println(map);
				peopleaprove.add(map);

			}
			System.out.println("administrador controller delegacion aprobados");
			System.out.println(peopleaprove);
			System.out.println(gs.toJson(peopleaprove));
			break;

		}
		

		return gs.toJson(peopleaprove);
	}
	
	@RequestMapping(value = "/viewdoc")
	public void jarchiv1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ServletContext cntx = request.getServletContext();

		System.out.println("controller cargar archivo");
		String nombre = request.getParameter("nombre");
		
		String filename = cntx.getRealPath("/resources/files/" + nombre);
//		String filename = UPLOADED_FOLDER+"\\" + nombre;
//		 String filenam1e ="E:\\CONEIA\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\gth\\WEB-INF\\h\\"+nom;

		System.out.println(nombre + "//" + "//" + filename);
		
		
		String mime = cntx.getMimeType(filename);
		if (mime == null) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}

		response.setContentType(mime);
		File file = new File(filename);
		response.setContentLength((int) file.length());

		FileInputStream in = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		System.out.println(out);
		// Copy the contents of the file to the output stream
		byte[] buf = new byte[1024];
		int count = 0;
		while ((count = in.read(buf)) >= 0) {
			out.write(buf, 0, count);
		}
		out.close();
		in.close();

	}
	
	@RequestMapping("/getPrecios")
	public @ResponseBody String precios(HttpServletRequest request, HttpServletResponse response) {

		int re = 0;
		Gson g = new Gson();
		
		List<Map<String, Object>> getprecios = null;

		List<String> ret = new ArrayList<>();
		Map<String, Object> map = null;

		getprecios = new ArrayList<>();
			 getprecios = confService.getPrecios();

			System.out.println(getprecios);
			System.out.println(gs.toJson(getprecios));
		return gs.toJson(getprecios);
	}
	
	@RequestMapping("/activeSeason")
	public @ResponseBody String activeSeason(HttpServletRequest request, HttpServletResponse response) {

		int re = 0;
		Gson g = new Gson();
		int idactivo = Integer.parseInt(request.getParameter("ida"));
		int idtoactive = Integer.parseInt(request.getParameter("idp"));


		int update = 0;
		update = confService.updateSeason(idactivo, idtoactive);

		System.out.println(gs.toJson(update));
		return gs.toJson(update);
	}
	
	@RequestMapping("/updateCost")
	public @ResponseBody String updateCost(HttpServletRequest request, HttpServletResponse response) {

		int re = 0;
		Gson g = new Gson();
		int idc = Integer.parseInt(request.getParameter("idc"));
		int precioDele = Integer.parseInt(request.getParameter("dele"));
		int precioAlu = Integer.parseInt(request.getParameter("alu"));
		int precioPro = Integer.parseInt(request.getParameter("pro"));


		int update = 0;
		update = confService.updateCost(idc, precioDele, precioAlu, precioPro);

		System.out.println(gs.toJson(update));
		return gs.toJson(update);
	}
	

}
