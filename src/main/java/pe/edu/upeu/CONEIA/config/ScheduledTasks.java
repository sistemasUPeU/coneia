package pe.edu.upeu.CONEIA.config;


import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.security.CodeSource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import pe.edu.upeu.CONEIA.test.Test;


@Service
public class ScheduledTasks {

	
//	  @Scheduled(fixedDelay=10000)
//	  @Scheduled(cron="0 0 18 ? * Sun")
//	  @Scheduled(cron="0 49 18 ? * Wed")
	  @Scheduled(cron="0 06 19 * * ?")
	  
	    public void ejecutarCadaDiezSegs() throws ParseException {
		
		  
		  String timeStamp =new SimpleDateFormat("ddMMyy").format(Calendar.getInstance().getTime());

//	        LOG.info("Fixed Rate Task :: Execution Time - {}",  Thread.currentThread().getName() );
		  Backupdbtosql(timeStamp);
	    }  
	  
	  public static void Backupdbtosql(String fecha) {
			try {
//				HttpServletRequest request = null;
//				ServletContext cntx = request.getServletContext();
//				String path = cntx.getRealPath("/resources/");

				/* NOTE: Getting path to the Jar file being executed */
				/* NOTE: YourImplementingClass-> replace with the class executing the code */
				CodeSource codeSource = Test.class.getProtectionDomain().getCodeSource();
				File jarFile = new File(codeSource.getLocation().toURI().getPath());
				String jarDir = jarFile.getParentFile().getPath();

				/* NOTE: Creating Database Constraints */
				String dbName = "appconeia_db";
				String dbUser = "appconeia";
				String dbPass = "GjHc8qAjdBCOepE5";

				/* NOTE: Creating Path Constraints for folder saving */
				/* NOTE: Here the backup folder is created for saving inside it */
				String folderPath = jarDir + "\\backup";

				/* NOTE: Creating Folder if it does not exist */
				File f1 = new File(folderPath);
				f1.mkdir();

				/* NOTE: Creating Path Constraints for backup saving */
				/*
				 * NOTE: Here the backup is saved in a folder called backup with the name
				 * backup.sql
				 */
//				String savePath = "\"" + jarDir + "\\backup\\" + "backup.sql\"";
				String savePath = jarDir + "\\backup\\" + "backup"+fecha+".sql";
				System.out.println(savePath);
				/* NOTE: Used to create a cmd command */
//				String executeCmd = "mysqldump -u" + dbUser + " -p " + dbPass + " --database " + dbName + " -r " + savePath;
				String executeCmd = "C:\\xampp\\mysql\\bin\\mysqldump --user=" + dbUser + " --password=" + dbPass + " --databases " + dbName + " -r " + savePath;

				/* NOTE: Executing the command here */
				
				System.out.println(executeCmd);
//				C:\\Program Files\\MySQL\\MySQL Workbench 6.3 CE
//				C:\\Program Files\\MySQL\\MySQL Server 5.6\\bin
//				String str ="C:/uploaded_files/111.txt";
//				Process process = Runtime.getRuntime().exec(new String[]{"cmd.exe", "/c",str})
				Process runtimeProcess = Runtime.getRuntime().exec(new String[]{"cmd.exe", "/c",executeCmd});
			
				int processComplete = runtimeProcess.waitFor();

				/*
				 * NOTE: processComplete=0 if correctly executed, will contain other values if
				 * not
				 */
				System.out.println(processComplete);
				if (processComplete == 0) {
					System.out.println("Backup Complete");
				} else {
					System.out.println("Backup Failure");
				}

			} catch (URISyntaxException | IOException | InterruptedException ex) {
				JOptionPane.showMessageDialog(null, "Error at Backuprestore" + ex.getMessage());
			}
		}
}
