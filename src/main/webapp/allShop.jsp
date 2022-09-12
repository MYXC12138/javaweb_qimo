<%@ page import="dao.Shoplist" %>
<%@ page import="dao.Shoplist_use" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部商品</title>
    <link rel="stylesheet" href="css/allShop.css">
</head>
<body>
<div class="main_head">
    <div class="logo"><img src="img/logo3.png"></div>
    <div class="top_up">欢迎您：<%=session.getAttribute("upname1")%>
        <img src="img/grzx.png" width="50" height="50">
        <a href="Gwc.jsp"><img src="img/gwc.png" width="50" height="50"></a>
        <a href="mainFrame.jsp"><img src="img/dztj.jpg" width="50" height="50"></a>
    </div>
</div>

<div class="main_down">
    <table class="qtable" width="90%" cellspacing="0" border="1" align="center" rules=rows>
        <%
            ArrayList<Shoplist> RR= Shoplist_use.getShopList();
        %>
        <%for(Shoplist a:RR){%>


        <tr>
            <td align="center" id="qlb"><%=a.getLeibie()%></td>
            <td align="center"><img src="<%=a.getTupian()%>"></td>
            <td align="center" id="qname"><%=a.getName()%></td>
            <td align="center" id="qjg"><%=a.getJiage()%>元</td>
            <td align="center"><a href="<%="CatShop.jsp?Sid="+a.getId()%>"><input type="button" value="购买" id="qbtn"></a></td>
            <%}%>
        </tr>
    </table>
</div>
</body>
</html>
