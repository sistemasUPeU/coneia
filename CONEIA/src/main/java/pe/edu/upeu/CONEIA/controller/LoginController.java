package pe.edu.upeu.CONEIA.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.dao.PersonaDAO;
import pe.edu.upeu.CONEIA.entity.Persona;

@Controller
public class LoginController {
	private static final PersonaDAO pd = new PersonaDAO();
	private static final Persona p = new Persona();
	private static Gson gson = new Gson();
	Map<String, Object> personaMap = new HashMap<>();  
	
	@RequestMapping(value="/logon")
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		PrintWriter out = response.getWriter();
		String dni = request.getParameter("dni");
		HttpSession session = request.getSession(true);
		int x = 0;
		int op = Integer.parseInt(request.getParameter("op"));
		RequestDispatcher dispatcher;
		try {
			if (op == 1) {
				if (pd.login(dni) != null) {
					personaMap = pd.login(dni);
					session.setAttribute("idp", personaMap.get("idpersona"));
					session.setAttribute("dni", personaMap.get("dni"));
					session.setAttribute("nombre", personaMap.get("nombre"));
					session.setAttribute("paterno", personaMap.get("paterno"));
					session.setAttribute("materno", personaMap.get("materno"));
					session.setAttribute("rol", personaMap.get("rol"));
					session.setAttribute("inscripcion", personaMap.get("inscripcion"));
					Map<String, Object> datos = new HashMap<>();
					x = 1;
					datos.put("op", x);
					datos.put("idp", personaMap.get("idp"));
					datos.put("dni", personaMap.get("dni"));
					datos.put("rol", personaMap.get("rol"));
					out.println(gson.toJson(datos));
				} else {
					out.println(0);
				}
			} else {
				session.setAttribute("idp", null);
				session.setAttribute("dni", null);
				session.setAttribute("user", null);
				session.setAttribute("rol", null);
				session.invalidate();

			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
