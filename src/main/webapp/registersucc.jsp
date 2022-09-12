<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body>
<p align="center"><b><font size="+5" color="red"> 用户:<%=session.getAttribute("loginname")%>  注册成功!</font>
    <br><br><font size="+2">正在前往登录页面......</font>
</b></p>
<%response.setHeader("refresh","3;http://localhost:8087/javaweb_qimo_war/up_user.jsp");  //3秒后，重定向登录页面%>
<div style="position:absolute;left: 20%;top: 30%"> <img src="img/hc.jpg" width="185" height="211" /></div>
<div style="position:absolute;left: 70%;top: 30%"> <img src="img/hc.jpg" width="185" height="211"/></div>
</body>
</html>
