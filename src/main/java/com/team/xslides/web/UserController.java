package com.team.xslides.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.xslides.domain.User;
import com.team.xslides.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public String index() {
        return "redirect:/";
    }

    @RequestMapping("/home")
    public String home() {
        return "redirect:/";
    }

    @RequestMapping("/registration")
    public String register(Map<String, Object> map) {
        map.put("user", new User());
        return "registration";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user, BindingResult result) {
    	if( !userService.hasUserWithEmail( user.getEmail() ) ){
	        userService.addUser(user);
	        return "registration_success";
    	}
    	return "registration_failed";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login()
    {
    	return "login";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login( HttpServletRequest request, HttpSession session )
    {
    	User user = userService.getUser(request.getParameter("email"), request.getParameter("password"));
    	session.removeAttribute("user");
    	session.setAttribute("user", user);
    	return "home";
    }
}