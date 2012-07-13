package com.team.xslides.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "Firstname", length = 40)
    private String firstname;

    @Column(name = "Lastname", length = 40)
    private String lastname;
    
    @Column(name = "Email", nullable = false, unique = true, length = 60)
    private String email;

    @Column(name = "Password", nullable = false, length = 40)
    private String password;
    
    @Column(name = "Confirmed")
    private Boolean confirmed;
    
    @Column(name = "Admin")
    private Boolean admin;
    /*
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Presentation> presentations;
     */
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

    public Boolean getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(Boolean confirmed) {
        this.confirmed = confirmed;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }
    /*
    public Set<Presentation> getPresentations() {
        return presentations;
    }

    public void setPresentations(Set<Presentation> presentations) {
        this.presentations = presentations;
    }
    */
}
