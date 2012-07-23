package com.team.xslides.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.xslides.service.TagService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    @Autowired
    private TagService tagService;
    
    @RequestMapping("/about")
    public ModelAndView about() {
        return new ModelAndView("about");
    }
    
    @RequestMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("redirect:/");
    }

    @RequestMapping("/home")
    public ModelAndView home() {
        return new ModelAndView("redirect:/");
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView slash() {
        ModelAndView mv = new ModelAndView("home");
        mv.addObject("tagsList", tagService.getTagsList());
        return mv;
    }

    @RequestMapping("/accessDenied")
    public ModelAndView accessDenied(HttpSession session) {
        ModelAndView mv = new ModelAndView("access_denied");
        mv.addObject("errorNotRegistered", session.getAttribute("errorNotRegistered"));
        mv.addObject("errorLogged", session.getAttribute("errorLogged"));
        mv.addObject("errorNotLogged", session.getAttribute("errorNotLogged"));
        session.removeAttribute("errorNotLogged");
        session.removeAttribute("errorLogged");
        session.removeAttribute("errorNotRegistered");
        return mv;
    }
}
