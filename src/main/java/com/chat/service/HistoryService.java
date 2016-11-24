package com.chat.service;


import com.chat.db.History;

import java.util.List;

public interface HistoryService {
    void addHistory(History history);
    List<History> getListHistory(String chatName);
}
