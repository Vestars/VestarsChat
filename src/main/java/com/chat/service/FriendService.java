package com.chat.service;


import com.chat.db.Friend;

import java.util.List;

public interface FriendService {
    void add(Friend friend);
    void update(Friend friend);
    void delete(Friend friend);
    List<Friend> getListFriends(String friendOne);
}
