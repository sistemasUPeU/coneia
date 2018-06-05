package pe.edu.upeu.CONEIA.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import pe.edu.upeu.CONEIA.entity.Configuracion;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.entity.Rol;
import pe.edu.upeu.CONEIA.entity.Taller;
import pe.edu.upeu.CONEIA.entity.Tipo;
import pe.edu.upeu.CONEIA.service.ConfiguracionService;
import pe.edu.upeu.CONEIA.service.InscripcionService;
import pe.edu.upeu.CONEIA.service.InscripcionTallerService;
import pe.edu.upeu.CONEIA.service.MailService;
import pe.edu.upeu.CONEIA.service.PersonaService;
import pe.edu.upeu.CONEIA.service.TallerService;

@Controller
@RequestMapping("/admin")
public class AdministradorController {
	
	private static String UPLOADED_FOLDER = "C:\\Users\\Harold\\git\\coneia5\\CONEIA\\src\\main\\webapp\\resources\\files";
	
	@Autowired
	private InscripcionService insService;
	
	@Autowired
	private ConfiguracionService confService;

	@Autowired
	private PersonaService ps;
	
	@Autowired
	public MailService ms;
	
	@Autowired
	private TallerService td;
	
	@Autowired
	private InscripcionTallerService its;

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
	
	@RequestMapping("/personal")
	public String personal(HttpServletRequest request, HttpServletResponse response) throws IOException {

		return "personal";
	}
	
	

