package pe.edu.upeu.CONEIA.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.upeu.CONEIA.entity.InscripcionTaller;
import pe.edu.upeu.CONEIA.service.InscripcionTallerService;

@Controller
public class InscripcionTallerController {
	
	@Autowired
	private InscripcionTallerService its;
	
	
	private InscripcionTaller it = new InscripcionTaller();
	
	int cont = 0;
	
	@RequestMapping("talleres")
	protected void doGet(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException, ParseException {
		PrintWriter out = response.getWriter();
		int op = Integer.parseInt(request.getParameter("op"));
		switch (op) {
		case 1:
			
			int idd = Integer.parseInt(session.getAttribute("inscripcion").toString());
			String array = request.getParameter("array");
			String[] lista = array.split(",");
			//-----------------------------
			for(String item:lista) {
				int idt = Integer.parseInt(item);
				if(its.create(it,idd,idt)==1) {
					cont++;
				}
			}
			out.println(cont);
			cont = 0;
			break;
		case 2:	
			break;
		}

	}
	
}
