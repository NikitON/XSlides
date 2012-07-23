package com.team.xslides.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Templates")
public class Template {
    @Id
    @Column(name = "Id")
    @GeneratedValue
    private Integer id;

    @Column(name = "Title", length = 120)
    private String title;

    @Column(columnDefinition = "mediumtext", name = "Content")
    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}