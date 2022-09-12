<%--
  Created by IntelliJ IDEA.
  User: DSHH
  Date: 2021/10/11
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成功</title>
</head>
<body>
<p align="center"><b><font size="+5" color="red"> 用户:<%=session.getAttribute("upname1")%>  登录成功!</font>
    <br><br><font size="+2">正在进入......</font>
</b></p>
<%response.setHeader("refresh","3;http://localhost:8087/javaweb_qimo_war/mainFrame.jsp");  //3秒后，重定向登录页面%>
<div style="position:absolute;left: 20%;top: 30%"> <img src="img/kx2.jpg" width="185" height="211" /></div>
<div style="position:absolute;left: 70%;top: 30%"> <img src="img/kx2.jpg" width="185" height="211"/></div>
</body>
</html>
