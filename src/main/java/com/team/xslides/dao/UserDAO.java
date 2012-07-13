package com.team.xslides.dao;

import java.util.List;

import com.team.xslides.domain.User;

public interface UserDAO {
    
    public void addUser(User user);
    
    public List<User> listUser();
     
    public boolean hasUserWithEmail(String email);
       
    public void removeUser(Integer id);
    
    public boolean isUserExists(String login);
    
    public User getUser(String email, String password);
}
