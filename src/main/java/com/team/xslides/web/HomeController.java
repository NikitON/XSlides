package com.team.xslides.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.xslides.domain.User;

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
    public ModelAndView home(HttpSession session) {
        User user = new User();
        ModelAndView mv = new ModelAndView("home");
        if ((user = (User) session.getAttribute("user")) == null) {
            mv.addObject("logged", "false");
        } else {
            mv.addObject("logged", "true");
            mv.addObject("admin", user.getAdmin());
        }
        return mv;
    }
    
    @RequestMapping("/access_denied")
    public ModelAndView accessDenied() {
        ModelAndView mv = new ModelAndView("access_denied");
        return mv;
    }

}
