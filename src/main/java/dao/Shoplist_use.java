package dao;

import tools.UTIL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class Shoplist_use {
    public static ArrayList<Shoplist> getShopList() throws SQLException{    //查询全部商品
        String sql = "select * from Shoplist";
        ArrayList<Shoplist> arr = new ArrayList<>();
        Shoplist ss = null;
        try {
            Connection con = UTIL.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet RS = ps.executeQuery();
            while (RS.next()) {
                ss = new Shoplist();
                ss.setId(RS.getString("ID"));
                ss.setName(RS.getString("NAME"));
                ss.setTupian(RS.getString("TUPIAN"));
                ss.setJiage(RS.getString("JIAGE"));
                ss.setKucun(RS.getString("KUCUN"));
                ss.setLeibie(RS.getString("leibie"));
                arr.add(ss);
            }
        } catch (SQLException e) {
        }
        return arr;
    }
    public static int getShopnumber() throws SQLException {           //得到商品数量
        String sql = "select * from Shoplist";
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
    public  static String idcname(String id) throws SQLException{  //根据id查商品名字
        String sql = "select name from Shoplist where id="+id;
        Connection con = UTIL.getCon();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet RS=ps.executeQuery();
        String name=null;
        while (RS.next()){
            name=RS.getString("NAME");
        }
        return name;
    }
    public  static String idcjiage(String id) throws SQLException{  //根据id查商品价格
        String sql = "select jiage from Shoplist where id="+id;
        Connection con = UTIL.getCon();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet RS=ps.executeQuery();
        String jiage=null;
        while (RS.next()){
            jiage=RS.getString("JIAGE");
        }
        return jiage;
    }
    public  static String idctupian(String id) throws SQLException{  //根据id查商品图片
        String sql = "select tupian from Shoplist where id="+id;
        Connection con = UTIL.getCon();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet RS=ps.executeQuery();
        String tupian=null;
        while (RS.next()){
            tupian=RS.getString("TUPIAN");
        }
        return tupian;
    }
    public static void ins(Shoplist s) throws SQLException, ClassNotFoundException {   //增加商品
        //先建立 连接
        Connection con=UTIL.getCon();//
        //写在数据库中运行的 sql  insert ... 对于java代码来说，其实就是一个字符串
        String sql="insert into Shoplist (id,name,leibie,tupian,jiage,kucun)  " +
                "values (?,?,?,?,?,?) ";
        //用占位符 每个?是一个占位符,等下会传入的值
        PreparedStatement ps=con.prepareStatement(sql);
        //第一个?就是序号1
        ps.setString(1,s.getId());
        ps.setString(2,s.getName());
        ps.setString(3,s.getLeibie());
        ps.setString(4,s.getTupian());
        ps.setString(5,s.getJiage());
        ps.setString(6,s.getKucun());
        int m= ps.executeUpdate();// 返回类型是操作记录数
        System.out.println(m);
    }

}
