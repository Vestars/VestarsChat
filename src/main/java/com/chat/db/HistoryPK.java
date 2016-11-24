package com.chat.db;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;


public class HistoryPK implements Serializable {
    private String chatName;
    private String userUsername;

    @Column(name = "chat_name", nullable = false, length = 255)
    @Id
    public String getChatName() {
        return chatName;
    }

    public void setChatName(String chatName) {
        this.chatName = chatName;
    }

    @Column(name = "user_username", nullable = false, length = 32)
    @Id
    public String getUserUsername() {
        return userUsername;
    }

    public void setUserUsername(String userUsername) {
        this.userUsername = userUsername;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HistoryPK historyPK = (HistoryPK) o;
        return Objects.equals(chatName, historyPK.chatName) &&
                Objects.equals(userUsername, historyPK.userUsername);
    }

    @Override
    public int hashCode() {
        return Objects.hash(chatName, userUsername);
    }
}
