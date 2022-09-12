package action;

import dao.Shoplist;
import dao.Shoplist_use;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/ishop")
public class ishopservlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html;charset=utf-8");    //防止切换后中文变成问号
        req.setCharacterEncoding("utf-8");
        String id=req.getParameter("id");    //商品编号
        String name= req.getParameter("name");    //商品名字
        String tupian= req.getParameter("tupian");           //图片
        String leibie=req.getParameter("leibie"); //类别
        String jiage=req.getParameter("jiage");  //价格
        String kucun= req.getParameter("kucun");     //库存
//        System.out.println(tupian);
        Shoplist sl=new Shoplist();
        sl.setId(id);
        sl.setName(name);
        sl.setTupian(tupian);
        sl.setLeibie(leibie);
        sl.setJiage(jiage);
        sl.setKucun(kucun);

        try {
            Shoplist_use.ins(sl);   //商品插入
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
