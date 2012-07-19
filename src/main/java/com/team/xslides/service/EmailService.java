package com.team.xslides.service;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import com.team.xslides.domain.User;

@Service
public class EmailService {
    private HtmlEmail email;
    
    private void setDefaults() throws EmailException {
        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(465);
        email.setSSL(true);
        email.setAuthenticator(new DefaultAuthenticator("team.xslides", "1Romka2Nikita"));
        email.setFrom("team.xslides@gmail.com");
        email.setCharset("utf8");
    }
    
    public boolean sendConfirmEmail(User user, String link) {
        try {
            email = new HtmlEmail();
            setDefaults();
            email.setSubject("XSlides registration");
            email.setHtmlMsg("<h3>" + user.getDisplayname() + "</h3>" +
                          "<h4>Welcome and thank you for registering at XSlides!</h4>" +
                          "<h4>Please follow this link to confirm your e-mail:</h4>" +
                          "<a href=http://localhost:8080/XSlides/confirm/" + link + ">Confirm e-mail</a>" +
                          "<h4>If you don't understand what we are talking about, just ignore this message.</h4>" +
                          "<h4>===================================================</h4>" +
                          "<h4>Добро пожаловать на XSlides! Спасибо, что зарегистрировались на нашем сервисе.</h4>" +
                          "<h4>Пожалуйста, пройдите по ссылке для подтверждения e-mail:</h4>" +
                          "<a href=http://localhost:8080/XSlides/confirm/" + link + ">Подтвердить e-mail</a>" +
                          "<h4>Если вы не понимаете, о чем речь, то просто проигнорируйте это сообщение.</h4>");
            email.addTo(user.getEmail());
            email.send();
        } catch (EmailException exception) {
            return false;
        }
        return true;
    }
    
    public boolean sendNewPassowrd(User user, String newPassword) {
        try {
            email = new HtmlEmail();
            setDefaults();
            email.setSubject("XSlides New password");
            email.setHtmlMsg("<h3>" + user.getDisplayname() + " " + "</h3>" +
                          "<h4>This is your new password:</h4>" +
                          "<h3>" + newPassword + "</h3>" +
                          "<h4>Use it to login. Further you can change it at your settings page.</h4>" +
                          "<h4>===================================================</h4>" +
                          "<h4>Это ваш новый пароль:</h4>" +
                          "<h3>" + newPassword + "</h3>" +
                          "<h4>Используйте его, чтобы войти в систему. В дальнейшем вы можете его изменить в настройках профиля.</h4>");
            email.addTo(user.getEmail());
            email.send();
        } catch (EmailException exception) {
            return false;
        }
        return true;
    }
}
