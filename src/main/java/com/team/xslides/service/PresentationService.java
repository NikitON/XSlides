package com.team.xslides.service;

import java.util.List;

import com.team.xslides.domain.Presentation;

public interface PresentationService {

    public void addPresentation(Presentation presentation);

    public void removePresentation(Integer id);

    public String getContent(Integer id);

    public Presentation getPresentation(Integer id);

    public String getPresentationJson(Integer id);
    
    public List<Presentation> getPresentationsList();

    public List<Presentation> getPresentationForQuery(String searchQuery);
    
    public void setNewTitle(Integer id, String title);

    public void setNewTheme(Integer id, String theme);
    
    public void setNewDescription(Integer id, String description);
}
