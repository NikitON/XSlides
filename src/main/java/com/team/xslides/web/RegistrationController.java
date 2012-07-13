package com.team.xslides.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.xslides.domain.User;
import com.team.xslides.service.UserService;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;
    
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView registration() {
        ModelAndView mv = new ModelAndView("registration");
        mv.addObject("user", new User());
        return mv;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView registration(@ModelAttribute("user") User user) {
        ModelAndView mv = new ModelAndView("redirect:/registration");
        if (userService.hasUserWithEmail(user.getEmail())) {
                mv.addObject("error", "true");
                mv.addObject("message", "E-mail is already in use");
        } else {
            userService.addUser(user);
            mv.setViewName("registration_success");
        }
        return mv;
    }

}
