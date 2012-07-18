package com.team.xslides.web;

import java.util.Map;

import java.util.Set;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PathVariable;

import com.team.xslides.domain.Presentation;
import com.team.xslides.service.PresentationService;
import com.team.xslides.service.UserService;
import com.team.xslides.domain.User;
import com.team.xslides.domain.Tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PresentationController {

    @Autowired
    private PresentationService presentationService;
    
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/createPresentation", method = RequestMethod.POST)
    public String createPresentation(HttpServletRequest request, HttpSession session) {
	if(session.getAttribute("user")==null)
	    return "home";
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
    	return "editor";
    }
    
    @RequestMapping(value = "/createPresentation")
    public String createPresentation(Map<String, Object> map, HttpSession session) {
	if(session.getAttribute("user") ==  null)
	    return "redirect:/home";
    	return "create_presentation";
    }
    
    @RequestMapping(value = "/showcurrent")
    public String show(HttpSession session) {
    	System.out.print(((Presentation)session.getAttribute("currentPresentation")).getName());
    	return "form";
    }
    
    @RequestMapping(value = "/saveCurrentPresentation")
    public String saveCurrentPresentation(HttpSession session, HttpServletRequest request) {
	if(session.getAttribute("user") ==  null)
	    return "redirect:/home";
	Presentation presentation = ((Presentation)session.getAttribute("currentPresentation"));
	presentation.setContent(request.getParameter("content"));
	session.removeAttribute("currentPresentation");
	session.setAttribute("currentPresentation", presentation);
	presentationService.addPresentation(presentation);
	return "message";
    }
    
    @RequestMapping(value = "/viewPresentation/{presentationId}")
    public String viewPresentation(@PathVariable("presentationId")String presentationId, Map<String, Object> map){
	Integer id = Integer.parseInt(presentationId);
	map.put("html", presentationService.getContent(id));
	return "viewPresentation";
    }
    
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