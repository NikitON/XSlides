package com.team.xslides.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User {
    @Id
    @Column(name = "Id")
    @GeneratedValue
    private Integer id;

    @Column(name = "Firstname", nullable = false)
    private String firstname;

    @Column(name = "Lastname", nullable = false)
    private String lastname;
    
    @Column(name = "Email", nullable = false, unique = true)
    private String email;

    @Column(name = "Password", nullable = false)
    private String password;
    
    @Column(name = "Confirmed")
    private Boolean isConfirmed;
    
    @Column(name = "Admin")
    private Boolean isAdmin;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getIsConfirmed() {
        return isConfirmed;
    }

    public void setIsConfirmed(Boolean isConfirmed) {
        this.isConfirmed = isConfirmed;
    }

    public Boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
    
}
