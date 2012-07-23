package com.team.xslides.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.Tag;

@Repository
public class TagDAOImpl implements TagDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Tag> getTagsList() {
        return getSession().createQuery("from Tag").list();
    }

    public List<Presentation> getPresentations(String name) {
        Tag tag = (Tag) getSession().load(Tag.class, name);
        return new ArrayList<Presentation>(tag.getPresentations());
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
}
