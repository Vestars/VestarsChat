package com.chat.repository;

import com.chat.db.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    @Query("UPDATE User SET friendCount=:friendCount WHERE username=:username")
    void updateFriendCount(@Param("friendCount") int friendCount,@Param("username") String username);

    @Query("SELECT CASE WHEN COUNT(u) > 0 THEN true ELSE false END FROM User u WHERE u.email = :email")
    boolean existsEmail(@Param("email") String email);
}
