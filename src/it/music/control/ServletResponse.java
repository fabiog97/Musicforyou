package it.music.control;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.io.IOException;

import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletResponse")
public class ServletResponse extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		

		response.setContentType("text/html");
		
		StringBuffer packed = new StringBuffer();
		packed.append("<info>");
				
		String name = (String)request.getParameter("name");
		String mail = (String)request.getParameter("mail");
		String comment = (String)request.getParameter("comment");
		String res = name+ " Thank you. We will contact you as soon as possible";

		
		try {
			
			final String username = "music4yousalgra@gmail.com";
			final String password = "grsfba97";

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });
			
			
			
			String to = "fabiog97@gmail.com";
			String from = "music4yousalgra@gmail.com";
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mail, name));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to));
			message.setSubject("Nuovo contatto da sito web");
			message.setText("Ciao Fabio, \n" + 
					name+" ti ha lasciato un messaggio sul sito web:\n\n"
					+comment+"\n\n"
					+"Puoi risponderlo sulla sua mail: "+mail
				+ "\nBy Music4You team!");

			Transport.send(message);
			
			
			message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(mail));
			message.setSubject("Musicforyou");
			message.setText("Hello "+name+", \n" + 
					"Thank you for contacting us, one of our operators will reply as soon as possible\n\n"
				+ "\nBy Musicforyou team!\nGeneral information: (361) 594-3852\nOrder's information: (361) 594-4294\nwww.musicforyou.it\n");
			

			Transport.send(message);

			System.out.println("Done");
			
			
			
		//	Thread.sleep(3000);
		} catch(Exception e) {}
		
		response.getWriter().write(res);		
	}
	
	
	private static final long serialVersionUID = 1L;
    
    public ServletResponse() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}	

}
