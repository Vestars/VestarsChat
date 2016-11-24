package com.chat.db;

import javax.persistence.*;
import java.util.Objects;


@Entity
@Table(name = "chat_members", schema = "chat", catalog = "")
@IdClass(ChatMembersPK.class)
public class ChatMembers {
    private String userUsername;
    private String chatName;

    public ChatMembers(){
    }

    public ChatMembers(String userUsername, String chatName) {
        this.userUsername = userUsername;
        this.chatName = chatName;
    }

    @Id
    @Column(name = "user_username", nullable = false, length = 32)
    public String getUserUsername() {
        return userUsername;
    }

    public void setUserUsername(String userUsername) {
        this.userUsername = userUsername;
    }

    @Id
    @Column(name = "chat_name", nullable = false, length = 255)
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
        ChatMembers that = (ChatMembers) o;
        return Objects.equals(userUsername, that.userUsername) &&
                Objects.equals(chatName, that.chatName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userUsername, chatName);
    }
}
