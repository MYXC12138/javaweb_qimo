<%--
  Created by IntelliJ IDEA.
  User: DSHH
  Date: 2021/10/11
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" href="css/register.css" >
    <script>
        function checkform(){
            if(text1submit()&&text2submit()&&text3submit())
            {return true;}
            else
                return false;}
        function text1submit(){
            var id=document.loginform.loginid;
            if(id.value==""){
                alert("账号不能为空哦\u263a");
                id.focus();
                return false;}
            else if(id.value.length<6){
                alert("账号不能小于6位");
                return false;
            }
            else return true;
        }
        function text2submit(){
            var pass=document.loginform.loginpass.value;
            var rpass=document.loginform.loginpass2.value;
            //
            var flag2=false;

            if(pass==""){
                alert("密码不能为空哦\u263a");
                return false;
            }
            else if(pass!=rpass){
                alert("确认密码与密码输入不一致");
                return false;
            }
            else {

                for(var i=0;i<pass.length;i++){
                    var charType=pass.toUpperCase().charAt(i);
                    if(charType>="A" && charType<="Z") flag2=true;
                }
            }

            if(!flag2){
                alert("密码不能纯数字");
                return false;
            }
            else
            {return true;}
        }
        function text3submit(){
            var nname=document.loginform.loginname;
            if(nname.value==""){
                alert("账号名不能为空哦\u263a");
                nname.focus();
                return false;}
            else { return true;}
        }

    </script>
</head>
<body>
<%--注册框--%>
<div id="logo6"><img src="img/logo6.png" width="350" height="100"></div>
<div class="regwd">
    <div class="form">
        <h2>欢迎注册</h2>
<form name="loginform" action="loginwin" method="post" onsubmit="return checkform()">
    <div class="inputtext"><input type="text" class="" name="loginid" placeholder="请输入账号"></div>

    <div class="inputtext"><input type="password" class="" name="loginpass" placeholder="请设置密码"></div>
    <div class="inputtext"><input type="password" class="" name="loginpass2" placeholder="请再次输入密码"></div>
    <div class="inputtext"><input type="text" class="" name="loginname" placeholder="请输入用户名"></div>
<input type="submit" value="注册" class="">
    <p class="forget">已有账号?<a href="up_user.jsp">
        登录
    </a></p>
</form>
    </div>
</div>
<div style="position: absolute; left: 0;bottom: 0; width: 100%;">
    <font color="#fffafa"> 页面设计： © 2021 Chen.y.c_8002119338  </font>
</div>
</body>
</html>
