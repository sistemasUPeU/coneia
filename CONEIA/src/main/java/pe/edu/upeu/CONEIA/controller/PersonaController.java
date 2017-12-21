package pe.edu.upeu.CONEIA.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Scope("request")
@RequestMapping("/")
public class PersonaController {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		RequestDispatcher dispatcher;
		int op = Integer.parseInt(request.getParameter("op"));
		HttpSession session = request.getSession();
		String url;
		switch(op) {
		case 1:
			
			break;
		
		}
		
	}
	
}
