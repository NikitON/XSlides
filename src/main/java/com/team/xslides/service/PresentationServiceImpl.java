package com.team.xslides.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.User;
import com.team.xslides.dao.PresentationDAO;

@Service
public class PresentationServiceImpl implements PresentationService {

	@Autowired
	private PresentationDAO presentationDAO;

	@Transactional
	public void addPresentation(Presentation presentation) {
		presentationDAO.addPresentation(presentation);
	}

	@Transactional
	public void removePresentation(Integer id) {
		presentationDAO.removePresentation(id);
	}
	
	@Transactional
	public List<Presentation> presentationsOfUser( User author ){
	    	return presentationDAO.presentationsOfUser(author);
	}
	
	@Transactional
	public String getContent( Integer id ){
	    	return presentationDAO.getContent(id);
	}
}
