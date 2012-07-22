package com.team.xslides.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.xslides.dao.TagDAO;
import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.Tag;

@Service
public class TagServiceImpl implements TagService {
    @Autowired
    private TagDAO tagDAO;
    
    @Transactional
    public List<Presentation> getPresentations(String name) {
        return tagDAO.getPresentations(name);
    }
    
    @Transactional
    public List<Tag> getTagsList() {
        return tagDAO.getTagsList();
    }
}
