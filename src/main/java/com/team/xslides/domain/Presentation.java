package com.team.xslides.domain;

import java.util.Set;



import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.CascadeType;
import javax.persistence.FetchType;

@Entity
@Table(name = "Presentations")
public class Presentation {
	@Id
	@Column(name = "Id")
	@GeneratedValue
	private Integer id;

	@Column(name = "Name")
	private String name;

	@Column(name = "Content")
	private String content;

	@OneToOne(cascade = CascadeType.ALL)
	private User author;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Tag> tags;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Set<Tag> getTags() { return tags; }


	public void setTags(Set<Tag> tags) { this.tags = tags; }
}
