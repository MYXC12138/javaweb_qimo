package action;

import dao.User_use;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/loginwin")
public class Registerservlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException {
        res.setContentType("text/html;charset=utf-8");    //防止切换后中文变成问号
        req.setCharacterEncoding("utf-8");
        String loginname=req.getParameter("loginname");
        String loginid=req.getParameter("loginid");
        String loginpass=req.getParameter("loginpass");
        PrintWriter p=res.getWriter();//可以把信息输出给客户端界面

        HttpSession session = req.getSession();
        try {

            if(!User_use.selectId(loginid)){  //如果不存在相同的id
                if(!User_use.selectName(loginname)) {   //不存在相同的账号名
                    User_use.in(loginname,loginid,loginpass);
                    session.setAttribute("loginname", loginname);   //定义全局变量名
                    res.sendRedirect("registersucc.jsp");
                }
                else{   //存在相同的账号名
                    p.println("注册失败！已存在该账号名");
                    res.setHeader("refresh","3;http://localhost:8087/javaweb_qimo_war/register.jsp");
                }
            }
            else{//存在了相同的id
                p.println("注册失败！已存在该账号");
                res.setHeader("refresh","3;http://localhost:8087/javaweb_qimo_war/register.jsp");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
