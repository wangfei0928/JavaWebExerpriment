package com.example.cookie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.SimpleTimeZone;

@WebServlet("/cookieTest")
//http://localhost:8080/exp2wf/cookieTest
public class TestCookie extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置响应的消息体的数据格式以及编码方式
        resp.setContentType("text/html;charset=UTF-8");

        //获取所有cookie
        Cookie[] cookies =  req.getCookies();

        boolean flag =  false;  //没有cookie为lastTime

        //遍历cookie数组
        if (  cookies != null && cookies.length >0){
            for (Cookie cookie : cookies) {
                //获取cookie的名称
                String name = cookie.getName();
                //判断cookie的名称是否是lastTime
                if ("lastTime".equals(name)){
                    //有该cookie，不是第一次访问
                    flag = true; //有lastTime的cookie的值
                    //设置cookie的value,获取当前时间字符串，重新设置cookie的值，并且重新设置cookie
                    Date date = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss秒");
                    String str_sdf = sdf.format(date);
                    cookie.setValue(str_sdf);
                    //设置cookie的存活时间
                    cookie.setMaxAge(60*60*24*30);  //一个月
                    resp.addCookie(cookie);
                    //响应数据
                    String value = cookie.getValue();
                    resp.getWriter().write("欢迎回来，您上次访问的时间为 "+value);
                    break;
                }
            }

        }
        if (cookies ==null || cookies.length==0||flag == false){
            //设置cookie的value,获取当前时间字符串，重新设置cookie的值，并且重新设置cookie
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss秒");
            String str_sdf = sdf.format(date);
            Cookie cookie = new Cookie("lastTime",str_sdf);
            //设置cookie的存活时间
            cookie.setMaxAge(60*60*24*30);  //一个月
            resp.addCookie(cookie);

            resp.getWriter().write("欢迎您第一次访问");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
