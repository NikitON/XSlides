package com.team.xslides.dao;

import java.util.List;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.Tag;

public interface TagDAO {
    public List<Tag> getTagsList();
    
    public List<Presentation> getPresentations(String name);
}
