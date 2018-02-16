package pe.edu.upeu.CONEIA.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.service.MailService;
import pe.edu.upeu.CONEIA.service.PersonaService;

@Controller
public class LoginController {


	private static Gson gson = new Gson();
	Map<String, Object> personaMap = new HashMap<>();
	List<Map<String, Object>> personaLogin = null;
	int estadoPass = 0;
	List<Map<String, Object>> privilegioLista = null;
	Map<String, Object> personaReset = null;
	@Autowired
	private PersonaService ps;
	
	@Autowired
	public MailService ms;
	
	@RequestMapping(value = "/logon")
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String dni = request.getParameter("dni");
		String clave = request.getParameter("clave");
		HttpSession session = request.getSession(true);

		int x = 0;
		int op = Integer.parseInt(request.getParameter("op"));
		System.out.println(op);
		System.out.println(dni + ", " + op);

		int idr=0;
		int idp=0;
		try {
			
			switch(op) {
			case 1:
				if (ps.login(dni, clave) != null) {
					personaMap = ps.login(dni, clave);
					idr = Integer.parseInt(personaMap.get("idrol").toString());
					idp = Integer.parseInt(personaMap.get("idpersona").toString());
					Map<String, Object> datos = new HashMap<>();
					if(idr==6) {
						System.out.println("persona normal");
						System.out.println("idpersona " + idp);
						personaMap = ps.validarEstado(idp);
						if(Integer.parseInt(personaMap.get("op").toString())==0) {
							System.out.println("es nulo");
							x=1;//todavia no ha sido aprobada
						}else {
						System.out.println("estado de inscripcion " +personaMap.get("estadoinscripcion"));
						System.out.println(Integer.parseInt(personaMap.get("estadoinscripcion").toString()));
//						
//						session.setAttribute("idp", personaMap.get("idpersona"));
//						session.setAttribute("dni", personaMap.get("dni"));
//						session.setAttribute("nombre", personaMap.get("nombre"));
//						session.setAttribute("apellidos", personaMap.get("apellidos"));
//						session.setAttribute("rol", personaMap.get("rol"));
//						session.setAttribute("idrol", personaMap.get("idrol"));
//						session.setAttribute("inscripcion", personaMap.get("inscripcion"));
						
						x = 2;//ha sido aprobado
						}
						
					}else{
						System.out.println("persona admin");
						System.out.println(personaLogin);
						session.setAttribute("idp", personaMap.get("idpersona"));
						session.setAttribute("dni", personaMap.get("dni"));
						session.setAttribute("nombre", personaMap.get("nombre"));
						session.setAttribute("apellidos", personaMap.get("apellidos"));
						session.setAttribute("rol", personaMap.get("rol"));
						session.setAttribute("idrol", personaMap.get("idrol"));
						
						int idrol = Integer.parseInt(personaMap.get("idrol").toString());

						privilegioLista = new ArrayList<>();
//						privilegioLista = ps.listarPrivilegios(idrol);
//
//						session.setAttribute("listaPrivilegios", privilegioLista);

						x = 3;//administrador
						
					}
					
					datos.put("op", x);
					datos.put("idp", personaMap.get("idp"));
					datos.put("dni", personaMap.get("dni"));
					datos.put("rol", personaMap.get("rol"));
					datos.put("idrol", personaMap.get("idrol"));
//					datos.put("listaPrivilegios", privilegioLista);
					System.out.println(datos);
					System.out.println(gson.toJson(datos));
					out.println(gson.toJson(datos));
				} else {
					out.println(0);
				}
				break;
			case 2:
				System.out.println("destruir sesion");
				session.setAttribute("idp", null);
				session.setAttribute("dni", null);
				session.setAttribute("user", null);
				session.setAttribute("rol", null);
				session.setAttribute("idrol", null);
				session.invalidate();
//				response.sendRedirect("/portal/");
				response.sendRedirect(request.getContextPath()+"/");
				break;
			case 3:
				
				break;
			}

		} catch (Exception e) {
			System.out.println("login controller" + e);
		}
	}
	
	@RequestMapping(value = "/privilegios")
	public void listarPrivilegios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int rol = Integer.parseInt(request.getParameter("idrol"));
		HttpSession session = request.getSession(true);
		Map<String, Object> datos = new HashMap<>();
		privilegioLista = new ArrayList<>();
		privilegioLista = ps.listarPrivilegios(rol);
		datos.put("listaPrivilegios", privilegioLista);
		out.println(gson.toJson(datos));
		
	}
	
	
	@RequestMapping(value = "/checkpass")
	public void checkpass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int idp = Integer.parseInt(request.getParameter("idpersona"));
		Map<String, Object> datos = new HashMap<>();
		estadoPass = ps.checkpass(idp);
		datos.put("estadopass", estadoPass);
	
		out.println(gson.toJson(datos));
		
		
	}
	
	@RequestMapping(value = "/changepassword")
	public void changepass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
