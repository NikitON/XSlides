package com.team.xslides.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.Tag;
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
    public String getContent(Integer id) {
        return presentationDAO.getContent(id);
    }

    @Transactional
    public Presentation getPresentation(Integer id) {
        return presentationDAO.getPresentation(id);
    }

    @Transactional
    public String getPresentationJson(Integer id) {
        return presentationDAO.getPresentationJson(id);
    }

    @Transactional
    public List<Presentation> getPresentationsList() {
        return presentationDAO.getPresentationsList();
    }

    @Transactional
    public List<Presentation> getPresentationForQuery(String searchQuery) {
        return presentationDAO.getPresentationForQuery(searchQuery);
    }

    @Transactional
    public void setNewTitle(Integer id, String title) {
        presentationDAO.setNewTitle(id, title);
    }

    @Transactional
    public void setNewTheme(Integer id, String theme) {
        presentationDAO.setNewTheme(id, theme);
    }

    @Transactional
    public void setNewDescription(Integer id, String description) {
        presentationDAO.setNewDescription(id, description);
    }

    @Transactional
    public void clearTags(Integer id) {
        presentationDAO.clearTags(id);
    }

    @Transactional
    public void setNewTags(Integer id, Set<Tag> tags) {
        presentationDAO.setNewTags(id, tags);
    }

    @Transactional
    public String getTemplate(Integer id) {
        return presentationDAO.getTemplate(id);
    }

    @Transactional
    public void setTemplate(Integer presentationID, Integer templateID) {
        presentationDAO.setTemplate(presentationID, templateID);
    }
}