	@RequestMapping("/editPersona")
	public @ResponseBody Integer editpersona(HttpServletRequest request, HttpServletResponse response) {
	
		int respuesta = 0;
		Persona p =  new Persona();
		String data = request.getParameter("op");
		System.out.println("controller string" + data);
		
		
		JsonParser parser = new JsonParser();

		// Obtain Array
		JsonArray gsonArr = parser.parse(data).getAsJsonArray();
		System.out.println(gsonArr);
		System.out.println("size " + gsonArr.size());
		int cont = 0;

		for (JsonElement obje : gsonArr) {

			// Object of array
			JsonObject gsonObj = obje.getAsJsonObject();
			System.out.println("gsonObj> " + gsonObj);
			// Primitives elements of object

			// int dorsal = gsonObj.get("nombre").getAsInt();
			int idpersona = Integer.parseInt(gsonObj.get("idpersona").getAsString());
			System.out.println("idpersona " + idpersona);
			String nombre = gsonObj.get("name").getAsString();
			System.out.println(nombre);
			String apellido = gsonObj.get("last_name").getAsString();
			String carrera = gsonObj.get("carrera").getAsString();
			String correo = gsonObj.get("email").getAsString();
			String dni = gsonObj.get("dni").getAsString();
			String celular = gsonObj.get("phone").getAsString();
			String universidad = gsonObj.get("entidad").getAsString();
			Double importe = gsonObj.get("importe").getAsDouble();
			System.out.println("importe " + importe);
			// Object Constructor

			Persona persona = new Persona();
			persona.setIdpersona(idpersona);
			persona.setNombre(nombre);
			persona.setApellidos(apellido);
			persona.setCarrera(carrera);
			persona.setCorreo(correo);
			persona.setDni(dni);
			persona.setCelular(celular);
			persona.setUniversidad(universidad);
			Rol r = new Rol();
			r.setIdrol(7);
			persona.setRol(r);
			persona.setImporte(importe);
			

			System.out.println("clase > " + persona);
			respuesta = ps.actualizar(persona);
			
			//
		}
		System.out.println("respuesta del dao implement actualizar persona - controller> " + respuesta);
		
		
		return respuesta;
		
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

	@RequestMapping("/deleteins")
	public @ResponseBody String deleteins(HttpServletRequest request, HttpServletResponse response) throws ParseException {

		int id = Integer.parseInt(request.getParameter("id"));
		int res = insService.delete(id);
System.out.println(res);
		return gs.toJson(res);
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

	@RequestMapping("impresiones")
	public ModelAndView Impresiones(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();

		model.setViewName("impresiones");

		return model;
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
				map.put("idpersona", c.getPersona().getIdpersona());

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
				map.put("idpersona", c.getPersona().getIdpersona());
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

//		System.out.println(gs.toJson(update));
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
	
	
	@RequestMapping("/activeGeneral")
	public @ResponseBody String activeGeneral(HttpServletRequest request, HttpServletResponse response) {

		int re = 0;
		Gson g = new Gson();

		int opcion = Integer.parseInt(request.getParameter("opcion"));

		int update = 0;
		update = confService.updateGeneral(opcion);

		System.out.println(gs.toJson(update));
		return gs.toJson(update);
	}
	
	
	@RequestMapping("/asistencia")
	public String assistance(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// ModalAndView m = new ModalAndView()

		return "asistenciaAdmin";
	}

	@RequestMapping("programaAdmin")
	public ModelAndView ProgramAdmin(HttpServletRequest request, HttpServletResponse response) throws ParseException {

		ModelAndView model = new ModelAndView();

		model.setViewName("programaAdmin");
		model.addObject("conferenciaLunes", td.findTalleres(3, "2018-06-04"));
		model.addObject("actividadesLunes", td.findTalleres(5, "2018-06-04"));
		model.addObject("concursoMartes", td.findTalleres(5, "2018-06-05"));
		model.addObject("actividadesMiercoles", td.findTalleres(5, "2018-06-06"));
		model.addObject("conferenciaMiercoles", td.findTalleres(3, "2018-06-06"));
		model.addObject("conferenciaJueves", td.findTalleres(3, "2018-06-07"));
		model.addObject("conferenciaViernes", td.findTalleres(3, "2018-06-08"));
		model.addObject("actividadesViernes", td.findTalleres(5, "2018-06-08"));

		return model;
	}
	
	@RequestMapping("customPersonal")
	protected void personalF(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		RequestDispatcher dispatcher;
		int op = Integer.parseInt(request.getParameter("op"));
		HttpSession session = request.getSession();
		String url;
		switch (op) {
		case 1:// visitas MARTES
			out.println(gson.toJson(ps.listarPersonal()));
			break;
		case 2:// talleres MARTES
			int id = Integer.parseInt(request.getParameter("id"));
			String nombres = request.getParameter("nombres");
			String apellidos = request.getParameter("apellidos");
			String dni = request.getParameter("dni");
			String clave = request.getParameter("clave");
			String celular = request.getParameter("celular");
			Persona p = new Persona();
			p.setIdpersona(id);p.setNombre(nombres);p.setApellidos(apellidos);p.setDni(dni);p.setDni(dni);p.setPassword(clave);p.setCelular(celular);
			Rol r = new Rol();
			r.setIdrol(7);
			p.setRol(r);
			if(ps.actualizar(p)==1) {
				out.println(1);
			}else {
				out.println(0);
			}
			
			break;
		case 3:// visitas JUEVES
			int ide = Integer.parseInt(request.getParameter("id"));
			if(ps.eliminar(ide)==1) {
				out.println(1);
			}else {
				out.println(0);
			}
			break;
		case 4:// visitas JUEVES
				int ids = Integer.parseInt(request.getParameter("id"));
				out.println(gson.toJson(ps.search(ids)));
				break;
		case 5:
			String nnombres = request.getParameter("nnombres");
			String napellidos = request.getParameter("napellidos");
			String ndni = request.getParameter("ndni");
			String nclave = request.getParameter("nclave");
			String ncelular = request.getParameter("ncelular");
			Persona pe = new Persona();
			pe.setNombre(nnombres);pe.setApellidos(napellidos);pe.setDni(ndni);pe.setDni(ndni);pe.setPassword(nclave);pe.setCelular(ncelular);
			Rol ro = new Rol();
			ro.setIdrol(7);
			pe.setRol(ro);
			if(ps.nuevaPersona(pe)==1) {
				out.println(1);
			}else {
				out.println(0);
			}
			break;
		
		}

	}

	
	@RequestMapping("customTaller")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		RequestDispatcher dispatcher;
		int op = Integer.parseInt(request.getParameter("op"));
		HttpSession session = request.getSession();
		String url;
		switch (op) {
		case 1:// visitas MARTES
			out.println(gson.toJson(td.findTalleres(4, "2018-06-05")));
			break;
		case 2:// talleres MARTES
			out.println(gson.toJson(td.findTalleres(2, "2018-06-05")));
			break;
		case 3:// visitas JUEVES
			out.println(gson.toJson(td.findTalleres(4, "2018-06-07")));
			break;
		case 4:// talleres JUEVES
			out.println(gson.toJson(td.findTalleres(2, "2018-06-07")));
			break;
		case 5:// ponencia LUNES 1
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-04", "10:30")));
			break;
		case 6:// ponencia LUNES 2
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-04", "11:30")));
			break;
		case 7:// ponencia MIERCOLES 1
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-06", "08:00")));
			break;
		case 8:// ponencia MIERCOLES 2
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-06", "09:00")));
			break;
		case 9:// ponencia MIERCOLES 3
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-06", "10:30")));
			break;
		case 10:// ponencia MIERCOLES 4
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-06", "11:30")));
			break;
		case 11:// ponencia VIERNES 1
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-08", "08:00")));
			break;
		case 12:// ponencia VIERNES 2
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-08", "09:00")));
			break;
		case 13:
			String tema = request.getParameter("tema");
			String ponente = request.getParameter("ponente");
			String lugar = request.getParameter("lugar");
			int stock = Integer.parseInt(request.getParameter("stock"));
			int idtaller = Integer.parseInt(request.getParameter("idtaller"));
			int idtipo = Integer.parseInt(request.getParameter("idtipo"));
			if (td.update(idtaller, idtipo, tema, ponente, lugar, stock) == 1) {
				out.println(1);
			} else {
				out.println(0);
			}
			break;
		case 14:
			out.println(gson.toJson(td.findTalleres(3, "2018-06-04")));
			break;
		case 15:
			out.println(gson.toJson(td.findTalleres(5, "2018-06-04")));
			break;
		case 16:
			out.println(gson.toJson(td.findTalleres(5, "2018-06-05")));
			break;
		case 17:
			out.println(gson.toJson(td.findTalleres(5, "2018-06-06")));
			break;
		case 18:
			out.println(gson.toJson(td.findTalleres(3, "2018-06-06")));
			break;
		case 19:
			out.println(gson.toJson(td.findTalleres(3, "2018-06-07")));
			break;
		case 20:
			out.println(gson.toJson(td.findTalleres(3, "2018-06-08")));
			break;
		case 21:
			out.println(gson.toJson(td.findTalleres(5, "2018-06-08")));
			break;
		case 22:
			int idtipo1 = Integer.parseInt(request.getParameter("idtipo"));
			String tema1 = request.getParameter("tema");
			String ponente1 = request.getParameter("ponente");
			String horaI = request.getParameter("horaI");
			String horaF = request.getParameter("horaF");
			String fecha1 = request.getParameter("fecha");
			String lugar1 = request.getParameter("lugar");
			System.out.println(horaI+"\n"+horaF+"\n"+fecha1);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
			Date date = formatter.parse(fecha1);
			SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm",Locale.US);
			Date hourI = formatter2.parse(horaI);
			Date hourF = formatter2.parse(horaF);
			int stock1 = Integer.parseInt(request.getParameter("stock"));
			Taller ta = new Taller();
			Tipo ti = new Tipo();
			ti.setIdtipo(idtipo1);
			ta.setTipo(ti);
			ta.setNombre(tema1);
			ta.setPonente(ponente1);
			ta.setHoraInicio(hourI);
			ta.setHoraFin(hourF);
			ta.setFecha(date);
			ta.setDescripcion(lugar1);
			ta.setNroVacantes(stock1);ta.setEstado(1);	
			if(td.nuevoTaller(ta)==1) {
				out.println(1);
			}else {
				out.println(0);
			}
			break;
		case 23:
			int id = Integer.parseInt(request.getParameter("id"));
			if(td.eliminar(id)==1) {
				out.println(1);
			}else {
				out.println(0);
			}
			break;
		case 24: 
			int idtipo2 = Integer.parseInt(request.getParameter("idtipo"));
			String fecha2 = request.getParameter("fecha");
			System.out.println(fecha2);
			SimpleDateFormat formatter3 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
			Date date2 = formatter3.parse(fecha2);
			out.println(gson.toJson(td.findTalleres(idtipo2, fecha2)));
			break;
		case 25:
			String fech = request.getParameter("fecha");
			String dni = request.getParameter("dni");
			out.println(gson.toJson(its.showVistaPersonaTaller(fech,dni)));
			break;
		case 26:
			int idd = Integer.parseInt(request.getParameter("idd"));
			String time = request.getParameter("fecha");
			out.println(gson.toJson(its.showVistaAsistencia(idd, time)));
			break;
		case 27:
			int idit= Integer.parseInt(request.getParameter("idit"));
			out.print(its.actualizarAsistencia(idit));
			break;
		case 28:
			out.println(gson.toJson(its.reporteAsistencia()));
			break;
		case 29:
			String idrol = session.getAttribute("idrol").toString();
			out.println(idrol);
			break;
		case 30:// visitas MARTES 1
			out.println(gson.toJson(td.findTalleres3(4, "2018-06-05")));
			break;
		case 31:// talleres MARTES 2
			out.println(gson.toJson(td.findTalleres3(2, "2018-06-05")));
			break; 
		case 32:// visitas JUEVES 3 
			out.println(gson.toJson(td.findTalleres3(4, "2018-06-07")));
			break;
		case 33:// talleres JUEVES 4
			out.println(gson.toJson(td.findTalleres3(2, "2018-06-07")));
			break;
		case 34: //IMPRESIONES
			int idt = Integer.parseInt(request.getParameter("idt"));
			if(its.impresiones(idt).isEmpty()) {
				out.println(0);
			}else {
				out.println(gson.toJson(its.impresiones(idt)));
			}
			
		}

	}

}
