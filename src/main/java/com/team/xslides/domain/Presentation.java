package com.team.xslides.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.ManyToMany;
import javax.persistence.FetchType;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "Presentations")
public class Presentation {
    @Id
    @Column(name = "Id")
    @GeneratedValue
    private Integer id;

    @Column(name = "Title", length = 120)
    private String title;

    @Column(name = "Theme", length = 120)
    private String theme;

    @Column(columnDefinition = "mediumtext", name = "Description")
    private String description;

    @Column(columnDefinition = "mediumtext", name = "Content")
    private String content;

    @Column(columnDefinition = "mediumtext", name = "JSON")
    private String json;

    @ManyToOne(fetch = FetchType.EAGER)
    @Cascade(value = CascadeType.SAVE_UPDATE)
    private User author;

    @ManyToMany(fetch = FetchType.EAGER)
    @Cascade(value = CascadeType.SAVE_UPDATE)
    private Set<Tag> tags;

    @OneToOne(fetch = FetchType.EAGER)
    @Cascade(value = CascadeType.SAVE_UPDATE)
    private Template template;

    public Template getTemplate() {
        return template;
    }

    public void setTemplate(Template template) {
        this.template = template;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

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

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Set<Tag> getTags() {
        return tags;
    }

    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }
}
