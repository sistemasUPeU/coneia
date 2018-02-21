package pe.edu.upeu.CONEIA.test;

import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.Session;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import pe.edu.upeu.CONEIA.dao.PersonaDAO;
import pe.edu.upeu.CONEIA.dao.TallerDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.InscripcionTaller;
import pe.edu.upeu.CONEIA.entity.Taller;
import pe.edu.upeu.CONEIA.util.HibernateUtils;


import java.security.*;
import sun.misc.*;




public class Test {

	public static Session s;
//	private static TallerDAO td = new TallerDAO();
	private static Taller t = new Taller();;
	private static DetalleInscripcion d = new DetalleInscripcion();;
	private static Gson gson = new Gson();

	// -------------
	private static final String ALGORITHM = "AES";
	private static final int ITERATIONS = 2;
	private static final byte[] keyValue = new byte[] { 'T', 'h', 'i', 's', 'I', 's', 'A', 'S', 'e', 'c', 'r', 'e', 't',
			'K', 'e', 'y' };

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		// conex();
		// login();
		// taller();
		// createTaller();
		// listar();

		
		

		
		
		
//		GX8jEr04o6PC+IE+f6DXq+zuRiZ2nsSL+UYxYRh9vK28xt/GrLqnbrP3hkXSW5S3jNgzXkrLSmXm
//		fwRw+eBMWQJO+8tlSEE9D2Y9qEzowX18s4W81U/D9JL3JX7uJtwp
//		GX8jEr04o6PC+IE+f6DXq+zuRiZ2nsSL+UYxYRh9vK28xt/GrLqnbrP3hkXSW5S3jNgzXkrLSmXm
//		fwRw+eBMWQJO+8tlSEE9D2Y9qEzowX18s4W81U/D9JL3JX7uJtwp
		
//		 String password = "mypassword";
//	        String salt = "this is a simple clear salt";
//	        String passwordEnc = encrypt(password, salt);
//	        String passwordDec = decrypt(passwordEnc, salt);
//	 
//	        System.out.println("Salt Text : " + salt);
//	        System.out.println("Plain Text : " + password);
//	        System.out.println("Encrypted : " + passwordEnc);
//	        System.out.println("Decrypted : " + passwordDec);
		
		
		
		// String encriptado = Encriptar("coneia2018");
		//// oHoZpnxd5B9vYj9lOBTPzA==
		//// oHoZpnxd5B9vYj9lOBTPzA==
		// System.out.println(encriptado);
		// String desencriptado;
		// try {
		// desencriptado = Desencriptar(encriptado);
		// System.out.println(desencriptado);
		// } catch (Exception e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		// String textoCifrado;
		// try {
		// textoCifrado = cifra("conererteia2018").toString();
		// System.out.println(textoCifrado);
		// } catch (Exception e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		// //Cifrando texto
		// String textoCifrado = cifrar("codes and tags... ");
		// System.out.println(textoCifrado);
		//
		// //Descifrando texto
		// String textoDescifrado = descifrar(textoCifrado);
		// System.out.println(textoDescifrado);

