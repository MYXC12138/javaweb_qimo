<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车界面</title>
    <link href="css/main.css" rel="stylesheet">
    <link href="css/Gwc.css" rel="stylesheet">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script>
        // 1、默认全都勾选
        $(function(){
            calc()
            function calc(){
                var checked_num = 0
                var total_money =  0
                //计算每件商品小计 单价*数量（保留两位小数）
                $('.total').map((i,k)=>{
                    $(k).text(($(k).prev().prev().text()*$(k).prev().find('.goods_num').val()).toFixed(2))
                })
                $('.check_one').map((i,k)=>{
                    if($(k).prop('checked') == true){
                        checked_num++
                        var parent = $(k).parent().parent()
                        total_money += parent.find('.total').text()-0
                    }
                })
                //商品选中数量
                $('.checked_num').text(checked_num)
                //计算合计
                $('.total_money').text(total_money.toFixed(2))
                //结算按钮变色
                if(total_money!=0){
                    $(".gwcbtn").css("background-color","red");
                }
                else{
                    $(".gwcbtn").css("background-color","gray");
                }
            }


            //商品数量加减(这里我设定商品数量最小值为1，最大值为999)
            $('.goods_num_wrap').map((i,k)=>{
                // 数量减
                $(k).find('span').eq(0).click(function(){
                    var num = $(this).next().val()
                    num--
                    num = num < 1 ? 1 :num
                    $(this).next().val(num)
                    calc()
                })
                // 数量加
                $(k).find('span').eq(1).click(function(){
                    var num2 = $(this).prev().val()
                    num2++
                    num2 = num2 > 999 ? 999 : num2
                    $(this).prev().val(num2)
                    calc()
                })
                // 手动输入(这里可根据需要对输入的内容做正则验证)
                $(k).find('.goods_num').blur(function(){
                    var num3 = $(k).find('.goods_num').val()
                    num3 = num3>999?999:(num3<1?1:num3)
                    $(k).find('.goods_num').val(num3)
                    calc()
                })
            })

            // 全选
            $('.check_all').click(function(){
                if($(this).prop('checked') == true){
                    $('.check_one').prop('checked',true)
                    $('.check_all').prop('checked',true)
                }else{
                    $('.check_one').prop('checked',false)
                    $('.check_all').prop('checked',false)
                }
                calc()
            })

            // 反选
            $('.check_one').click(function(){
                var checked_num = 0
                $('.check_one').map((i,k)=>{
                    if($(k).prop('checked') == true){
                        checked_num++
                    }
                })

                if(checked_num == $('.check_one').length){
                    $('.check_all').prop('checked',true)
                }else{
                    $('.check_all').prop('checked',false)
                }
                calc()
            })
        })
    </script>
</head>
<body>
<%--小卖部顶部页面--%>
<div class="main_head">
    <div class="logo"><img src="img/logo2.png"></div>
    <div class="top_up">欢迎您：<%=session.getAttribute("upname1")%>
        <img src="img/grzx.png" width="50" height="50">
        <a href="mainFrame.jsp"><img src="img/dztj.jpg" width="50" height="50"></a>
        <a href="allShop.jsp"> <img src="img/allshop.png" width="75" height="50"></a>

    </div>
</div>
<div class="main_down">
<div class="container">
    <div class="cart_top"><span>购物车</span></div>
    <div class="cart_wrap">
        <table class="cart_table" border="1" cellspacing="0" bgcolor="#fffafa" rules=rows>
            <tr class="cart_title">
                <th>
                    <input type="checkbox" class="check_all">&nbsp;全选
                </th>
                <th>图片</th>
                <th>商品</th>
                <th>单价</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
            <tr class="cart_item">
                <th>
                    <input type="checkbox" class="check_one">
                </th>
                <td class="img_wrap">
                    <img src="shoimg/00001.jpg" alt="">
                </td>
                <td>狗牙披萨卷</td>
                <td class="goods_price">1.0</td>
                <td class="goods_num_wrap">
                    <span>-</span><input type="text" value="1" class="goods_num"><span>+</span>
                </td>
                <td class="total">--</td>
            </tr>
            <tr class="cart_item">
                <th>
                    <input type="checkbox" class="check_one">
                </th>
                <td class="img_wrap">
                    <img src="shoimg/00003.jpg" alt="">
                </td>
                <td>卫龙魔芋爽</td>
                <td class="goods_price">1.0</td>
                <td class="goods_num_wrap">
                    <span>-</span><input type="text" value="1" class="goods_num"><span>+</span>
                </td>
                <td class="total">--</td>
            </tr>
            <tr class="cart_item">
                <th>
                    <input type="checkbox"  class="check_one">
                </th>
                <td class="img_wrap">
                    <img src="shoimg/00005.jpg" alt="">
                </td>
                <td>奥利奥饼干</td>
                <td class="goods_price">9.9</td>
                <td class="goods_num_wrap">
                    <span>-</span><input type="text" value="3" class="goods_num"><span>+</span>
                </td>
                <td class="total">--</td>
            </tr>
            <tr class="cart_item">
                <th>
                    <input type="checkbox"  class="check_one">
                </th>
                <td class="img_wrap">
                    <img src="shoimg/10001.jpg" alt="">
                </td>
                <td>AD钙奶</td>
                <td class="goods_price">1.0</td>
                <td class="goods_num_wrap">
                    <span>-</span><input type="text" value="10" class="goods_num"><span>+</span>
                </td>
                <td class="total">--</td>
            </tr>
            <tr class="cart_item">
                <th>
                    <input type="checkbox"  class="check_one">
                </th>
                <td class="img_wrap">
                    <img src="shoimg/10003.jpg" alt="">
                </td>
                <td>可口可乐</td>
                <td class="goods_price">3.0</td>
                <td class="goods_num_wrap">
                    <span>-</span><input type="text" value="1" class="goods_num"><span>+</span>
                </td>
                <td class="total">--</td>
            </tr>
        </table>
    </div>
    <div class="settle_bar">
        <div class="check_all_wrap">
            <input type="checkbox"  class="check_all"/>&nbsp;全选
        </div>
        <span style="margin-left:100px">共<i class="checked_num"></i>&nbsp;件商品</span>
        <span style="margin-left:100px;">合计：<i class="total_money"></i>元</span>
        <input type="submit" value="结算" class="gwcbtn">
    </div>
</div>
</div>
<div style="position: absolute; left: 0;bottom: 0; width: 100%;">
    <font color="#fffafa"> 页面设计： © 2021 Chen.y.c_8002119338  </font>
</div>

</body>
</html>
