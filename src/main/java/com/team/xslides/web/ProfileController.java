package com.team.xslides.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.xslides.domain.User;
import com.team.xslides.service.PresentationService;
import com.team.xslides.service.UserService;

@Controller
public class ProfileController {
    
    @Autowired
    private PresentationService presentationService;
    
    @Autowired
    private UserService userService;
    
    @RequestMapping(value = "/userPresentations/{id}", method = RequestMethod.GET)
    public ModelAndView userPresentations(@PathVariable("id") Integer id, HttpSession session) {
        User user = userService.getUser(id);
        session.setAttribute("presentationsList", presentationService.presentationsOfUser(user));
        session.setAttribute("author", user);
	return new ModelAndView("redirect:/userPresentations");
    }
    
    @RequestMapping(value = "/userPresentations", method = RequestMethod.GET)
    public ModelAndView userPresentations() {
        return new ModelAndView("user_presentations");
    }
    
    @RequestMapping(value = "/settings", method = RequestMethod.GET)
    public ModelAndView settings() {
        return new ModelAndView("settings");
    }
    
    @RequestMapping(value = "/newName", method = RequestMethod.POST)
    public ModelAndView newName(HttpServletRequest request, HttpSession session) {
        User user;
        ModelAndView mv = new ModelAndView("settings");
        if ((user = (User) session.getAttribute("user")) == null) {
            mv.setViewName("redirect:/access_denied");
        } else {
            if ((user = userService.getUser(user.getEmail(), request.getParameter("password"))) == null) {
                mv.addObject("message","Wrong password.");
            } else {
                userService.setNewDisplayname(user.getId(), request.getParameter("displayname"));
                session.setAttribute("user", userService.getUser(user.getId()));
                mv.addObject("success", "Your display name was successfully changed.");
            }
        }
        return mv;
    }
    
    @RequestMapping(value = "/newPassword", method = RequestMethod.POST)
    public ModelAndView newPassword(HttpServletRequest request, HttpSession session) {
        User user;
        ModelAndView mv = new ModelAndView("settings");
        if ((user = (User) session.getAttribute("user")) == null) {
            mv.setViewName("redirect:/access_denied");
        } else {
            if ((user = userService.getUser(user.getEmail(), request.getParameter("password"))) == null) {
                mv.addObject("message","Wrong password.");
            } else {
                userService.setNewPassword(user.getId(), request.getParameter("newPassword"));
                session.setAttribute("user", userService.getUser(user.getId()));
                mv.addObject("success", "Your password was successfully changed.");
            }
        }
        return mv;
    }
}
