package com.chat.db;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;


@Entity
@IdClass(HistoryPK.class)
public class History {
    private String chatName;
    private String userUsername;
    private String text;
    private Timestamp date;

    public History(){}

    public History(String chatName, String userUsername, String text, Timestamp date) {
        this.chatName = chatName;
        this.userUsername = userUsername;
        this.text = text;
        this.date = date;
    }

    @Id
    @Column(name = "chat_name", nullable = false, length = 255)
    public String getChatName() {
        return chatName;
    }

    public void setChatName(String chatName) {
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

    @Basic
    @Column(name = "text", nullable = false, length = 255)
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        History history = (History) o;
        return Objects.equals(chatName, history.chatName) &&
                Objects.equals(userUsername, history.userUsername) &&
                Objects.equals(text, history.text) &&
                Objects.equals(date, history.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(chatName, userUsername, text, date);
    }
}
