package com.chat.service;

import com.chat.db.User;
import com.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional
    public void delete(String username) {
        userRepository.delete(username);
    }

    @Override
    @Transactional
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    @Transactional
    public void update(User user) {
        userRepository.save(user);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean exists(String username) {
        return userRepository.exists(username);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean existsEmail(String email) {
        return userRepository.existsEmail(email);
    }

    @Override
    @Transactional(readOnly = true)
    public List<User> getAll() {
        return userRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public User findByUsername(String username) {
        return userRepository.findOne(username);
    }

    @Override
    @Transactional
    public void updateFriendCount(int friendCount,String username) {
        userRepository.updateFriendCount(friendCount,username);
    }
}
