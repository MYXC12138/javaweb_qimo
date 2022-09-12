package dao;

import tools.UTIL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Shopindent_use {
    //查询订单
    public static ArrayList<Shopindent> getShopIndent() throws SQLException {
        String sql = "select * from Shopindent1";
        ArrayList<Shopindent> arr = new ArrayList<>();
        Shopindent ss = null;
        try {
            Connection con = UTIL.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet RS = ps.executeQuery();
            while (RS.next()) {
                ss = new Shopindent();
                ss.setId(RS.getInt("ID"));
                ss.setSname(RS.getString("SNAME"));
                ss.setNname(RS.getString("NNAME"));
                ss.setNadd(RS.getString("NADD"));
                ss.setShuliang(RS.getInt("SHULIANG"));
                ss.setJianum(RS.getString("JIANUM"));
                arr.add(ss);
            }
        } catch (SQLException e) {
        }
        return arr;
    }
    public static int getShopnumber() throws SQLException {    //获取订单数量
        String sql = "select * from Shopindent1";
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
    public static void in(Shopindent s) throws SQLException, ClassNotFoundException {   //增加订单
        //先建立 连接
        Connection con=UTIL.getCon();//
        //写在数据库中运行的 sql  insert ... 对于java代码来说，其实就是一个字符串
        String sql="insert into Shopindent1 (id,sname,nname,nadd,shuliang,jianum)  " +
                "values (shop_in2.nextval,?,?,?,?,?) ";
        //用占位符 每个?是一个占位符,等下会传入的值
        PreparedStatement ps=con.prepareStatement(sql);
        //第一个?就是序号1
        ps.setString(1,s.getSname());
        ps.setString(2,s.getNname());
        ps.setString(3,s.getNadd());
        ps.setInt(4,s.getShuliang());
        ps.setString(5,s.getJianum());
        int m= ps.executeUpdate();// 返回类型是操作记录数
        System.out.println(m);
    }
}
