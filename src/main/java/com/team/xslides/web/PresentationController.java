package com.team.xslides.web;

import java.util.Map;
import java.util.Set;
import java.util.HashSet;


import java.lang.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.xslides.domain.Presentation;
import com.team.xslides.service.PresentationService;
import com.team.xslides.domain.User;
import com.team.xslides.domain.Tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PresentationController {

    @Autowired
    private PresentationService presentationService;

    @RequestMapping(value = "/createPresentation", method = RequestMethod.POST)
    public String createPresentation(HttpServletRequest request, HttpSession session) {
    	Set<Tag> tags = new HashSet<Tag>();
    	Presentation presentation = new Presentation();
    	presentation.setAuthor(((User)session.getAttribute("user")));
    	System.out.println(((User)session.getAttribute("user")).getEmail());
    	presentation.setName(request.getParameter("name"));
    	String[] tagsStrings = request.getParameter("tags").split(" ");
    	for( int i = 0; i < tagsStrings.length; i++ )
    	{
    		Tag tag = new Tag();
    		tag.setName(tagsStrings[i]);
    		tags.add(tag);
    		System.out.println(tagsStrings[i]);
    	}
    	presentation.setTags(tags);
    	session.setAttribute("currentPresentation", presentation);
    	presentationService.addPresentation(presentation);
    	return "home";
    }
    
    @RequestMapping(value = "/form")
    public String form(Map<String, Object> map, HttpSession session) {
    	return "create_presentation";
    }
    
    @RequestMapping(value = "/showcurrent")
    public String show(HttpSession session) {
    	System.out.print(((Presentation)session.getAttribute("currentPresentation")).getName());
    	return "home";
    }
    
    @RequestMapping(value = "/saveCurrentPresentation")
    public String saveCurrentPresentation(HttpServletRequest request, HttpSession session) {
	Presentation presentation = new Presentation();
	presentation = (Presentation)session.getAttribute("currentPresentation");
	presentation.setContent(request.getParameter("content"));
	session.removeAttribute("currentPresentation");
	session.setAttribute("currentPresentation", presentation);
	presentationService.addPresentation(presentation);
	return "message";
    }
}