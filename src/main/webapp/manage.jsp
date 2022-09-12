<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.User" %>
<%@ page import="dao.User_use" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/manage.css"/>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script>
        $(function () {

            // 全选框的实现
            $("#c1").click(function () {
                $("input[name='checkbox']").attr("checked",this.checked);

            });
            //下拉菜单栏的实现 toggle():切换隐藏显示状态
            $(".sidebar-content>ul>li").click(function(){
                $(this).children('ul').toggle();
            });
            $(".sidebar-title").click(function () {
                $(".sidebar-content>ul").toggle();
            })


        });

    </script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="manager/index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="manage.jsp">首页</a></li>
                <li><a href="up_user.jsp" target="_blank">小卖部用户登录</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="#">管理员</a></li>
                <li><a href="#">店长信息</a></li>
                <li><a href="#">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <a href="#"><h1>菜单</h1></a>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#">用户管理</a>
                    <ul class="sub-menu">
                        <li><a href="#">用户信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">商品管理</a>
                    <ul class="sub-menu">
                        <li><a href="shopshow.jsp">全部商品</a></li>
                        <li><a href="insertShop.jsp">添加商品</a></li>
                        <li><a href="shopshow.jsp">删除商品</a></li>
                        <li><a href="Shop_indent.jsp">商品订单</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="system.jsp">系统设置</a></li>
                        <li><a href="system.jsp">清理缓存</a></li>
                        <li><a href="system.jsp">数据备份</a></li>
                        <li><a href="system.jsp">数据还原</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><a href="manager/index.html">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">用户信息</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="120">选择分类:</th>
                            <td>
                                <select name="search-sort" id=" ">
                                    <option value="">全部</option>
                                    <option value="19">零食</option><option value="20">饮料</option>
                                </select>
                            </td>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a href="register.jsp">新增用户</a>
                        <a id="batchDel" href="#">批量删除</a>
                        <a id="updateOrd" href="#">更新排序</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="5%"><input class="allChoose" name="" type="checkbox" id="c1">全选</th>
                            <th>用户名</th>
                            <th>账号</th>
                            <th>密码</th>
                        </tr>
                        <%
                            ArrayList<User> arr= User_use.getListWithVOFromRS();
                            int num=User_use.getUsernumber();
                        %>
                        <%for(User uu:arr){%>
                        <tr>
                            <td class="tc"><input name="checkbox" value="59" type="checkbox" ></td>
                            <td><%=uu.getName()%></td>
                            <td><%=uu.getId()%></td>
                            <td><%=uu.getPassword()%></td>
                            <%}%>
                        </tr>
                    </table>
                    <div class="list-page"> 总计<%=num%> 条 1/1 页</div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>