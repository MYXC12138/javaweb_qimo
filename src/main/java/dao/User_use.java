package dao;

import tools.UTIL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class User_use {
    private static int number1;        //用于账号密码的匹配
    private static int number2;


    public static void in(String loginname,String loginid,String loginpass) throws SQLException {  //数据库的插入功能
        Connection con= UTIL.getCon();//建立 连接
        String sql= "insert into User1 (NAME,ID,PASSWORD) " +
                "values(?,?,?)";
        //设置变量，用?占位符  等下会传入值过来
        PreparedStatement gg=con.prepareStatement(sql);
        //  要在执行前赋值 第一个? 序号是1
        gg.setString(1,loginname);
        gg.setString(2,loginid);
        gg.setString(3,loginpass);
        gg.executeUpdate();//执行,返回结果是操作了几条数据

    }
    public static boolean selectName(String mname) throws SQLException {  //查询name
        Connection con=UTIL.getCon();
        String sql="select * from User1";
        PreparedStatement gg=con.prepareStatement(sql);
        ResultSet rs1=gg.executeQuery();
        try{
            while(rs1.next()){//指针向后移动
                String nname=rs1.getString("NAME");
                if(nname.equals(mname)){
                    return true;
                }
            }


        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static boolean selectId(String iid) throws SQLException {//查询id
        number1=0;   //清零
        Connection con=UTIL.getCon();
        String sql="select * from User1";
        PreparedStatement gg=con.prepareStatement(sql);
        ResultSet rs2=gg.executeQuery();
        try{
            while(rs2.next()){//指针向后移动
                String id=rs2.getString("ID");
                number1++;
                if(id.equals(iid)){
                    return true;
                }
            }


        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static boolean selectPass(String pass) throws SQLException {//查询密码
        number2=0;  //清0
        Connection con=UTIL.getCon();
        String sql="select * from User1";
        PreparedStatement gg=con.prepareStatement(sql);
        ResultSet rs3=gg.executeQuery();
        try{
            while(rs3.next()){//指针向后移动
                String ppass=rs3.getString("PASSWORD");
                number2++;
                if(ppass.equals(pass)&&(number1==number2)){   //id和密码要匹配
                    return true;
                }
            }


        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static String returnname(String id) throws SQLException {   //根据id找账号名
        Connection con = UTIL.getCon();
        String sql = "select * from User1 where id=" + id;
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs4 = pstmt.executeQuery();
        String name = null;
        while (rs4.next()) {//指针向后移动
            name = rs4.getString("NAME");

        }
        return name;
    }
    //记录基每行数据存放到值对象，然后把值对象存放一个链表
    public static ArrayList<User> getListWithVOFromRS() throws SQLException{
        String sql = "select * from User1";
        ArrayList<User> arr = new ArrayList<>();
        User uu = null;
        try {
            Connection con = UTIL.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet RS = ps.executeQuery();
            while (RS.next()) {
                uu = new User();
                uu.setId(RS.getInt("ID"));
                uu.setName(RS.getString("NAME"));
                uu.setPassword(RS.getString("PASSWORD"));
                arr.add(uu);
            }
        } catch (SQLException e) {
        }
        return arr;
    }
    //返回用户数
    public static int getUsernumber() throws SQLException {
        String sql = "select * from User1";
        Connection con = UTIL.getCon();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet RS=ps.executeQuery();
        int count=0;
        while(RS.next())
        {
            count=count+1;
        }
        return count;

    }
}