//		String newa =  request.getParameter("pass_new");
		String nueva = request.getParameter("pass_new_1");
		int idper = Integer.parseInt(request.getParameter("idper"));
		int estado = Integer.parseInt(request.getParameter("estado_pass"));
		int respuesta = 0;
		System.out.println(" " + nueva + " " + idper);
		Map<String, Object> datos = new HashMap<>();
//		estadoPass = ps.checkpass(idp);
		respuesta = ps.updatePassword(idper, nueva,estado);
		
		System.out.println("respuesta change password"+respuesta);
	
		out.println(gson.toJson(respuesta));
		
//		response.sendRedirect(request.getContextPath()+"/principal");
		
	}
	
	
	@RequestMapping(value = "/resetPassword")
	public void resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String numero =  request.getParameter("numero");
		String correo = request.getParameter("correo");
//		int idper = Integer.parseInt(request.getParameter("idper"));
		int respuesta = 0;
		System.out.println(numero + " " + correo );
		Map<String, Object> datos = new HashMap<>();
//		estadoPass = ps.checkpass(idp);
//		respuesta = ps.updatePassword(idper, nueva);
		personaReset = ps.validarCambio(numero, correo);
		int op =Integer.parseInt(personaReset.get("op").toString());
		System.out.println(op);
		Map<String, Object> datos1 = new HashMap<>();
		if(op==1) {
			String dni = personaReset.get("dni").toString();
			int idp = Integer.parseInt(personaReset.get("idpersona").toString());
			String nombre = personaReset.get("nombre").toString();
			String apellidos = personaReset.get("apellidos").toString();
		
			datos1.put("res", 1);
			datos1.put("idpersona", idp);
			datos1.put("nombre", nombre);
			datos1.put("apellidos", apellidos);
			datos1.put("dni", dni);
		}else {
			datos1.put("res", 0);
		}
		
	
		
		
		System.out.println("respuesta change password"+datos1);
	
		out.println(gson.toJson(datos1));
				
	}
	
	public static String creaPass(char[] conjunto, char[] elementos){
		String pass ="";
		for(int i=0;i<8;i++){
		int el = (int)(Math.random()*37);
		conjunto[i] = (char)elementos[el];
		}
		return pass = new String(conjunto);
		}
	
	@RequestMapping(path = "/emailRestorePassword", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String enviarCorreo(HttpServletRequest request, HttpServletResponse response) {
		

		String correo = request.getParameter("correo");
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String nueva_pass = request.getParameter("nueva_pass");



		
		String header = "Execelente!!\t\r\n";
		String body = "Tu contraseña ha sido restablecida. Para mayor seguridad deberás cambiarla al iniciar sesión.\t\r\n Nueva contraseña : "+ nueva_pass + "\t\r\n";
		String footer = "'Mas investigacion, menos contaminacion.' \t\r\n  XIII CONEIA-2018, UPeU - Lima '";

		
		
			int respuesta = ms.sendEmail(correo, nombre, apellidos, header, body, footer);
		

	
		return gson.toJson(respuesta);
	}
	
	
	
}
