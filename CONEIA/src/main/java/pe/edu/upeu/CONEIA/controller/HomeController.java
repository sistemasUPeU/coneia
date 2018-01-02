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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/")
public class HomeController {
	
	
	@RequestMapping("/")
	public String main(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
	
		
		return "main";
	}
	
	@RequestMapping("inscripcion")
	public ModelAndView SignIn(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
	
		model.setViewName("inscripcion");
		
		
		
		return model;
	}
	
	@RequestMapping("programa")
	public ModelAndView Program(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
	
		model.setViewName("programa");
		
		
		
		return model;
	}
	
	@RequestMapping("talleres")
	public ModelAndView Taller(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
	
		model.setViewName("talleres");
		
		
		
		return model;
	}
	
	
	
	
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
