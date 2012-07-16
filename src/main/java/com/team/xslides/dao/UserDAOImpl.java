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
        getSession().save(user);
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsersList() {
        return getSession().createQuery("from User").list();
    }

    public void removeUser(Integer id) {
        User user = getUserById(id);
        if (user != null) {
            getSession().delete(user);
        }
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

    public void switchAdminStatus(Integer id) {
        User user = getUserById(id);
        user.setAdmin(!user.getAdmin());
        getSession().saveOrUpdate(user);
    }

    public void switchConfirmedStatus(Integer id) {
        User user = getUserById(id);
        user.setConfirmed(!user.getConfirmed());
        getSession().saveOrUpdate(user);
    }

    @SuppressWarnings("unchecked")
    public List<User> getNotConfirmedList() {
        return getSession().createQuery("from User u where u.confirmed = 0").list();
    }

    public void setNewPassword(Integer id, String password) {
        User user = getUserById(id);
        user.setPassword(password);
        getSession().saveOrUpdate(user);
    }
    
    public User getUser(Integer id) {
        Query query = getSession().createQuery("from User u where u.id = :requestId");
        query.setParameter("requestId", id);
        if(query.list().isEmpty())
            return null;
        return (User) query.list().get(0);
    }
    
    private User getUserById(Integer id) {
        return (User) getSession().load(User.class, id);
    }

    public User getUser(String email) {
        Query query = getSession().createQuery("from User u where u.email = :requestEmail");
        query.setParameter("requestEmail", email);
        if(query.list().isEmpty())
            return null;
        return (User)query.list().get(0);
    }

    public void setNewDisplayname(Integer id, String displayname) {
        User user = getUserById(id);
        user.setDisplayname(displayname);
        getSession().saveOrUpdate(user);
    }
}