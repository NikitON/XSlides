package com.team.xslides.service;

import java.util.List;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.Tag;

public interface TagService {
    public List<Tag> getTagsList();
    
    public List<Presentation> getPresentations(String name);
}
