package com.chat.controller;

import com.chat.db.Chat;
import com.chat.service.ChatMembersService;
import com.chat.service.ChatService;
import com.chat.service.HistoryService;
import com.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
public class ChatController {

    @Autowired
    UserService userService;

    @Autowired
    ChatService chatService;

    @Autowired
    ChatMembersService chatMembersService;

    @Autowired
    HistoryService historyService;


    @RequestMapping(value = "/chat",method = RequestMethod.GET)
    public String chatPage(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = user.getUsername();
        model.addAttribute("username", username);
        return "chat";
    }

    @RequestMapping(value = "/chat", method = RequestMethod.POST)
    public String chatPagePost(){

        return "chat";
    }

    @RequestMapping(value = "/new-chat",method = RequestMethod.GET)
    public String newChatPage(Model model) {
        model.addAttribute("chat", new Chat());
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = user.getUsername();
        model.addAttribute("username", username);
        return "new-chat";
    }

    @RequestMapping(value = "/new-chat", method = RequestMethod.POST)
    public String newChatPagePost(@Valid Chat chat, BindingResult result, Model model){
        if(chatService.exists(chat.getName())){
            result.rejectValue("name", "DuplicateKey.chat.name");
            return "new-chat";
        }
        if(result.hasErrors()){
            return "new-chat";
        }
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = user.getUsername();
        model.addAttribute("username", username);
        chat.setCreator(username);
        chatService.addChat(chat);
        return "new-chat";
    }
}
