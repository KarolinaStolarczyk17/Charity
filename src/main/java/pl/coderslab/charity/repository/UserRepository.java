package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.entity.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByLogin(String login);
    @Query(value ="select * from user JOIN user_role ur on user.id = ur.user_id where role_id = 2", nativeQuery = true)
    List<User> selectAllAdmins();

    @Query(value ="select * from user JOIN user_role ur on user.id = ur.user_id where role_id = 1", nativeQuery = true)
    List<User> selectAllUsers();
}