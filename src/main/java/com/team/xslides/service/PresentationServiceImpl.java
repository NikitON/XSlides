package com.team.xslides.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.xslides.domain.Presentation;
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
}
