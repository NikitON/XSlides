package com.team.xslides.web;

import javax.servlet.http.HttpServletRequest;

import com.team.xslides.domain.User;
import com.team.xslides.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }

    @RequestMapping("/home")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView register() {
        ModelAndView mv = new ModelAndView("registration");
        mv.addObject("user", new User());
        return mv;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute("user") User user) {
        ModelAndView mv = new ModelAndView("registration_success");
        userService.addUser(user);
        return mv;
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginTry(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        if (userService.isUserExist(request.getParameter("email"), request.getParameter("password"))) {
            mv.addObject("logined", "true");
            mv.setViewName("home");
        } else {
            mv.addObject("error", "true");
            mv.setViewName("redirect:/login");
        }
        return mv;
    }
    
    @RequestMapping("/logout")
    public ModelAndView logout() {
        ModelAndView mv = new ModelAndView("home");
        mv.addObject("logined", "false");
        return mv;
    }
}