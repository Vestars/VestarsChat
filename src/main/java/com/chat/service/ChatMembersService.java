package com.chat.service;


import com.chat.db.ChatMembers;

import java.util.List;

public interface ChatMembersService {
    boolean addChatMembers(ChatMembers chatMembers, String creator,String chatName, String userUsername);
    boolean deleteChatMembers(ChatMembers chatMembers, String name, String userUsername, String chatName);
    List<ChatMembers> findAllChatMembers(String chatName);
    String findOneNameChatMember(String chatName,String userUsername);
}
