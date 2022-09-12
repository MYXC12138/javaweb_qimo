<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.Shoplist" %>
<%@ page import="dao.Shoplist_use" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>小卖部主页面</title>
    <link href="css/main.css" rel="stylesheet">
<%--    <script src="js/jquery-3.4.1.min.js"></script>--%>
<%--    <script src="js/ajax.js"></script>--%>
<%--    <script>--%>
<%--        $(function () {--%>
<%--            $("table tr td img").click(function () {--%>
<%--                var sname3=$(this).val();--%>
<%--                alert("123"+sname3);--%>
<%--                // params="sname3="+sname3;--%>
<%--                // sendRequest("CatShop.jsp",params,"POST",succ);--%>
<%--            })--%>
<%--        })--%>

<%--        function succ() {}--%>

<%--    </script>--%>
</head>
<body>
<%--小卖部顶部页面--%>
<div class="main_head">
    <div class="logo"><img src="img/logo3.png"></div>
    <div class="top_up">欢迎您：<%=session.getAttribute("upname1")%>
        <img src="img/grzx.png" width="50" height="50">
        <a href="Gwc.jsp"><img src="img/gwc.png" width="50" height="50"></a>
    <a href="allShop.jsp"> <img src="img/allshop.png" width="75" height="50"></a>
    </div>
</div>

<%--商品列表展示--%>
    <div class="main_down">
        <h1 class="tit1">店长推荐:</h1>


    <div class="shop_table">
    <table>
        <%
            ArrayList<Shoplist> arr=Shoplist_use.getShopList();
            for(int i=0;i<=1;i++){
        %>

        <tr>
            <td><a href="<%="CatShop.jsp?Sid="+arr.get(5*i).getId()%>"> <img src="<%=arr.get(5*i).getTupian()%>" value="<%=arr.get(5*i).getName()%>"></a></td>
            <td><a href="<%="CatShop.jsp?Sid="+arr.get(5*i+1).getId()%>"><img src="<%=arr.get(5*i+1).getTupian()%>" value="<%=arr.get(5*i+1).getName()%>"></a></td>
            <td><a href="<%="CatShop.jsp?Sid="+arr.get(5*i+2).getId()%>"><img src="<%=arr.get(5*i+2).getTupian()%>" value="<%=arr.get(5*i+2).getName()%>"></a></td>
            <td><a href="<%="CatShop.jsp?Sid="+arr.get(5*i+3).getId()%>"><img src="<%=arr.get(5*i+3).getTupian()%>" value="<%=arr.get(5*i+3).getName()%>"></a></td>
            <td><a href="<%="CatShop.jsp?Sid="+arr.get(5*i+4).getId()%>"><img src="<%=arr.get(5*i+4).getTupian()%>" value="<%=arr.get(5*i+4).getName()%>"></a></td>
        </tr>
        <tr>
            <td><span class="s1"><%=arr.get(5*i).getName()%></span></td>
            <td><span class="s1"><%=arr.get(5*i+1).getName()%></span></td>
            <td><span class="s1"><%=arr.get(5*i+2).getName()%></span></td>
            <td><span class="s1"><%=arr.get(5*i+3).getName()%></span></td>
            <td><span class="s1"><%=arr.get(5*i+4).getName()%></span></td>
        </tr>
        <tr>
            <td><span class="s2">￥<%=arr.get(5*i).getJiage()%></span></td>
            <td><span class="s2">￥<%=arr.get(5*i+1).getJiage()%></span></td>
            <td><span class="s2">￥<%=arr.get(5*i+2).getJiage()%></span></td>
            <td><span class="s2">￥<%=arr.get(5*i+3).getJiage()%></span></td>
            <td><span class="s2">￥<%=arr.get(5*i+4).getJiage()%></span></td>
        </tr>
        <%}%>
    </table>
    </div>
    </div>
<div style="position: absolute; left: 0;bottom: 0; width: 100%;">
    <font color="#fffafa"> 页面设计： © 2021 Chen.y.c_8002119338  </font>
</div>
</body>
</html>