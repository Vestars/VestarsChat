package com.chat.service;

import com.chat.db.History;
import com.chat.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService {

    @Autowired
    private HistoryRepository historyRepository;


    @Override
    @Transactional
    public void addHistory(History history) {
        historyRepository.saveAndFlush(history);
    }

    @Override
    @Transactional(readOnly = true)
    public List<History> getListHistory(String chatName) {
        return historyRepository.getListHistory(chatName);
    }
}
