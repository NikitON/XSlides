package com.team.xslides.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.xslides.service.TemplateService;

public class TemplateController {
    
    @Autowired
    private TemplateService templateService;
    
    @RequestMapping(value = "/getTemplate//{Id}", method = RequestMethod.GET)
    public ModelAndView getTemplate( @PathVariable("Id") Integer Id )
    {
	ModelAndView mv = new ModelAndView("message");
	mv.addObject("html", templateService.getTemplate(Id) );
	return mv;
    }
}
