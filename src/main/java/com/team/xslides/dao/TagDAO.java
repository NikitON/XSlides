package com.team.xslides.dao;

import java.util.List;

import com.team.xslides.domain.Presentation;

public interface TagDAO {
    public List<Presentation> getPresentations(String name);
}
