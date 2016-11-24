package com.chat.service;


import com.chat.db.Chat;

import java.util.List;

public interface ChatService {
    Chat addChat(Chat chat);
    void delete(String name);
    List<Chat> allPublicChat();
    List<Chat> allPrivateChat(String creator);
    String getCreator(String name);
    void addCreatorToMembers(String name);
    boolean exists(String name);
}
