package com.chat.repository;

import com.chat.db.History;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistoryRepository extends JpaRepository<History,String> {
    @Query("SELECT h.userUsername, h.text ,h.date FROM History h WHERE h.chatName=:chatName")
    List<History> getListHistory(@Param("chatName")String chatName);
}
