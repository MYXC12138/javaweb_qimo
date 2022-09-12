<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ page import="dao.Shopindent" %>
<%@ page import="dao.Shopindent_use" %>
<%@ page import="dao.Shoplist_use" %>
<html>
<head>
    <title>商品详情</title>
    <link href="css/main.css" rel="stylesheet">
    <link href="css/Shop_cat.css" rel="stylesheet">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/ajax.js"></script>
    <script>
        $(function () {
            $("#i1").click(function () {

                var i = parseInt($("#number").html()) - 1;
                $("#number").html(i);
            });
            $("#i2").click(function () {
                var i = parseInt($("#number").html()) + 1;
                $("#number").html(i);
            });

            calc()
            function calc() {
                //计算商品总价 单价*数量（保留两位小数）
                $('.good_total').map((i, k) => {
                    $(k).text(($(".goods_num").val()*$(".goods_price").text()).toFixed(2))
                })
            }

            //商品数量加减(这里我设定商品数量最小值为1，最大值为999)
            $('.goods_num_wrap').map((i, k) => {
                // 数量减
                $(k).find('span').eq(0).click(function () {
                    var num = $(this).next().val()
                    num--
                    num = num < 1 ? 1 : num
                    $(this).next().val(num)
                    calc()
                })
                // 数量加
                $(k).find('span').eq(1).click(function () {
                    var num2 = $(this).prev().val()
                    num2++
                    num2 = num2 > 999 ? 999 : num2
                    $(this).prev().val(num2)
                    calc()
                })
                // 手动输入(这里可根据需要对输入的内容做正则验证)
                $(k).find('.goods_num').blur(function () {
                    var num3 = $(k).find('.goods_num').val()
                    num3 = num3 > 999 ? 999 : (num3 < 1 ? 1 : num3)
                    $(k).find('.goods_num').val(num3)
                    calc()
                })
            });
            calc()
        });

        function insertindent() {
            var i1=$("#tt").text();
            var i2="<%=session.getAttribute("upname1")%>"
            var i3=$("#shuliang").val();
            var i4=$("#dz").val();
            var i5=$(".good_total").text();
            var param="sname1="+i1+"&nname="+i2+"&shuliang="+i3+"&dz="+i4+"&jianum="+i5;
            sendRequest("iindent",param,"POST",result);
        }
        function result(){
            if (httpRequest.readyState == 4) {
                if (httpRequest.status == 200) {
                    alert("购买成功！店长正在抓紧发货~");


                }
            }

        }


    </script>
</head>
<body>
<%--小卖部顶部页面--%>
<div class="main_head">
    <div class="logo"><img src="img/logo3.png"></div>
    <div class="top_up">欢迎您：<%=session.getAttribute("upname1")%>
        <img src="img/grzx.png" width="50" height="50">
        <a href="mainFrame.jsp"><img src="img/dztj.jpg" width="50" height="50"></a>
        <a href="allShop.jsp"> <img src="img/allshop.png" width="75" height="50"></a>
    </div>
</div>
<%
    String id=request.getParameter("Sid");   //取到要显示商品的id
    String name= Shoplist_use.idcname(id);    //根据id查询名字
    String jiage=Shoplist_use.idcjiage(id);   //根据id查询价格
    String tupian=Shoplist_use.idctupian(id);  //根据id查询商品图片
%>
<%--商品列表展示--%>
<div class="main_down">
    <div class="mainwdow">
    <div class="picture">
        <img src="<%=tupian%>" width="400" height="400">
    </div>
    <div class="mas_table">

    <table align="left">
    <tr><td><div class="shopname"><h1 id="tt" value="狗牙披萨卷"><%=name%></h1>
        <p>【送货上门】【过期包赔】【涨包无理由退换货】【包邮】【童年回忆零食】</p>
    </div></td>
        <tr><td>单价：<i class="goods_price"><%=jiage%></i>元</td></tr>
    </tr>
        <tr><td>
  <div class="goods_num_wrap">
      <span>-</span><input type="text" value="1" class="goods_num" id="shuliang"><span>+</span>
  </div></td></tr>
        <tr><td>总价：<i class="good_total">--</i>元</td></tr>
        <tr><td><div class="cataddress"><input type="text" placeholder="请填写地址，例：6#505" id="dz"> </div></td></tr>
        <tr><td>
        <input type="submit" value="购买" id="gbtn" onclick="insertindent()">
            <input type="submit" value="加入购物车" id="jgwc">
        </td>

        </tr>
    </table>
    </div>
    </div>
</div>
<div style="position: absolute; left: 0;bottom: 0; width: 100%;">
    <font color="#fffafa"> 页面设计： © 2021 Chen.y.c_8002119338  </font>
</div>
</body>
</html>
