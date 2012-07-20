package com.team.xslides.dao;

import java.util.List;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.User;

public interface PresentationDAO {
    public void addPresentation(Presentation presentation);

    public void removePresentation(Integer id);

    public List<Presentation> presentationsOfUser(User author);

    public String getContent(Integer id);

    public Presentation getPresentation(Integer id);

    public String getPresentationJson(Integer id);
    
    public List<Presentation> getPresentationsList();
    
    public List<Presentation> getPresentationForQuery(String searchQuery);
}
