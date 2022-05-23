package com.wf.service.impl;

import com.wf.dao.ManagerDao;
import com.wf.dao.impl.ManagerDaoImpl;
import com.wf.domain.News;
import com.wf.domain.User;
import com.wf.service.ManagerService;

import java.sql.ResultSet;

public class ManagerServiceImpl implements ManagerService {
    ManagerDao managerDao = new ManagerDaoImpl();
    @Override
    public ResultSet showNews() {

        ResultSet resultSet = managerDao.showNews();
        return resultSet;
    }

    @Override
    public int addNews(News news) {
        int i = managerDao.addNews(news);
        return i;
    }

    @Override
    public int register(User user) {
        int i  = managerDao.register(user);
        return i;
    }

    @Override
    public int delete(News news) {
        int i = managerDao.delete(news);
        return  i;
    }

    @Override
    public int update(News news) {
        int i = managerDao.update(news);
        return i;
    }
}
