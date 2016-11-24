package com.chat.service;

import com.chat.db.Friend;
import com.chat.repository.FriendRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FriendServiceImpl implements FriendService{

    @Autowired
    private FriendRepository friendRepository;

    @Override
    @Transactional
    public void add(Friend friend) {
        friendRepository.saveAndFlush(friend);
    }

    @Override
    @Transactional
    public void update(Friend friend) {
        friendRepository.save(friend);
    }

    @Override
    @Transactional
    public void delete(Friend friend) {
        friendRepository.delete(friend);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Friend> getListFriends(String friendOne) {
        return friendRepository.getListFriendsOne(friendOne);
    }
}
