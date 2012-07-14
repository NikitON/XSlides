package com.team.xslides.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
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
        return new ModelAndView("redirect:/");
    }

    @RequestMapping("/home")
    public ModelAndView home() {
        return new ModelAndView("redirect:/");
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView slash() {
        ModelAndView mv = new ModelAndView("home");
        mv.addObject("code", DigestUtils.shaHex("pl5yGqr0rF"));
        return mv;
    }
    
    @RequestMapping("/access_denied")
    public ModelAndView accessDenied(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("access_denied");
        mv.addObject("message", request.getParameter("message"));
        return mv;
    }
}
