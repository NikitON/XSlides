package com.team.xslides.web;

import java.util.Map;

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
        userService.addUser(user);
        return "registration_success";
    }
}