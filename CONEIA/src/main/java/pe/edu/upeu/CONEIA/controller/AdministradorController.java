package pe.edu.upeu.CONEIA.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.service.InscripcionService;
import pe.edu.upeu.CONEIA.service.MailService;

@Controller
@RequestMapping("/admin")
public class AdministradorController {
	@Autowired
	private InscripcionService insService;

	@Autowired
	public MailService ms;

	public Gson gs = new Gson();
	Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

	@RequestMapping("/waiting")
	public String main(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// ModalAndView m = new ModalAndView()

		return "pendiente";
	}

	@RequestMapping("/responsew")
	public @ResponseBody String responsew(HttpServletRequest request, HttpServletResponse response) {

		Gson g = new Gson();
		insService.PendientesPersonales();
		List<Map<String, Object>> peopleWaitingPersonal = new ArrayList<>();
		// PrintWriter out = response.getWriter();
		List<DetalleInscripcion> lista = insService.PendientesPersonales();
		System.out.println("tamaa;ooo> " + lista.size());
		List<String> ret = new ArrayList<>();
		Map<String, Object> map = null;
		// for (int j = 0; j < lista.size(); j++) {
		// System.out.println("entro a reccorer");
		// map = new HashMap<>();
		// map.put("estado", gs.toJson(lista.get(j).getEstado()));
		// // map.put("idinscripcion",
		// lista.get(j).getInscripcion().getIdinscripcion());
		// // map.put("voucher", lista.get(j).getInscripcion().getNroVoucher());
		// // map.put("iddetalle", lista.get(j).getIddetalleInscripcion());
		// peopleWaitingPersonal.add(map);
		// }
		// System.out.println(peopleWaitingPersonal);

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
			

			// map.put("idinscripcion", lista.get(j).getInscripcion().getIdinscripcion());
			// map.put("voucher", lista.get(j).getInscripcion().getNroVoucher());
			// map.put("iddetalle", lista.get(j).getIddetalleInscripcion());
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
		// PrintWriter out = response.getWriter();
		List<DetalleInscripcion> lista1 = insService.PendientesDelegacion();
		System.out.println("tamaa;ooo> " + lista1.size());
		List<String> ret = new ArrayList<>();
		Map<String, Object> map = null;
		// for (int j = 0; j < lista.size(); j++) {
		// System.out.println("entro a reccorer");
		// map = new HashMap<>();
		// map.put("estado", gs.toJson(lista.get(j).getEstado()));
		// // map.put("idinscripcion",
		// lista.get(j).getInscripcion().getIdinscripcion());
		// // map.put("voucher", lista.get(j).getInscripcion().getNroVoucher());
		// // map.put("iddetalle", lista.get(j).getIddetalleInscripcion());
		// peopleWaitingPersonal.add(map);
		// }
		// System.out.println(peopleWaitingPersonal);

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

			// map.put("idinscripcion", lista.get(j).getInscripcion().getIdinscripcion());
			// map.put("voucher", lista.get(j).getInscripcion().getNroVoucher());
			// map.put("iddetalle", lista.get(j).getIddetalleInscripcion());
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
		// TrabajadorFiltradoDAO DAO = new
		// TrabajadorFiltradoDAO(AppConfig.getDataSource());

		List<Map<String, Object>> emails = new ArrayList<>();
		int id = Integer.parseInt(request.getParameter("idinscripcion"));
		int op = Integer.parseInt(request.getParameter("op"));
		String mensaje = request.getParameter("sms").toString();

		emails = insService.getEmails(id);
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
			// if(i==1) {
			// arrayEmail[i] = "agregado@agregado";
			// arrayName[i] = "agregado1 nombre";
			// arrayLastName[i] = "apellido agregado";
			// }else {
			// arrayEmail[i] = emails.get(i).get("email").toString();
			// arrayName[i] = emails.get(i).get("nombre").toString();
			// arrayLastName[i] = emails.get(i).get("apellidos").toString();
			// }
		}

		if (op == 1) {

			System.out.println("controller op 1, opcion positiva");
			String message = "Felicitaciones!!\r\n"
					+ "ya estas inscrito en el XIII CONEIA,  te esperamos este 04 de Junio.\r\n" + "\r\n"
					+ "			     Cuentale a todos tus amigos que ya estas inscrit@";

			String header = "Felicitaciones!!\r\n";
			String body = "Ya estas inscrito en el XIII CONEIA,  te esperamos este 04 de Junio.\r\n";
			String footer = "Cuentale a todos tus amigos que ya estas inscrit@";

			System.out.println("array listo a enviar> " + gs.toJson(arrayEmail));
			System.out.println("array listo a enviar> " + gs.toJson(arrayName));
			System.out.println("array listo a enviar> " + gs.toJson(arrayLastName));
			ms.sendEmail(arrayEmail, arrayName, arrayLastName, header, body, message);
		} else {

			String header = "Hola!!\r\n";
			String body = mensaje;
			String footer = "No te preocupes, aún tienes tiempo para solucionarlo, ven y únete al XIII CONEIA";
			System.out.println("controller op 2, opcion negativa");
			System.out.println("array listo a enviar> " + gs.toJson(arrayEmail));
			System.out.println("array listo a enviar> " + gs.toJson(arrayName));
			System.out.println("array listo a enviar> " + gs.toJson(arrayLastName));
			ms.sendEmail(arrayEmail, arrayName, arrayLastName, header, body, footer);
		}

		// AbstractApplicationContext context = new
		// AnnotationConfigApplicationContext(AppConfig.class);
		//
		// MailService mailService = (MailService) context.getBean("mailService");
		// mailService.sendEmail(getDummyOrder());
		//
		// ((AbstractApplicationContext) context).close();

		// emailService.sendSimpleMessageUsingTemplate(mailObject.getTo(),
		// mailObject.getSubject(),
		// template,
		// mailObject.getText());

		// return gs.toJson(DAO.CONFIRMAR());
		return "1";
	}

	@RequestMapping("/updatestate")
	public @ResponseBody String updateState(HttpServletRequest request, HttpServletResponse response) {

		int re = 0;
		Gson g = new Gson();
		int idins = Integer.parseInt(request.getParameter("idinscripcion"));
		int state = Integer.parseInt(request.getParameter("estado"));

		// re = insService.PendientesPersonales();
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

				// map.put("idinscripcion", lista.get(j).getInscripcion().getIdinscripcion());
				// map.put("voucher", lista.get(j).getInscripcion().getNroVoucher());
				// map.put("iddetalle", lista.get(j).getIddetalleInscripcion());
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

				// map.put("idinscripcion", lista.get(j).getInscripcion().getIdinscripcion());
				// map.put("voucher", lista.get(j).getInscripcion().getNroVoucher());
				// map.put("iddetalle", lista.get(j).getIddetalleInscripcion());
				System.out.println(map);
				peopleWaitingDelegacion.add(map);

			}
			System.out.println("administrador controller delegacion");
			System.out.println(peopleWaitingDelegacion);
			System.out.println(gs.toJson(peopleWaitingDelegacion));
			break;

		}
		
//		// re = insService.PendientesPersonales();
////		 re = insService.updateState(idins, state);
//		 System.out.println("respuesta actualizar estado controller" + re);

		return gs.toJson(peopleWaitingDelegacion);
	}

}
