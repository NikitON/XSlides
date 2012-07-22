package com.team.xslides.dao;

import java.util.List;
import java.util.Set;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.Tag;

public interface PresentationDAO {
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
    
    public void clearTags(Integer id);
    
    public void setNewTags(Integer id, Set<Tag> tags);
}
