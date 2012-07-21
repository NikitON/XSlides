package com.team.xslides.service;

import java.util.List;

import com.team.xslides.domain.Presentation;

public interface TagService {
    public List<Presentation> getPresentations(String name);
}
