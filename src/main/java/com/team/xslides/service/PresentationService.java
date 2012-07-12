package com.team.xslides.service;

import com.team.xslides.domain.Presentation;

public interface PresentationService {
	public void addPresentation(Presentation presentation);
	public void removePresentation(Integer id);
}
