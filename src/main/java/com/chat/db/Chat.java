package com.chat.db;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
import java.util.Objects;


@Entity
@IdClass(ChatPK.class)
public class Chat {
    @Pattern(regexp = "[a-zA-Zа-яА-Я0-9]+",message = "Pattern.chat.name")
    @Size(min = 3, message = "Size.chat.name")
    private String name;

    //publ = PUBLIC , priv = PRIVATE
    @NotEmpty
    private String type = "publ";

    private String creator;

    public Chat(){}

    public Chat(String name, String type, String creator) {
        this.name = name;
        this.type = type;
        this.creator = creator;
    }

    @Id
    @Column(name = "name", nullable = false, length = 48)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "type", nullable = false, length = 4)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Id
    @Column(name = "creator", nullable = false, length = 32)
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
        Chat chat = (Chat) o;
        return type == chat.type &&
                Objects.equals(name, chat.name) &&
                Objects.equals(creator, chat.creator);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, type, creator);
    }
}
