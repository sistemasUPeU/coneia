package pe.edu.upeu.CONEIA.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.service.DetalleInscripcionService;
import pe.edu.upeu.CONEIA.service.InscripcionService;

@Controller
@RequestMapping("/subscribe")
public class InscripcionController {
	Gson gs =  new Gson();
	public List<String> archi = new ArrayList<>();
	private static String UPLOADED_FOLDER = "C:\\Users\\Harold\\git\\coneia5\\CONEIA\\src\\main\\webapp\\resources\\files";
	
	@Autowired
	private InscripcionService insService;

	@Autowired
	private DetalleInscripcionService detalleService;
	// @Autowired
	// private DetalleInscripcionService detInsService;

	@RequestMapping("/")
	public @ResponseBody String main(HttpServletRequest request, HttpServletResponse response) {
		Gson g = new Gson();

		// TODO Auto-generated method stub

		List<Map<String, Object>> ret = new ArrayList<>();
		Map<String, Object> alq = null;
		List<String> lista = new ArrayList<>();
		List<String> x = new ArrayList<>();
		lista.add("Juan");
		lista.add("Pepe");
		lista.add("Pedro");
		lista.add("Tito");
		lista.add("Lucas");
		lista.add("Marcos");
		lista.add("Santiago");
		lista.add("Usil");
		lista.add("San Marcos");
		lista.add("UpEu");
		lista.add("Cayetano");
		lista.add("Hala Madrid");

		x.add("123");
		x.add("789");
		x.add("456");
		x.add("159");
		x.add("753");
		x.add("486");
		x.add("426");
		x.add("942");
		x.add("931");
		x.add("138");
		x.add("178");
		x.add("194");

		try {

			for (int i = 0; i < lista.size(); i++) {
				alq = new HashMap<String, Object>();

				alq.put("name", lista.get(i));
				alq.put("icon", x.get(i));
				ret.add(alq);
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error alquiler ususus:" + e);
		}

		System.out.println(g.toJson(ret));
		return g.toJson(ret);

	}



	@RequestMapping("/InscripcionDetalleMax")
	public @ResponseBody String IdInscripcionDetalle(HttpServletRequest request, HttpServletResponse response) {
		Gson g = new Gson();
		int maxdet = 0;

		try {
			maxdet = detalleService.maxIdDetalle();
			System.out.println("maxdet " + maxdet);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error alquiler detalle mx:" + e);
		}

		return g.toJson(maxdet);

	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/createEnrollment")
	public @ResponseBody String CreateEnrollment(HttpServletRequest request, HttpServletResponse response) {
		Gson g = new Gson();


		int answer = 0;

		try {
			// String name = request.getParameter("nombre");
			// String lastName = request.getParameter("apellido");
			// String email = request.getParameter("correo");
			// String university = request.getParameter("uni");
			// String dni = request.getParameter("uni");
			// String career = request.getParameter("career");

			/*
			 * System.out.println(tipo); System.out.println(numero);
			 * System.out.println(ncamas);
			 */
			Inscripcion h = new Inscripcion();
			// Tipo t = s.get(Tipo.class, tipo);
			// h.set(t);;
			// h.setNumero(numero);
			// h.setNcamas(ncamas);
			// if(hd.create(h)==1){
			// out.println(1);
			// }
			

			

//			Object datos = gs.fromJson(request.getParameter("op"), List<String> df);
			Object datos = request.getParameter("op");
			String data =  request.getParameter("op");
			System.out.println("controller obj" + datos);
			System.out.println("controller string" + data);
			

			answer = insService.create("", data);
			System.out.println("answer controller" + answer);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error controller:" + e);
		}

		return g.toJson(answer);

	}

	@RequestMapping("/createDetailEnrollment")
	public @ResponseBody String CreateDetailEnrollment(HttpServletRequest request, HttpServletResponse response) {
		Gson g = new Gson();
		int maxdet = 0;

		try {
			maxdet = detalleService.maxIdDetalle();
			System.out.println("maxdet " + maxdet);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error alquiler detail:" + e);
		}

		return g.toJson(maxdet);

	}

	
	@Autowired
	ServletContext context;

	@RequestMapping(path = "/uploadfile", method = RequestMethod.POST)
    @ResponseBody
	public int handleFormUpload(@RequestParam("file") List<MultipartFile> file,@RequestParam("voucher") String voucher, @RequestParam("idinscripcion") String id, HttpServletResponse response) throws IOException {

		System.out.println(file);
		System.out.println(voucher);
		System.out.println("inscripcion> " + id);
		int res = 0;
		
//        for (MultipartFile file : files) {
//
//            if (file.isEmpty()) {
//                continue; //next pls
//            }
//
//            byte[] bytes = file.getBytes();
//            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
//            Files.write(path, bytes);
//
//        }
		
		
		if (!file.isEmpty()) {

			try {
				for (MultipartFile fi : file) {
					System.out.println(file);
//					String path = context.getRealPath("/WEB-INF/") + File.separator + fi.getOriginalFilename();
					
					String path = UPLOADED_FOLDER  + File.separator + fi.getOriginalFilename();
					String nome= fi.getOriginalFilename();
				
					nome="voucher"+id;
					FilenameUtils fich = new FilenameUtils();
					
					path = UPLOADED_FOLDER  + File.separator + nome+"."+FilenameUtils.getExtension(path);
					
					
					File destFile = new File(path);
					
					fi.transferTo(destFile);
					archi.add(destFile.getName());
					archi.add(destFile.getPath());
//					FilenameUtils fich = new FilenameUtils();
					archi.add(FilenameUtils.getExtension(path));
					
					
					archi.add(String.valueOf(destFile.length()));
					
					String nombre = destFile.getName();
					String url = destFile.getPath();
					System.out.println(nombre);

					Inscripcion in = new Inscripcion();
					in.setIdinscripcion(Integer.parseInt(id));
					in.setNroVoucher(voucher);
					in.setUrlVoucher(nombre);
					res = insService.update(in);
//					res = vd.subirDocumento("", "", url, idvac);
				}

			} catch (IOException | IllegalStateException ec) {
				ec.getMessage();
				ec.printStackTrace();
			}
			System.out.println("gson> " + gs.toJson(archi));

			System.out.println("respuesta>> " + res);

		}
		
		 return res;// + url;
		// return gson.toJson(archi);
	}
	
	
}
