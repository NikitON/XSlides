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
    
    @RequestMapping(value = "/{userName}/userPresentations", method = RequestMethod.GET)
    public ModelAndView userPresentations(@PathVariable("userName")String userName, HttpSession session) {
        ModelAndView mv = new ModelAndView("user_presentations");
        mv.addObject("presentationsList", presentationService.presentationsOfUser((User)session.getAttribute("user")));
	return mv;
    }
}
