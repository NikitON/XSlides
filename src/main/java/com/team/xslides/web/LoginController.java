package com.team.xslides.web;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.xslides.domain.User;
import com.team.xslides.service.UserService;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(HttpSession session) {
        if (session.getAttribute("user") != null) {
            session.setAttribute("errorLogged", true);
            return new ModelAndView("redirect:/accessDenied");
        }
        return new ModelAndView("login");
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpSession session) {
        User user = userService.getUser(request.getParameter("email"), request.getParameter("password"));
        ModelAndView mv = new ModelAndView();
        if (user != null) {
            if (user.getConfirmed()) {
                session.removeAttribute("user");
                session.setAttribute("user", user);
                mv.setViewName("redirect:/home");
            } else {
                mv.addObject("errorCheck", true);
                mv.setViewName("login");
            }
        } else {
            mv.addObject("errorEmail", true);
            mv.setViewName("login");
        }
        return mv;
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session) {
        ModelAndView mv = new ModelAndView("redirect:/home");
        if (session.getAttribute("user") == null) {
            session.setAttribute("errorNotLogged", true);
            mv.setViewName("redirect:/accessDenied");
        } else {
            session.removeAttribute("user");
        }
        return mv;
    }
}
