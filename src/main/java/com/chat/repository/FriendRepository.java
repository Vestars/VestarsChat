package com.chat.repository;

import com.chat.db.Friend;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FriendRepository extends JpaRepository<Friend, String> {
    @Query("SELECT f.friendTwo FROM Friend f WHERE f.friendOne=:friendOne")
    List<Friend> getListFriendsOne(@Param("friendOne")String friendOne);
}
