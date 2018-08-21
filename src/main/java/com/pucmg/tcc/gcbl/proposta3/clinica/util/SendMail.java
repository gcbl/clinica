package com.pucmg.tcc.gcbl.proposta3.clinica.util;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMail {
    
   // Servidor de email
   private static final String SMTP_HOST = "smtp.server.com";
   private static final String username = "USERNAME";
   private static final String password = "PASSORWD";
   
   
   public static void teste() {
       String from = "from@domain";
       String to = "to@domain";


       String assunto = "Assunto da mensagem";
       String mensagem = "Corpo da mensagem";
       
       String caminhoAnexo = "C:/file.pdf";

       enviarEmail(from, to, assunto, mensagem, caminhoAnexo);
   }
    
   private static void enviarEmail(String from, String to, String assunto, String mensagem, String caminhoAnexo) {

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", SMTP_HOST);
      props.put("mail.smtp.port", "25");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
            }
         });

      try {
         // Create a default MimeMessage object.
         Message message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

         // Set Subject: header field
         message.setSubject(assunto);

         // Create the message part
         BodyPart messageBodyPart = new MimeBodyPart();

         // Now set the actual message
         messageBodyPart.setText(mensagem);

         // Create a multipart message
         Multipart multipart = new MimeMultipart();

         // Set text message part
         multipart.addBodyPart(messageBodyPart);

         // Part two is attachment
         messageBodyPart = new MimeBodyPart();
         String filename = caminhoAnexo; 
         DataSource source = new FileDataSource(filename);
         messageBodyPart.setDataHandler(new DataHandler(source));
         messageBodyPart.setFileName(filename);
         multipart.addBodyPart(messageBodyPart);

         // Send the complete message parts
         message.setContent(multipart);

         // Send message
         Transport.send(message);

         System.out.println("Mensagem enviada com sucesso...");
  
      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
      
   }
   
   
   public static void main(String[] args) {
       System.out.println("teste");
       teste();
       System.out.println("teste");
   }
   
   
}