package pl.coderslab.charity.dao;


import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Repository
@Transactional
public class UserDao {

    private final UserRepository userRepository;

    @PersistenceContext
    private EntityManager entityManager;

    public UserDao(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findByLogin(String login) {
        return entityManager.find(User.class, login);
    }

    public User findById(long id) {
        return entityManager.find(User.class, id);
    }

    public void persist(User user){
        entityManager.persist(user);
    }

    public User merge(User user) {
        return entityManager.merge(user);
    }

    public void remove(User user) {
        entityManager.remove(entityManager.contains(user) ? user : entityManager.merge(user));
    }

}


