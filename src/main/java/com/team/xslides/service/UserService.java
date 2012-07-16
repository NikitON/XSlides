package com.team.xslides.service;

import java.util.List;

import com.team.xslides.domain.User;

public interface UserService {

    public void addUser(User user);

    public List<User> getUsersList();
    
    public List<User> getNotConfirmedList();
    
    public boolean hasUserWithEmail(String email);
    
    public void removeUser(Integer id);
    
    public void switchAdminStatus(Integer id);
    
    public void switchConfirmedStatus(Integer id);
    
    public User getUser(String email, String password);
    
    public User getUser(String email);

    public User getUser(Integer id);
    
    public void setNewPassword(Integer id, String password);
    
    public void setNewDisplayname(Integer id, String displayname);
}
