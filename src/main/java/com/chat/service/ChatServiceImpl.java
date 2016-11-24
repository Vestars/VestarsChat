package com.chat.service;


import com.chat.db.Chat;
import com.chat.db.ChatMembers;
import com.chat.repository.ChatMembersRepository;
import com.chat.repository.ChatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatRepository chatRepository;

    @Autowired
    private ChatMembersRepository chatMembersRepository;

    @Override
    @Transactional
    public Chat addChat(Chat chat) {
        return chatRepository.saveAndFlush(chat);
    }

    @Override
    @Transactional
    public void delete(String name) {
        chatRepository.delete(name);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Chat> allPublicChat() {
        return chatRepository.getPublicChat();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Chat> allPrivateChat(String creator) {
        return chatRepository.getPrivateChat(creator);
    }

    @Override
    @Transactional(readOnly = true)
    public String getCreator(String name) {
        return chatRepository.getCreator(name);
    }

    @Override
    @Transactional
    public void addCreatorToMembers(String name) {
        String creatorName = chatRepository.getCreator(name);
        chatMembersRepository.saveAndFlush(new ChatMembers(creatorName,name));
    }

    @Override
    @Transactional(readOnly = true)
    public boolean exists(String name) {
        return chatRepository.exists(name);
    }
}
