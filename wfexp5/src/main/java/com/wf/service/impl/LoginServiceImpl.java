package com.wf.service.impl;

import com.wf.dao.LoginDao;
import com.wf.dao.impl.LoginDaoImpl;
import com.wf.service.LoginService;

public class LoginServiceImpl implements LoginService {
    @Override
    public int LoginUser(String uid, String upassword) {

        LoginDao loginDao = new LoginDaoImpl();
        System.out.println(uid);

        System.out.println(upassword);

        int i = loginDao.LoginUser(uid,upassword);

        return i;


    }
}
