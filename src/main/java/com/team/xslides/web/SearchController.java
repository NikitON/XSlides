package com.team.xslides.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.xslides.service.PresentationService;

@Controller
public class SearchController {
    @Autowired
    private PresentationService presentationService;

    @RequestMapping(value = "/searchResult", method = RequestMethod.GET)
    public ModelAndView search(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("search_result");
        mv.addObject("presentationsList",
                        presentationService.getPresentationForQuery(request.getParameter("search-query")));
        return mv;
    }
}
