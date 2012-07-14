package com.team.xslides.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.xslides.domain.User;
import com.team.xslides.service.EmailService;
import com.team.xslides.service.HashService;
import com.team.xslides.service.UserService;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;
    
    @Autowired
    private HashService hashService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView registration() {
        ModelAndView mv = new ModelAndView("registration");
        mv.addObject("user", new User());
        return mv;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView registration(@ModelAttribute("user") User user) {
        ModelAndView mv = new ModelAndView("registration");
        if (userService.hasUserWithEmail(user.getEmail())) {
            mv.addObject("message", "E-mail is already in use.");
        } else {
            if (!emailService.sendConfirmEmail(user,hashService.getHash(user.getEmail()))) {
                mv.addObject("message", "Sorry. There are problems at our server. Please try again later.");
                mv.setViewName("registration");
            } else {
                userService.addUser(user);
                mv.setViewName("registration_success");
            }
        }
        return mv;
    }
    
    @RequestMapping(value = "/confirm/{digest}", method = RequestMethod.GET)
    public ModelAndView confirmation(@PathVariable("digest") String digest) {
        ModelAndView mv = new ModelAndView("redirect:/confirm_success");
        List<User> userList = userService.getNotConfirmedList();
        for (User user : userList) {
            if (digest.equals(hashService.getHash(user.getEmail()))) {
                userService.switchConfirmedStatus(user.getId());
                return mv;
            }
        } 
        mv.addObject("message", "You're already confirmed or not registered yet.");
        mv.setViewName("redirect:/access_denied");
        return mv;
    }
    
    @RequestMapping("/confirm_success")
    public ModelAndView confirmSuccess() {
        return new ModelAndView("confirm_success");
    }
}
