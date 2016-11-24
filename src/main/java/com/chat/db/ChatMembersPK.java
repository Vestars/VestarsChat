package com.chat.db;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;


public class ChatMembersPK implements Serializable {
    private String userUsername;
    private String chatName;

    @Column(name = "user_username", nullable = false, length = 32)
    @Id
    public String getUserUsername() {
        return userUsername;
    }

    public void setUserUsername(String userUsername) {
        this.userUsername = userUsername;
    }

    @Column(name = "chat_name", nullable = false, length = 255)
    @Id
    public String getChatName() {
        return chatName;
    }

    public void setChatName(String chatName) {
        this.chatName = chatName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChatMembersPK that = (ChatMembersPK) o;
        return Objects.equals(userUsername, that.userUsername) &&
                Objects.equals(chatName, that.chatName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userUsername, chatName);
    }
}
