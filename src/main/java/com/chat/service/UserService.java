package com.chat.service;

import com.chat.db.User;

import java.util.List;

public interface UserService {
    void delete(String username);
    void save(User user);
    void update(User user);
    boolean exists(String username);
    boolean existsEmail(String email);
    List<User> getAll();
    User findByUsername(String username);
    void updateFriendCount(int friendCount,String username);

}
