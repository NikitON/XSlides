package com.team.xslides.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.xslides.domain.User;
import com.team.xslides.service.EmailService;
import com.team.xslides.service.UserService;

import org.apache.commons.lang.RandomStringUtils;
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
        
    @Autowired
    private EmailService emailService;
        
    @RequestMapping(value = "/administration", method = RequestMethod.GET)
    public ModelAndView administration(HttpSession session) {
        User user;
        ModelAndView mv = new ModelAndView("administration");
        if ((user = (User) session.getAttribute("user")) == null || !user.getAdmin()) {
            mv.setViewName("redirect:/accessDenied");
        } else {
            mv.addObject("errorServer",session.getAttribute("errorServer"));
            mv.addObject("userList", userService.getUsersList());
        }
        session.removeAttribute("errorServer");
        return mv;
    }
    
    @RequestMapping(value = "/delete/{userId}", method = RequestMethod.POST)
    public ModelAndView removeUser(@PathVariable("userId") Integer id, HttpSession session) {
        User user;
        ModelAndView mv = new ModelAndView("redirect:/administration");
        if ((user = (User) session.getAttribute("user")) == null || !user.getAdmin() || id.equals(user.getId())) {
            mv.setViewName("redirect:/accessDenied");
        } else {
            userService.removeUser(id);
        }
        return mv;
    }
    
    @RequestMapping(value = "/switchAdmin/{userId}", method = RequestMethod.POST)
    public ModelAndView switchAdminRights(@PathVariable("userId") Integer id, HttpSession session) {
        User user;
        ModelAndView mv = new ModelAndView("redirect:/administration");
        if ((user = (User) session.getAttribute("user")) == null || !user.getAdmin() || id.equals(user.getId())) {
            mv.setViewName("redirect:/accessDenied");
        } else {
            userService.switchAdminStatus(id);
        }
        return mv;
    }
    
    private static final int RANDOM_PASSWORD_LENGTH = 10;
    
    @RequestMapping(value = "/newPassword/{userId}", method = RequestMethod.POST)
    public ModelAndView setNewPassword(@PathVariable("userId") Integer id, HttpSession session) {
        User user;
        ModelAndView mv = new ModelAndView("redirect:/administration");
        if ((user = (User) session.getAttribute("user")) == null || !user.getAdmin() || id.equals(user.getId())) {
            mv.setViewName("redirect:/accessDenied");
        } else {
            String newPassword = RandomStringUtils.randomAlphanumeric(RANDOM_PASSWORD_LENGTH);
            if (!emailService.sendNewPassowrd(userService.getUser(id),newPassword)) {
                session.setAttribute("errorServer", true);
            } else {
                userService.setNewPassword(id, newPassword);
            }
        }
        return mv;
    }
    
    @RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
    public ModelAndView forgot(HttpServletRequest request) {
        User user = userService.getUser(request.getParameter("email"));
        ModelAndView mv = new ModelAndView("login");
        if (user != null) {
            String newPassword = RandomStringUtils.randomAlphanumeric(RANDOM_PASSWORD_LENGTH);
            if (!emailService.sendNewPassowrd(user, newPassword)) {
                mv.addObject("errorServer", true);
            } else {
                userService.setNewPassword(user.getId(), newPassword);
                mv.addObject("newSended", true);
            }
        } else {
            mv.addObject("errorNoUser", true);
        }
        return mv;
    }
}