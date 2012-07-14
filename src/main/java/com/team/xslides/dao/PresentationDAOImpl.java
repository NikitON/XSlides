package com.team.xslides.dao;

import java.util.List;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.User;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PresentationDAOImpl implements PresentationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addPresentation(Presentation presentation) {
		sessionFactory.getCurrentSession().saveOrUpdate(presentation);
	}

	public void removePresentation(Integer id) {
		Presentation presentation = (Presentation) sessionFactory
				.getCurrentSession().load(Presentation.class, id);
		if (null != presentation) {
			sessionFactory.getCurrentSession().delete(presentation);
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Presentation> presentationsOfUser( User author ){
	    	Query query = sessionFactory.getCurrentSession().createQuery("from Presentation u where u.author = :requestAuthor");
	        query.setParameter("requestAuthor", author);
	        if(query.list().isEmpty())
	            return null;
	        return (List<Presentation>)query.list();
	}
	
	public String getContent( Integer id ){
	    Presentation presentation = (Presentation)sessionFactory.getCurrentSession().load(Presentation.class, id);
	    return presentation.getContent();
	}
}
