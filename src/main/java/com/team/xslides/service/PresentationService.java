package com.team.xslides.service;

import java.util.List;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.User;

public interface PresentationService {
	public void addPresentation(Presentation presentation);
	public void removePresentation(Integer id);
	public List<Presentation> presentationsOfUser( User author );
	public String getContent( Integer id );
}
