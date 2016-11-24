package com.chat.repository;

import com.chat.db.Chat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatRepository extends JpaRepository<Chat, String> {

    @Query("SELECT c FROM Chat c WHERE c.type='publ'")
    List<Chat> getPublicChat();

    @Query("SELECT c FROM Chat c WHERE c.creator=:creator AND c.type='priv'")
    List<Chat> getPrivateChat(@Param("creator") String creator);

    @Query("SELECT c.creator FROM Chat c WHERE c.name=:name")
    String getCreator(@Param("name") String name);
}
