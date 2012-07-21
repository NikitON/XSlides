package com.team.xslides.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
        return new ModelAndView("registration");
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView registration(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("registration");
        User user = new User();
        user.setDisplayname(request.getParameter("displayname"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        if (userService.hasUserWithEmail(user.getEmail())) {
            mv.addObject("errorEmailInUse", true);
        } else {
            if (!emailService.sendConfirmEmail(user,hashService.getHash(user.getEmail()))) {
                mv.addObject("errorServer", true);
            } else {
                userService.addUser(user);
                mv.setViewName("redirect:/registrationSuccess");
            }
        }
        return mv;
    }
    
    @RequestMapping(value = "/confirm/{digest}", method = RequestMethod.GET)
    public ModelAndView confirmation(@PathVariable("digest") String digest, HttpSession session) {
        ModelAndView mv = new ModelAndView("redirect:/confirmSuccess");
        List<User> userList = userService.getNotConfirmedList();
        for (User user : userList) {
            if (digest.equals(hashService.getHash(user.getEmail()))) {
                userService.switchConfirmedStatus(user.getId());
                return mv;
            }
        } 
        session.setAttribute("errorNotRegistered", true);
        mv.setViewName("redirect:/accessDenied");
        return mv;
    }
    
    @RequestMapping("/confirmSuccess")
    public ModelAndView confirmSuccess() {
        return new ModelAndView("confirm_success");
    }
    
    @RequestMapping("/registrationSuccess")
    public ModelAndView registrationSuccess() {
        return new ModelAndView("registration_success");
    }
}
