package com.team.xslides.service;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    private Email email;
    
    public EmailService() {
        email = new SimpleEmail();
        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(465);
        email.setSSL(true);
        email.setAuthenticator(new DefaultAuthenticator("team.xslides", "1Romka2Nikita"));
        try {
            email.setFrom("team.xslides@gmail.com");
        } catch(EmailException exception) {
            // do nothing
        }
        email.setSubject("XSlides registration");
    }
    
    public boolean sendEmail(String address, String name, String link) {
        try {
            String html = "<h3>" + name + "</h3>" +
                          "<h4>Welcome and thank you for registering at XSlides!</h4>" +
                          "<h4>Please follow this link to confirm your e-mail:</h4>" +
                          "<a href=http://localhost:8080/XSlides/confirm/" + link + ">Confirm email</a>";
            email.setContent(html, "text/html");
            email.addTo(address);
            email.send();
        } catch (EmailException exception) {
            return false;
        }
        return true;
    }

}
