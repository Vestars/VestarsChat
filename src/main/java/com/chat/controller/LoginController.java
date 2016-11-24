package com.chat.controller;

import com.chat.db.User;
import com.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping(value = {"/login", "/"}, method = RequestMethod.GET)
    public String signIn(Model model, @RequestParam(value = "error", required = false) String error) {
        if (error != null) {
            model.addAttribute("loginError", true);
        }
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String signUpPage(Model model){
        model.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String signUp(@Valid @ModelAttribute("user") User user, BindingResult result, ModelMap model) {
        if (userService.exists(user.getUsername())) {
            result.rejectValue("username", "DuplicateKey.user.username");
            return "register";
        }
        if (userService.existsEmail(user.getEmail())) {
            result.rejectValue("email", "DuplicateKey.user.email");
            return "register";
        }
        if(result.hasErrors()){
            return "register";
        }
        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        String passHash = encoder.encodePassword(user.getPassword(), null);
        user.setRole("ROLE_USER");
        user.setPassword(passHash);
        userService.save(user);
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        return "reg-success";
    }
}
