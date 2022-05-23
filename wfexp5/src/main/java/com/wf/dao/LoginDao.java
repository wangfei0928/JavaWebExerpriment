package com.wf.dao;

import com.wf.domain.User;

import java.sql.ResultSet;

public interface LoginDao {

     public int LoginUser(String uid,String upassword);
}
