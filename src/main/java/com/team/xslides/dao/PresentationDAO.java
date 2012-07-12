package com.team.xslides.dao;

import com.team.xslides.domain.Presentation;

public interface PresentationDAO {
	public void addPresentation(Presentation presentation);

	public void removePresentation(Integer id);
}
