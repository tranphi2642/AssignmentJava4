package com.fpoly.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.fpoly.entity.Email;

public class SendMail {
	public static void sendMail(Email email) throws Exception {
		
		Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.required", "true");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
//		Properties properties = new Properties();
//		
//        properties.put("mail.transport.protocol", "smtp");
//        properties.put("mail.smtp.host","smtp.gmail.com");
//        properties.put("mail.smtp.port", "587");
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.starttls.required", "true");
//        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
//        
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
            	return new PasswordAuthentication(email.getForm(), email.getFormPassword());
            }
        };
        String resultMessage = "";
        Session session = Session.getInstance(properties, auth);
        Transport transport = session.getTransport(); 
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email.getForm()));
            message.setRecipients(Message.RecipientType. TO, InternetAddress.parse(email.getTo()));
            message.setSubject(email.getSubject());
            message.setText(email.getContent());
            
            transport.connect();  
            Transport.send(message,message.getAllRecipients());  
            transport.close();

        	resultMessage = "The e-mail was sent successfully";
         } catch (Exception ex) {
             ex.printStackTrace();
             resultMessage = "There were an error: " + ex.getMessage();
         } 

	}
}

