package com.chat.db;

import com.chat.db.enums.FriendEnum;

import javax.persistence.*;
import java.util.Objects;


@Entity
@IdClass(FriendPK.class)
public class Friend {
    private String friendOne;
    private String friendTwo;
    private FriendEnum status;

    public Friend(){}

    public Friend(String friendOne, String friendTwo, FriendEnum status) {
        this.friendOne = friendOne;
        this.friendTwo = friendTwo;
        this.status = status;
    }

    @Id
    @Column(name = "friend_one", nullable = false, length = 32)
    public String getFriendOne() {
        return friendOne;
    }

    public void setFriendOne(String friendOne) {
        this.friendOne = friendOne;
    }

    @Id
    @Column(name = "friend_two", nullable = false, length = 32)
    public String getFriendTwo() {
        return friendTwo;
    }

    public void setFriendTwo(String friendTwo) {
        this.friendTwo = friendTwo;
    }

    @Basic
    @Column(name = "status", nullable = false)
    public FriendEnum getStatus() {
        return status;
    }

    public void setStatus(FriendEnum status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Friend friend = (Friend) o;
        return Objects.equals(friendOne, friend.friendOne) &&
                Objects.equals(friendTwo, friend.friendTwo) &&
                status == friend.status;
    }

    @Override
    public int hashCode() {
        return Objects.hash(friendOne, friendTwo, status);
    }
}
