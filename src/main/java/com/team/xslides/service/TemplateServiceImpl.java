package com.team.xslides.service;

import com.team.xslides.dao.TemplateDAO;

import com.team.xslides.domain.Template;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TemplateServiceImpl implements TemplateService {
    @Autowired
    private TemplateDAO templateDAO;

    @Transactional
    public String getTemplate(Integer id) {
        return templateDAO.getTemplate(id);
    }

    @Transactional
    public Template getTemplateById(Integer id) {
        return templateDAO.getTemplateById(id);
    }
}
