<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>结算页面</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }

        body{
            background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
        }
        ul{
            list-style-type: none;
        }
        a{
            color: #666;
            text-decoration: none;
        }
        .left{
            float: left;
        }
        .right{
            float: right;
        }

        #top{
            height: 5px;
            width: 100%;
            background-color: #00925f;
        }
        #header{
            width: 100%;
            height: 30px;
            background-color: #2d2d2d;
        }
        #header .qq{
            width: 20px;
            height: 20px;
            background: url("/images/qq.png") no-repeat;
        }
        #header .tel{
            color: #17935f;
        }
        #header .header_left div{
            float: left;
            margin: 5px 10px 0px;
        }
        #header ul li{
            float: left;
            line-height: 30px;
        }
        #header li a{
            color: #b2b2b2;
            font-size: 14px;
            border-right: 1px solid #b2b2b2;
            padding: 0px 15px;
        }
        #header li a:hover{
            color: #00925f;
        }
        #header li span{
            color: #feca57;
        }
        #header .register a{
            border: none;
        }
        #header .exit a{
            border: none;
        }
        #header .shop_car a{
            /*border: none;*/
            padding-left: 8px;
        }
        #header .shop_car span{
            width: 20px;
            height: 20px;
            display: inline-block;
            vertical-align: middle;
            margin-left: 10px;
            background: url("/images/shop-car.png") no-repeat;
        }
        #nav{
            height: 90px;
            width: 100%;
            background-color: #EEEEEE;
        }
        #nav .left div{
            float: left;
            height: 90px;
        }
        #nav .left .logo img{
            margin-top: 5px;
            width: 100px;
            height: 80px;
        }
        #nav .left .logoText span{
            margin: auto 10px;
            line-height: 90px;
            font-size: 30px;
            color: transparent;
            background-color: #00925F;
            text-shadow : rgba(255,255,255,0.5) 0 5px 6px, rgba(255,255,255,0.2) 1px 3px 3px;
            -webkit-background-clip: text;
        }

        #nav li{
            float: left;
            margin: 0px 15px;
            line-height: 90px;
        }
        #nav li .navMusic{
            animation-name: rotate;
            animation-duration: 2s;
            animation-iteration-count: infinite;
        }
        @keyframes rotate{
            0% {transform: rotate(0deg);}
            100% {transform: rotate(360deg);}
        }
        #nav li img:hover{
            transform: scale(1.5);
        }
        #nav li a{
            color: #666666;
            font-weight: bold;
        }
        #nav li a:hover{
            color: #00925f;
        }
        .container{
            width: 1280px;
            margin: 0px auto;
            overflow: hidden;
        }
    </style>
</head>
<body>
<div id="top">
    <div class="container"></div>
</div>
<!-- 页面的头部 -->
<div id="header" style="width: 100%;">
    <div class="container">
        <div class="header_left left">
            <div class="qq"></div>
            <div class="tel">0000-000-000</div>
        </div>
        <ul class="right">
            <C:if test="${!empty userNameInfo}">
                <li><span style="font-size: 14px">欢迎您！${userNameInfo}</span></li>
                <li><a href="${pageContext.request.contextPath}/toIndex">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/toInfo">个人中心</a></li>
                <!-- 在购物车前面添加一个购物车的图标 -->
                <li class="shop_car"><span></span><a href="${pageContext.request.contextPath}/toShopCar">购物车</a></li>
                <li class="exit"><a href="${pageContext.request.contextPath}/exit">退出登录</a></li>
            </C:if>
        </ul>
    </div>
</div>

<!-- 页面的导航栏 -->
<div id="nav">
    <div class="container">
        <div class="left">
            <div class="logo">
                <img src="images/logo.jpg" alt="logo">
            </div>
            <div class="logoText">
                <span>biubiu奶茶甜点欢迎您</span>
            </div>
        </div>

        <ul class="right">
            <li><audio id="bgm" src="source/bgm.mp3" autoplay="autoplay" loop="loop"></audio><img id="navLiImg" class="navMusic" src="images/Music.png" onclick="playAndPause(this)"></li>
        </ul>
    </div>
</div>
<div style="position: fixed;top: 50%;left: 40%;z-index: 100;height: 50px;width: 600px;" id="tipDiv">
    <div style="float: left;height: 50px;width: 50px;margin-right: 20px;"><img height="48" width="48" src="images/success.png"></div>
    <div style="float: right;height: 50px;width: 530px;line-height: 50px"><span style="font-size: 30px;letter-spacing: 2px;color: #4FB59D" id="tipText">购物车已清空。。。请返回主页面</span></div>
</div>
</body>
</html>
