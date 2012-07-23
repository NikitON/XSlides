package com.team.xslides.dao;

import com.team.xslides.domain.Template;

public interface TemplateDAO {
    public String getTemplate(Integer id);

    public Template getTemplateById(Integer id);
}
