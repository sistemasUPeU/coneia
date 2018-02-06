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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.service.PersonaService;

@Controller
public class LoginController {


	private static Gson gson = new Gson();
	Map<String, Object> personaMap = new HashMap<>();
	List<Map<String, Object>> personaLogin = null;
	List<Map<String, Object>> privilegioLista = null;

	@Autowired
	private PersonaService ps;
	

	@RequestMapping(value = "/logon")
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String dni = request.getParameter("dni");
		HttpSession session = request.getSession(true);

		int x = 0;
		int op = Integer.parseInt(request.getParameter("op"));
		System.out.println(op);
		System.out.println(dni + ", " + op);

		int idr=0;
		int idp=0;
		try {

			if (op == 1) {
				if (ps.login(dni) != null) {
					personaMap = ps.login(dni);
					idr = Integer.parseInt(personaMap.get("idrol").toString());
					idp = Integer.parseInt(personaMap.get("idpersona").toString());
					Map<String, Object> datos = new HashMap<>();
					if(idr==6) {
						System.out.println("persona normal");
						System.out.println("idpersona " + idp);
						personaMap = ps.validarEstado(idp);
						if(Integer.parseInt(personaMap.get("op").toString())==0) {
							System.out.println("es nulo");
							x=0;
						}else {
						System.out.println("estado de inscripcion " +personaMap.get("estadoinscripcion"));
						System.out.println(Integer.parseInt(personaMap.get("estadoinscripcion").toString()));
						

						session.setAttribute("idp", personaMap.get("idpersona"));
						session.setAttribute("dni", personaMap.get("dni"));
						session.setAttribute("nombre", personaMap.get("nombre"));
						session.setAttribute("apellidos", personaMap.get("apellidos"));
						session.setAttribute("rol", personaMap.get("rol"));
						session.setAttribute("idrol", personaMap.get("idrol"));
						session.setAttribute("inscripcion", personaMap.get("inscripcion"));
						x = 1;
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
						privilegioLista = ps.listarPrivilegios(idrol);

						session.setAttribute("listaPrivilegios", privilegioLista);

						x = 1;
						
						
					}
					
					datos.put("op", x);
					datos.put("idp", personaMap.get("idp"));
					datos.put("dni", personaMap.get("dni"));
					datos.put("rol", personaMap.get("rol"));
					datos.put("idrol", personaMap.get("idrol"));
					datos.put("listaPrivilegios", privilegioLista);
					System.out.println(datos);
					System.out.println(gson.toJson(datos));
					out.println(gson.toJson(datos));
				} else {
					out.println(0);
				}
			} else {
				
				session.setAttribute("idp", null);
				session.setAttribute("dni", null);
				session.setAttribute("user", null);
				session.setAttribute("rol", null);
				session.setAttribute("idrol", null);
				session.invalidate();
				response.sendRedirect("/portal/");
			}
		} catch (Exception e) {
			System.out.println("login controller" + e);
		}
	}

}
