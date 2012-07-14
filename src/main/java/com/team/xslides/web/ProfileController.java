package com.team.xslides.web;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.xslides.domain.User;
import com.team.xslides.service.UserService;
import com.team.xslides.domain.Presentation;
import com.team.xslides.service.PresentationService;

import com.team.xslides.service.UserService;

@Controller
public class ProfileController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private PresentationService presentationService;
    
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(Map<String, Object> map, HttpSession session) {
        map.put("presentationsList", presentationService.presentationsOfUser(((User)session.getAttribute("user"))));
	return "profile";
    }
}
