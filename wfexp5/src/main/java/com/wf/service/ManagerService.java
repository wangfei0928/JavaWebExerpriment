package com.wf.service;

import com.wf.domain.News;
import com.wf.domain.User;

import java.sql.ResultSet;

public interface ManagerService {
    public ResultSet showNews();
    public int addNews(News news);
    public int register(User user);
    public int delete(News news);
    public int update(News news);
}
