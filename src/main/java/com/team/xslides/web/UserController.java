package com.team.xslides.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.xslides.domain.User;
import com.team.xslides.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpSession session) {
        User user = userService.getUser(request.getParameter("email"), request.getParameter("password"));
        ModelAndView mv = new ModelAndView();
        if (user != null) {
            session.removeAttribute("user");
            session.setAttribute("user", user);
            mv.addObject("logined", "true");
            mv.addObject("isadmin", user.getAdmin().toString());
            mv.setViewName("home");
        } else {
            mv.addObject("error", "true");
            mv.setViewName("login");
        }
        return mv;
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout() {
        ModelAndView mv = new ModelAndView("home");
        mv.addObject("logined", "false");
        return mv;
    }
    
    @RequestMapping(value = "/usermanage", method = RequestMethod.GET)
    public ModelAndView managePage() {
        ModelAndView mv = new ModelAndView("administration");
        mv.addObject("userList", userService.getUsersList());
        return mv;
    }
    
    @RequestMapping(value = "/delete/{userId}", method = RequestMethod.POST)
    public ModelAndView manage(@PathVariable("userId") Integer userId) {
        ModelAndView mv = new ModelAndView();
        return mv;
    }
}