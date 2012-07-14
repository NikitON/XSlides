package com.team.xslides.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }

    @RequestMapping("/home")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView slash() {
        ModelAndView mv = new ModelAndView("home");
        return mv;
    }
    
    @RequestMapping("/access_denied")
    public ModelAndView accessDenied() {
        ModelAndView mv = new ModelAndView("access_denied");
        return mv;
    }

}
