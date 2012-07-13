package com.team.xslides.web;

import javax.servlet.http.HttpSession;

import com.team.xslides.domain.User;
import com.team.xslides.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
        
    @RequestMapping(value = "/administration", method = RequestMethod.GET)
    public ModelAndView administration(HttpSession session) {
        User user = new User();
        ModelAndView mv = new ModelAndView("administration");
        if ((user = (User) session.getAttribute("user")) == null || !user.getAdmin()) {
            mv.setViewName("redirect:/access_denied");
        } else {
            mv.addObject("userList", userService.getUsersList());
        }
        return mv;
    }
    
    @RequestMapping(value = "/delete/{userId}", method = RequestMethod.POST)
    public ModelAndView removeUser(@PathVariable("userId") Integer id, HttpSession session) {
        User user = new User();
        ModelAndView mv = new ModelAndView("redirect:/administration");
        if ((user = (User) session.getAttribute("user")) == null || !user.getAdmin() || id.equals(user.getId())) {
            mv.setViewName("redirect:/access_denied");
        } else {
            userService.removeUser(id);
        }
        return mv;
    }
    
    @RequestMapping(value = "/switchAdmin/{userId}", method = RequestMethod.POST)
    public ModelAndView switchAdminRights(@PathVariable("userId") Integer id, HttpSession session) {
        User user = new User();
        ModelAndView mv = new ModelAndView("redirect:/administration");
        if ((user = (User) session.getAttribute("user")) == null || !user.getAdmin() || id.equals(user.getId())) {
            mv.setViewName("redirect:/access_denied");
        } else {
            userService.switchAdminStatus(id);
        }
        return mv;
    }
}