package com.chat.service;

import com.chat.db.ChatMembers;
import com.chat.repository.ChatMembersRepository;
import com.chat.repository.ChatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ChatMembersServiceImpl implements ChatMembersService {

    @Autowired
    ChatMembersRepository chatMembersRepository;

    @Autowired
    ChatRepository chatRepository;

    @Override
    @Transactional
    public boolean addChatMembers(ChatMembers chatMembers, String name,String chatName, String userUsername) {
        if(chatRepository.getCreator(name).equals(chatMembersRepository.findOneNameChatMember(chatName,userUsername))){
            chatMembersRepository.saveAndFlush(chatMembers);
            return true;
        }else{
            return false;
        }
    }

    @Override
    @Transactional
    public boolean deleteChatMembers(ChatMembers chatMembers, String name,String userUsername,String chatName) {
        if(chatRepository.getCreator(name).equals(chatMembersRepository.findOneNameChatMember(chatName,userUsername))){
            chatMembersRepository.delete(chatMembers);
            return true;
        }else{
            return false;
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<ChatMembers> findAllChatMembers(String chatName) {
        return chatMembersRepository.findAllChatMembers(chatName);
    }

    @Override
    @Transactional(readOnly = true)
    public String findOneNameChatMember(String chatName, String userUsername) {
        return chatMembersRepository.findOneNameChatMember(chatName, userUsername);
    }
}
