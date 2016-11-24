package com.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {
    @RequestMapping(value = "/{type:.+}", method = RequestMethod.GET)
    public ModelAndView getPages(@PathVariable("type") String type) throws Exception {
        return new ModelAndView("404");
    }

    @RequestMapping("/403")
    public String noaccess() {
        return "403";
    }
}
