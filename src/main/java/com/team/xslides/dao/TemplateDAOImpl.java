package com.team.xslides.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.xslides.domain.Template;

@Repository
public class TemplateDAOImpl implements TemplateDAO {
    @Autowired
    private SessionFactory sessionFactory;

    public String getTemplate(Integer id) {
        return ((Template) sessionFactory.getCurrentSession().load(Template.class, id)).getContent();
    }

    public Template getTemplateById(Integer id) {
        return (Template) sessionFactory.getCurrentSession().load(Template.class, id);
    }
}
