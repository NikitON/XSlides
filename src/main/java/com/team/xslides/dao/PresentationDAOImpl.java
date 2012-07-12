package com.team.xslides.dao;

import com.team.xslides.domain.Presentation;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PresentationDAOImpl implements PresentationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addPresentation(Presentation presentation) {
		sessionFactory.getCurrentSession().save(presentation);
	}

	public void removePresentation(Integer id) {
		Presentation presentation = (Presentation) sessionFactory
				.getCurrentSession().load(Presentation.class, id);
		if (null != presentation) {
			sessionFactory.getCurrentSession().delete(presentation);
		}
	}
}
