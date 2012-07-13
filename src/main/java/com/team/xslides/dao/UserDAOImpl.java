package com.team.xslides.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.xslides.domain.User;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public void addUser(User user) {
        if (!hasUserWithEmail(user.getEmail())) {
            user.setConfirmed(false);
            user.setAdmin(false);
            getSession().save(user);
        }
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsersList() {
        return getSession().createQuery("from User").list();
    }

    public void removeUser(Integer id) {
        User user = (User) getSession().load(User.class, id);
        if (user != null) {
            getSession().delete(user);
        }
    }
    
    public boolean isUserExists(String login)
    {
	    	return !sessionFactory.getCurrentSession().createQuery("from User where Login='" + login + "'").list().isEmpty();
    }

    public boolean hasUserWithEmail(String email) {
        Query query = getSession().createQuery("from User u where u.email = :requestEmail");
        query.setParameter("requestEmail", email);
        return !query.list().isEmpty();
    }
    
    public User getUser(String email, String password){
    	Query query = getSession().createQuery("from User u where u.email = :requestEmail and u.password = :requestPassword");
        query.setParameter("requestEmail", email);
        query.setParameter("requestPassword", password);
        if(query.list().isEmpty())
        	return null;
        return (User)query.list().get(0);
    }
}