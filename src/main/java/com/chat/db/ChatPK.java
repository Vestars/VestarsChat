package com.chat.db;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;


public class ChatPK implements Serializable {
    private String name;
    private String creator;

    @Column(name = "name", nullable = false, length = 48)
    @Id
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "creator", nullable = false, length = 32)
    @Id
    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChatPK chatPK = (ChatPK) o;
        return Objects.equals(name, chatPK.name) &&
                Objects.equals(creator, chatPK.creator);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, creator);
    }
}
