<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        html{
            width: 100%;
            height: 100%;
            overflow: hidden;
            font-style: italic;
        }
        body{
            width: 100%;
            height: 100%;
            font-family: 'Open Sans',sans-serif;
            margin: 0;
            background: url("img/bg.jpg") no-repeat;
            background-size: cover;
        }
        #login{
            position: absolute;
            top: 50%;
            left:50%;
            margin: -150px 0 0 -150px;
            width: 300px;
            height: 300px;
        }
        #login h1{
            color: #fff;
            text-shadow:0 0 10px;
            letter-spacing: 1px;
            text-align: center;
        }
        h1{
            font-size: 2em;
            margin: 0.67em 0;
        }
        input{
            width: 278px;
            height: 30px;
            margin-bottom: 18px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            color: #fff;
            text-shadow:1px 1px 1px;
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            background-color: #2D2D3F;
        }
        .but{
            height: 20px;
            width: 80px;
            background:rgba(255,255,255,0.01);
            color: #FFFFFF;
            text-shadow: 0 0 0 rgba(0,0,255,0.5);

        }
    </style>
</head>
<body>
<div id="logo6"><img src="img/logo6.png" width="350" height="100"></div>
<div id="login">
    <h1>后台管理登录</h1>
    <form method="post" action="manage.jsp">
        <input type="text" required="required" placeholder="用户名" name="u"></input>
        <input type="password" required="required" placeholder="密码" name="p"></input>
       <button class="but" type="submit">登录</button>
    </form>
</div>
</body>
</html>