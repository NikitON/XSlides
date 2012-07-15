package com.team.xslides.web;

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
    public ModelAndView userPresentations(HttpSession session) {
        return new ModelAndView("user_presentations");
    }       
}
