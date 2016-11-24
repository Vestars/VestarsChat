package com.chat.db;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;


public class FriendPK implements Serializable {
    private String friendOne;
    private String friendTwo;

    @Column(name = "friend_one", nullable = false, length = 32)
    @Id
    public String getFriendOne() {
        return friendOne;
    }

    public void setFriendOne(String friendOne) {
        this.friendOne = friendOne;
    }

    @Column(name = "friend_two", nullable = false, length = 32)
    @Id
    public String getFriendTwo() {
        return friendTwo;
    }

    public void setFriendTwo(String friendTwo) {
        this.friendTwo = friendTwo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FriendPK friendPK = (FriendPK) o;
        return Objects.equals(friendOne, friendPK.friendOne) &&
                Objects.equals(friendTwo, friendPK.friendTwo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(friendOne, friendTwo);
    }
}
