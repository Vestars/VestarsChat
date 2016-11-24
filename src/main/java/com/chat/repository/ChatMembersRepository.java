package com.chat.repository;

import com.chat.db.ChatMembers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatMembersRepository extends JpaRepository<ChatMembers,String> {
    @Query("SELECT cm.userUsername FROM ChatMembers cm WHERE cm.chatName=:chatName")
    List<ChatMembers> findAllChatMembers(@Param("chatName") String chatName);

    @Query("SELECT cm.userUsername FROM ChatMembers cm WHERE cm.chatName=:chatName AND cm.userUsername=:userUsername")
    String findOneNameChatMember(@Param("chatName") String chatName,@Param("userUsername") String userUsername);

}
