package action;

import dao.Shopindent;
import dao.Shopindent_use;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/iindent")
public class iidentservlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html;charset=utf-8");    //防止切换后中文变成问号
        req.setCharacterEncoding("utf-8");
        String sname1=req.getParameter("sname1");    //商品名字
        String nname1= req.getParameter("nname");    //用户名字
        String dz= req.getParameter("dz");           //地址
        String shuliang=req.getParameter("shuliang");  //数量
        int shuliang2=Integer.parseInt(shuliang);
        String jianum= req.getParameter("jianum");     //价格
//        System.out.println(nname1);
//        System.out.println(sname1);
//        System.out.println(dz);
//        System.out.println(shuliang2);

//        System.out.println(jianum);
        Shopindent ss=new Shopindent();
        ss.setSname(sname1);
        ss.setNname(nname1);
        ss.setNadd(dz);
        ss.setShuliang(shuliang2);
        ss.setJianum(jianum);

        try {
            Shopindent_use.in(ss);   //商品订单插入
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
