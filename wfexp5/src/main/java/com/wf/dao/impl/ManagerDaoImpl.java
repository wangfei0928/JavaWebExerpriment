package com.wf.dao.impl;

import com.wf.conn.Con;
import com.wf.dao.ManagerDao;
import com.wf.domain.News;
import com.wf.domain.User;

import java.sql.*;

public class ManagerDaoImpl implements ManagerDao {
    Con con = new Con();

    ResultSet resultSet = null;
    @Override
    public ResultSet showNews() {
        Connection connection = con.getconnection();
        String sql ="select * from db_new2022";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
             resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    News news = new News();
    int flag = 0;
    @Override
    public int addNews(News news) {
        Connection connection = con.getconnection();
        String sql = "insert into db_new2022(title, writer, date, hot) values(?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,news.getTitle());
            preparedStatement.setString(2,news.getWriter());
            preparedStatement.setDate(3, (Date) news.getDate());
            preparedStatement.setInt(4,news.getHot());
            flag = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    @Override
    public int register(User user) {
        Connection connection = con.getconnection();
        String sql = "insert into t_user(uid, uname, upassword, usex, uemail,uregdate) values (?,?,?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,user.getUid());
            preparedStatement.setString(2,user.getUname());
            preparedStatement.setString(3,user.getUpassword());
            preparedStatement.setString(4,user.getUsex());
            preparedStatement.setString(5,user.getUemail());
            preparedStatement.setDate(6, (Date) user.getUregdate());

             flag = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public int delete(News news) {
        Connection connection = con.getconnection();
        String sql = "delete from db_new2022 where id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, String.valueOf(news.getId()));
            flag = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public int update(News news) {
        Connection connection = con.getconnection();
        String sql = "update db_new2022 set title = ? , writer = ? , date = ? , hot = ? where id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,news.getTitle());
            preparedStatement.setString(2, news.getWriter());
            preparedStatement.setDate(3, (Date) news.getDate());
            preparedStatement.setString(4, String.valueOf(news.getHot()));
            preparedStatement.setInt(5,news.getId());

            flag = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
