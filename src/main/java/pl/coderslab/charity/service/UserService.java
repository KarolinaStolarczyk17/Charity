package pl.coderslab.charity.service;
import pl.coderslab.charity.entity.User;

public interface UserService {

        User findByLogin(String login);

        void saveUser(User user);

        void saveAdmin(User user);
    }