		// //Ejemplo con varias cadenas
		// String[] cadenas = new String[4];
		// cadenas[0] = "Los pollitos dicen, pio pio pio... cuando tienen hambre, cuando
		// tienen frio";
		// cadenas[1] = "Habia una vez una iguana con una cara de rana";
		// cadenas[2] = "Hoy es Sabado y esta lloviendo en bogota, que vaina...";
		// cadenas[3] = "Este es mi ultimo ejemplo jejeje....";
		//
		// //Cifrando cada cadena del arreglo
		// System.out.println("\n Cifrando unas cuantas cadenas...");
		// for (int i = 0; i < cadenas.length; i++) {
		// cadenas[i] = cifrar(cadenas[i]);
		// System.out.println("Cadena " + (i + 1) + " : " + cadenas[i]);
		// }
		//
		// //Ahora Descifrando el contenido de las cadenas
		// System.out.println("\n Descifrando las cadenas de ahorita...");
		// for (int i = 0; i < cadenas.length; i++) {
		// cadenas[i] = descifrar(cadenas[i]);
		// System.out.println("Cadena " + (i + 1) + " : " + cadenas[i]);
		// }

	}


	
	public static String encrypt(String value, String salt) throws Exception {
		Key key = generateKey();
		Cipher c = Cipher.getInstance(ALGORITHM);
		c.init(Cipher.ENCRYPT_MODE, key);

		String valueToEnc = null;
		String eValue = value;
		for (int i = 0; i < ITERATIONS; i++) {
			valueToEnc = salt + eValue;
			byte[] encValue = c.doFinal(valueToEnc.getBytes());
			eValue = new BASE64Encoder().encode(encValue);
		}
		return eValue;
	}

	public static String decrypt(String value, String salt) throws Exception {
		Key key = generateKey();
		Cipher c = Cipher.getInstance(ALGORITHM);
		c.init(Cipher.DECRYPT_MODE, key);

		String dValue = null;
		String valueToDecrypt = value;
		for (int i = 0; i < ITERATIONS; i++) {
			byte[] decordedValue = new BASE64Decoder().decodeBuffer(valueToDecrypt);
			byte[] decValue = c.doFinal(decordedValue);
			dValue = new String(decValue).substring(salt.length());
			valueToDecrypt = dValue;
		}
		return dValue;
	}

	private static Key generateKey() throws Exception {
		Key key = new SecretKeySpec(keyValue, ALGORITHM);
		// SecretKeyFactory keyFactory
		// = SecretKeyFactory.getInstance(ALGORITHM);
		// key = keyFactory.generateSecret(new DESKeySpec(keyValue));
		return key;
	}

	public static String Encriptar(String texto) {

		String secretKey = "qualityinfosolutions"; // llave para encriptar datos
		String base64EncryptedString = "";

		try {

			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
			byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);

			SecretKey key = new SecretKeySpec(keyBytes, "DESede");
			Cipher cipher = Cipher.getInstance("DESede");
			cipher.init(Cipher.ENCRYPT_MODE, key);

			byte[] plainTextBytes = texto.getBytes("utf-8");
			byte[] buf = cipher.doFinal(plainTextBytes);
			byte[] base64Bytes = Base64.encodeBase64(buf);
			base64EncryptedString = new String(base64Bytes);

		} catch (Exception ex) {
		}
		return base64EncryptedString;
	}

	public static String Desencriptar(String textoEncriptado) throws Exception {

		String secretKey = "qualityinfosolutions"; // llave para encriptar datos
		String base64EncryptedString = "";

		try {
			byte[] message = Base64.decodeBase64(textoEncriptado.getBytes("utf-8"));
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
			byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
			SecretKey key = new SecretKeySpec(keyBytes, "DESede");

			Cipher decipher = Cipher.getInstance("DESede");
			decipher.init(Cipher.DECRYPT_MODE, key);

			byte[] plainText = decipher.doFinal(message);

			base64EncryptedString = new String(plainText, "UTF-8");

		} catch (Exception ex) {
		}
		return base64EncryptedString;
	}

	public static byte[] cifra(String sinCifrar) throws Exception {
		final byte[] bytes = sinCifrar.getBytes("UTF-8");
		final Cipher aes = obtieneCipher(true);
		final byte[] cifrado = aes.doFinal(bytes);

		return cifrado;
	}

	public static String descifra(byte[] cifrado) throws Exception {
		final Cipher aes = obtieneCipher(false);
		final byte[] bytes = aes.doFinal(cifrado);
		final String sinCifrar = new String(bytes, "UTF-8");
		return sinCifrar;
	}

	private static Cipher obtieneCipher(boolean paraCifrar) throws Exception {
		// final String frase =
		// "FraseLargaConDiferentesLetrasNumerosYCaracteresEspeciales_áÁéÉíÍóÓúÚüÜñÑ1234567890!#%$&()=%_NO_USAR_ESTA_FRASE!_";
		final String frase = "treofxcv23434598$%/*)(%$#";
		final MessageDigest digest = MessageDigest.getInstance("SHA");
		digest.update(frase.getBytes("UTF-8"));
		final SecretKeySpec key = new SecretKeySpec(digest.digest(), 0, 16, "AES");

		final Cipher aes = Cipher.getInstance("AES/ECB/PKCS5Padding");
		if (paraCifrar) {
			aes.init(Cipher.ENCRYPT_MODE, key);
		} else {
			aes.init(Cipher.DECRYPT_MODE, key);
		}

		return aes;
	}

	// Charset de caracteres cuando se cifra
	private static String charset1 = "6540#$&/576@";
	// Charset de caracteres cuando se descifra
	private static String charset2 = "abcdefghijk ";

	// Charset de caracteres cuando se cifra
	// private static String charset1 = "1234567890!#$%&/()=¿?¡_-+*:";
	// Charset de caracteres cuando se descifra
	// private static String charset2 = "abcdefghijklmnopqrstuvwxyz ";
	/**
	 * Metodo que recibe un texto y cifra el contenido de acuerdo a los charset
	 * definidos
	 * 
	 * @param texto
	 * @return texto
	 */
	public static String cifrar(String texto) {
		// Convierto a minuscula las letras del alfabeto que existan en el texto
		texto = texto.toLowerCase();
		// Reemplazo los caracteres del charset2 con los del charset1
		for (int i = 0; i < charset2.length(); i++) {
			texto = texto.replace(charset2.charAt(i), charset1.charAt(i));
		}
		// Retorno el texto cifrado con el charset2
		return texto;
	}

	/**
	 * Metodo que recibe un texto y descifra el contenido de acuerdo a los charset
	 * definidos
	 * 
	 * @param texto
	 * @return texto
	 */
	public static String descifrar(String texto) {
		// Convierto a minuscula las letras del alfabeto que existan en el texto
		texto = texto.toLowerCase();
		// Reemplazo los caracteres del charset1 con los del charset2
		for (int i = 0; i < charset1.length(); i++) {
			texto = texto.replace(charset1.charAt(i), charset2.charAt(i));
		}
		// Retorno el texto cifrado con el charset2
		return texto;
	}

	// public static void conex() {
	// s= HibernateUtils.getSessionFactory().openSession();
	// if(s.isOpen()) {
	// System.out.println("si");
	// }else {
	// System.out.println("no");
	// }
	// }

	public static void createTaller() {
		InscripcionTaller it = new InscripcionTaller();
		t.setIdtaller(1);
		d.setIddetalleInscripcion(1);
		it.setDetalleInscripcion(d);
		it.setTaller(t);
//		if (td.create(it) == 1) {
//			System.out.println("Jonas estas de suerte");
//		} else {
//			System.out.println("nada Jonas");
//		}
	}

	public static void listar() {
//		System.out.println(gson.toJson(td.readAll()));
	}

	public static void login() {
		// System.out.println(gson.toJson(pd.login("48417500")));
	}

	public static void taller() throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date fecha = formatter.parse("2018-06-04");
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
		Date hora = formatter2.parse("10:30");
//		System.out.println(gson.toJson(td.buscarTaller(hora, fecha, 1)));
	}

}
