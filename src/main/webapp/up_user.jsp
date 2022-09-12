<%--
  Created by IntelliJ IDEA.
  User: DSHH
  Date: 2021/10/13
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/up.css">

    <title>用户登录</title>
    <script>
        function checkform(){
            if(text1submit()&&text2submit())
            {return true;}
            else
                return false;}
        function text1submit(){
            var name=document.upform.upid;
            if(name.value==""){
                alert("账号不能为空哦\u263a");
                name.focus();
                return false;}
            else
                return true;
        }
        function text2submit(){
            var pass=document.upform.uppass;
            if(pass.value==""){
                alert("密码不能为空哦\u263a");
                pass.focus();
                return false;}
            else
                return true;
        }
    </script>
</head>

<body>
<section>
<%--    <!-- 背景颜色 -->--%>
<%--    <div class="color"></div>--%>
<%--    <div class="color"></div>--%>
<%--    <div class="color"></div>--%>
    <div  class="bt">
        超超小卖部503分店
    </div>
<%--    圆和登录框层--%>
    <div class="box">

        <!-- 背景圆 -->
        <div class="circle" style="--x:0"></div>
        <div class="circle" style="--x:1"></div>
        <div class="circle" style="--x:2"></div>
        <div class="circle" style="--x:3"></div>
        <div class="circle" style="--x:4"></div>
        <div class="circle" style="--x:5"></div>
        <!-- 登录框 -->
        <div class="container">
            <div class="form">
                <h2 align="center">用户登录</h2>
                <form name="upform" action="upwin" method="post" onsubmit="return checkform()">
                    <div class="inputBox">
                        <input type="text" placeholder="账号" name="upid">

                    </div>
                    <div class="inputBox">
                        <input type="password" placeholder="密码" name="uppass">

                    </div>
                        <input type="submit" value="登录" class="btn">
                    <p class="forget">没有账户?<a href="register.jsp">
                        注册
                    </a></p>
                </form>
            </div>
        </div>
    </div>
</section>
<div style="position: absolute; left: 0;bottom: 0; width: 100%;">
    <font color="#fffafa"> 页面设计： © 2021 Chen.y.c_8002119338  </font>
</div>
</body>

</html>
