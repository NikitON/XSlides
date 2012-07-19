package com.team.xslides.web;

import java.util.Map;

import java.util.Set;
import java.util.HashSet;


import java.lang.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PathVariable;

import com.team.xslides.domain.Presentation;
import com.team.xslides.service.PresentationService;
import com.team.xslides.domain.User;
import com.team.xslides.domain.Tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PresentationController {

    @Autowired
    private PresentationService presentationService;

    @RequestMapping(value = "/createPresentation", method = RequestMethod.POST)
    public ModelAndView createPresentation(HttpServletRequest request, HttpSession session) {
	if(session.getAttribute("user")==null)
	{
	    ModelAndView mv = new ModelAndView("home");
	    return mv;
	}
	Set<Tag> tags = new HashSet<Tag>();
    	Presentation presentation = new Presentation();
    	presentation.setAuthor(((User)session.getAttribute("user")));
    	presentation.setName(request.getParameter("name"));
    	String[] tagsStrings = request.getParameter("tags").split(" ");
    	for( int i = 0; i < tagsStrings.length; i++ )
    	{
    		Tag tag = new Tag();
    		tag.setName(tagsStrings[i]);
    		tags.add(tag);
    	}
    	presentation.setTags(tags);
    	session.setAttribute("currentPresentation", presentation);
    	presentationService.addPresentation(presentation);
    	ModelAndView mv = new ModelAndView("editor");
    	mv.addObject("id", presentation.getId());
    	return mv;
    }
    
    @RequestMapping(value = "/createPresentation")
    public String createPresentation(Map<String, Object> map, HttpSession session) {
	if(session.getAttribute("user") ==  null)
	    return "redirect:/home";
    	return "create_presentation";
    }
    
    @RequestMapping(value = "/showcurrent")
    public String show(HttpSession session) {
    	
    	return "index";
    }
    
    @RequestMapping(value = "/saveCurrentPresentation", method=RequestMethod.POST)
    public ModelAndView saveCurrentPresentation(HttpSession session, HttpServletRequest request) {
	ModelAndView mv = new ModelAndView("message");
	if(session.getAttribute("user") ==  null)
	{
	    mv.addObject("message", "Login, please");
	    return mv;
	}
	Presentation presentation = presentationService.getPresentation(Integer.parseInt(request.getParameter("id")));
	if( !presentation.getAuthor().getId().equals( ( (User)session.getAttribute("user") ).getId() ) )
	{
	    System.out.println(presentation.getAuthor().getId().toString()+" "+((User)session.getAttribute("user")).getId().toString());
	    mv.addObject("message", "It's not your presentation");
	    return mv;
	}
	presentation.setContent(
		request.getParameter("content")
		);
	presentation.setJson(
		request.getParameter("json")
		);
	//session.removeAttribute("currentPresentation");
	//session.setAttribute("currentPresentation", presentation);
	presentationService.addPresentation(presentation);
	mv.addObject("message", "Save ok");
	return mv;
    }
    
    @RequestMapping(value = "/viewPresentation/{presentationId}")
    public String viewPresentation(@PathVariable("presentationId")String presentationId, Map<String, Object> map){
	Integer id = Integer.parseInt(presentationId);
	//Presentation presentation = presentationService.getPresentation(id);
	map.put("html", presentationService.getContent(id));
	//map.put("width", presentation.getWidth());
	//map.put("height", presentation.getHeight());
	return "viewPresentation";
    }
    
    @RequestMapping(value = "/getPresentationJSON/{presentationId}")
    public String getPresentationJSON(@PathVariable("presentationId")String presentationId, Map<String, Object> map){
	Integer id = Integer.parseInt(presentationId);
	//Presentation presentation = presentationService.getPresentation(id);
	map.put("html", presentationService.getPresentationJson(id));
	//map.put("width", presentation.getWidth());
	//map.put("height", presentation.getHeight());
	return "viewPresentation";
    }
}