package com.wf.dao.impl;

import com.wf.conn.Con;

import java.sql.*;

import com.wf.dao.LoginDao;
import com.wf.domain.User;


import java.sql.Connection;


public class LoginDaoImpl implements LoginDao {

    int flag = 0;
    Con con = new Con();

    @Override
    public int LoginUser(String uid,String upassword) {

        Connection connection = con.getconnection();
        String sql = "select * from t_user";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String uid1 = resultSet.getString("uid");
                String upassword1 = resultSet.getString("upassword");
                if (uid.equals(uid1) && upassword.equals(upassword1)){
                    flag = 1;
                    break;
                }else {
                    flag = 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
