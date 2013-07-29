package com.springapp.mvc.mail;

import com.sun.mail.smtp.SMTPTransport;
import java.security.Security;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 25/7/13
 * Time: 4:05 PM
 * To change this template use File | Settings | File Templates.
 */

public class GoogleMail {
    private String username;
    private String password;

    public GoogleMail(String username, String password) {
        this.username=username;
        this.password=password;
    }

    public void Send(String recipientEmail, String title, String message) throws MessagingException {
        Send(recipientEmail, "", title, message);
    }

    public void Send(String recipientEmail, String ccEmail, String title, String message) throws AddressException, MessagingException {
        System.out.println("pehli baar.");
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        System.out.println("dusri baar.");

        // Get a Properties object
        Properties props = System.getProperties();
        props.setProperty("mail.smtps.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.setProperty("mail.smtps.auth", "true");

        System.out.println("teesri baar.");
        props.put("mail.smtps.quitwait", "false");

        Session session = Session.getInstance(props, null);

        // -- Create a new message --
        final MimeMessage msg = new MimeMessage(session);

        System.out.println("chauthi baar.");

        // -- Set the FROM and TO fields --
        msg.setFrom(new InternetAddress(username + "@gmail.com"));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail, false));

        System.out.println("paanchvi baar.");

        if (ccEmail.length() > 0) {
            msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(ccEmail, false));
        }

        System.out.println("chhatti baar.");

        msg.setSubject(title);
        msg.setText(message, "utf-8");
        msg.setSentDate(new Date());

        System.out.println("saatvi baar.");

        SMTPTransport t = (SMTPTransport)session.getTransport("smtps");

        System.out.println("aatthvi baar.");

        t.connect("smtp.gmail.com", username, password);
        t.sendMessage(msg, msg.getAllRecipients());
        t.close();

        System.out.println("aakhri baar.");
    }
}