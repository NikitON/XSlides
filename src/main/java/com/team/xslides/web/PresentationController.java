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
    public ModelAndView createPresentation(HttpServletRequest request, HttpSession session) {
        if (session.getAttribute("user") == null) {
            ModelAndView mv = new ModelAndView("redirect:/accessDenied");
            return mv;
        }
        Set<Tag> tags = new HashSet<Tag>();
        Presentation presentation = new Presentation();
        presentation.setAuthor(((User) session.getAttribute("user")));
        presentation.setTitle(request.getParameter("title"));
        presentation.setTheme(request.getParameter("theme"));
        presentation.setDescription(request.getParameter("description"));
        String[] tagsStrings = request.getParameter("tags").split(" ");
        for (int i = 0; i < tagsStrings.length; i++) {
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
    public ModelAndView createPresentation(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return new ModelAndView("redirect:/accessDenied");
        }
        return new ModelAndView("create_presentation");
    }

    @RequestMapping(value = "/showcurrent")
    public String show(HttpSession session) {
        return "index";
    }

    @RequestMapping(value = "/saveCurrentPresentation", method = RequestMethod.POST)
    public ModelAndView saveCurrentPresentation(HttpSession session, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("message");
        if (session.getAttribute("user") == null) {
            mv.addObject("message", "Login, please");
            return mv;
        }
        Presentation presentation = presentationService.getPresentation(Integer.parseInt(request.getParameter("id")));
        if (!presentation.getAuthor().getId().equals(((User) session.getAttribute("user")).getId())) {
            System.out.println(presentation.getAuthor().getId().toString() + " "
                            + ((User) session.getAttribute("user")).getId().toString());
            mv.addObject("message", "It's not your presentation");
            return mv;
        }
        presentation.setContent(request.getParameter("content"));
        presentation.setJson(request.getParameter("json"));
        // session.removeAttribute("currentPresentation");
        // session.setAttribute("currentPresentation", presentation);
        presentationService.addPresentation(presentation);
        mv.addObject("message", "Save ok");
        return mv;
    }

    @RequestMapping(value = "/viewPresentation/{presentationId}")
    public String viewPresentation(@PathVariable("presentationId") String presentationId, Map<String, Object> map) {
        Integer id = Integer.parseInt(presentationId);
        // Presentation presentation = presentationService.getPresentation(id);
        map.put("html", presentationService.getContent(id));
        // map.put("width", presentation.getWidth());
        // map.put("height", presentation.getHeight());
        return "viewPresentation";
    }

    @RequestMapping(value = "/getPresentationJSON/{presentationId}")
    public String getPresentationJSON(@PathVariable("presentationId") String presentationId, Map<String, Object> map) {
        Integer id = Integer.parseInt(presentationId);
        // Presentation presentation = presentationService.getPresentation(id);
        map.put("html", presentationService.getPresentationJson(id));
        // map.put("width", presentation.getWidth());
        // map.put("height", presentation.getHeight());
        return "viewPresentation";
    }

    @RequestMapping(value = "/userPresentations/{id}", method = RequestMethod.GET)
    public ModelAndView userPresentations(@PathVariable("id") Integer id, HttpSession session) {
        session.setAttribute("presentationsList", userService.getUserPresentations(id));
        session.setAttribute("author", userService.getUser(id));
        return new ModelAndView("redirect:/userPresentations");
    }

    @RequestMapping(value = "/userPresentations", method = RequestMethod.GET)
    public ModelAndView userPresentations(HttpSession session) {
        ModelAndView mv = new ModelAndView("user_presentations");
        mv.addObject("presentationsList", session.getAttribute("presentationsList"));
        mv.addObject("author", session.getAttribute("author"));
        session.removeAttribute("presentationsList");
        session.removeAttribute("author");
        return mv;
    }

    @RequestMapping(value = "/deletePresentation/{Id}", method = RequestMethod.POST)
    public ModelAndView deletePresentation(@PathVariable("Id") Integer id, HttpSession session) {
        User user;
        if ((user = (User) session.getAttribute("user")) == null
                        || !user.getId().equals(presentationService.getPresentation(id).getAuthor().getId())) {
            return new ModelAndView("redirect:/accessDenied");
        } else {
            presentationService.removePresentation(id);
            return new ModelAndView("redirect:/userPresentations/" + user.getId());
        }
    }
}