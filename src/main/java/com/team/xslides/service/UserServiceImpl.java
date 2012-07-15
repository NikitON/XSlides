package com.team.xslides.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.*;

import com.team.xslides.dao.UserDAO;
import com.team.xslides.domain.User;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Transactional
    public void addUser(User user) {
        userDAO.addUser(user);
    }

    @Transactional
    public List<User> getUsersList() {
        return userDAO.getUsersList();
    }
    
    @Transactional
    public void removeUser(Integer id) {
        userDAO.removeUser(id);
    }
    
    @Transactional
    public boolean hasUserWithEmail(String email) {
        return userDAO.hasUserWithEmail(email);
    }
    
    @Transactional
    public User getUser(String email, String password) {
        return userDAO.getUser(email, password);
    }

    @Transactional
    public void switchAdminStatus(Integer id) {
        userDAO.switchAdminStatus(id);
    }
    
    @Transactional
    public void switchConfirmedStatus(Integer id) {
        userDAO.switchConfirmedStatus(id);
    }

    @Transactional
    public List<User> getNotConfirmedList() {
        return userDAO.getNotConfirmedList();
    }

    @Transactional
    public void setNewPassword(Integer id, String password) {
        userDAO.setNewPassword(id, password);
    }
    
    @Transactional
    public User getUser(Integer id) {
        return userDAO.getUser(id);
    }

    @Transactional
    public User getUser(String email) {
        return userDAO.getUser(email);
    }
}
