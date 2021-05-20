<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>BiuBiu奶茶</title>
  <link rel="stylesheet" href="/css/index.css?v=${Math.random()}">
  <link rel="stylesheet" href="/css/swiper.css?v=${Math.random()}">
  <script type="text/javascript">
    function a(name,uid) {
      console.log("click")
      $.post({
        url:"${pageContext.request.contextPath}/addMilk",
        data:{"name":name,"uid":uid},
        success:function (data) {
          document.getElementById("tipDiv").style.display = "block";
          document.getElementById("tipText").innerHTML = data;
          setTimeout(hidden,1000);
        }
      })
    }
    function hidden(){
      document.getElementById("tipDiv").style.display="none";
    }
  </script>
</head>
<body>
<div style="position: fixed;top: 50%;left: 50%;z-index: 100;height: 50px;width: 200px;display: none" id="tipDiv">
  <div style="float: left;height: 50px;width: 50px;margin-right: 20px;"><img height="48" width="48" src="images/success.png"></div>
  <div style="float: right;height: 50px;width: 130px;line-height: 50px"><span style="font-size: 30px;letter-spacing: 2px;color: #4FB59D" id="tipText"></span></div>
</div>
<!-- 页面的顶部 -->
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
        <li><span>欢迎您！${userNameInfo}</span></li>
        <li><a href="${pageContext.request.contextPath}/toIndex">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/toInfo">个人中心</a></li>
        <!-- 在购物车前面添加一个购物车的图标 -->
        <li class="shop_car"><span></span><a href="${pageContext.request.contextPath}/toShopCar">购物车</a></li>
        <li class="exit"><a href="${pageContext.request.contextPath}/exit">退出登录</a></li>
      </C:if>
      <C:if test="${empty userNameInfo}">
        <li><a href="${pageContext.request.contextPath}/toLogin">登录</a></li>
        <li class="register"><a href="${pageContext.request.contextPath}/toRegist">注册</a></li>
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

<!-- 页面的banner部分,滚动栏 -->
<div id="banner">
  <!-- <div class="container">
    <ul id="lunbo">
      <li><img src="images/banner1.jpg"></li>
      <li><img src="images/banner2.jpg"></li>
      <li><img src="images/banner3.jpg"></li>
      <li><img src="images/banner4.jpg"></li>
    </ul>
  </div>  -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="images/banner1.jpg" width="100%;" height="630"></div>
      <div class="swiper-slide"><img src="images/banner2.jpg" width="100%;" height="630"></div>
      <div class="swiper-slide"><img src="images/banner3.jpg" width="100%;" height="630"></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
  <div class="banner-nav-bg"></div>
</div>

<!-- 页面的明星机型部分 -->
<div id="star">
  <div class="container">
    <div class="star_top">
      <img src="images/top1.jpg"></img>
    </div>
    <ul>
      <li>
        <div>
          <img src="images/cha1.jpg">
        </div>
        <h2>百香果奶茶</h2>
        <p>test1</p>
        <p class="money" style="cursor: pointer" onclick="a('百香果奶茶',${userIdInfo})">&yen;10 立即购买</p>
      </li>
      <li class="line"></li>
      <li>
        <div>
          <img src="images/cha2.jpg">
        </div>
        <h2>柠檬水</h2>
        <p>test1</p>
        <p class="money" style="cursor: pointer" onclick="a('柠檬水',${userIdInfo});">&yen;10 立即购买</p>
      </li>
      <li class="line"></li>
      <li>
        <div>
          <img src="images/cha3.jpg">
        </div>
        <h2>奥利奥奶茶</h2>
        <p>test1</p>
        <p class="money" style="cursor: pointer" onclick="a('奥利奥奶茶',${userIdInfo})">&yen;10 立即购买</p>
      </li>
      <li class="line"></li>
      <li>
        <div>
          <img src="images/cha4.jpg">
        </div>
        <h2>珍珠奶茶</h2>
        <p>test1</p>
        <p class="money" style="cursor: pointer" onclick="a('珍珠奶茶',${userIdInfo})">&yen;10 立即购买</p>
      </li>
    </ul>
  </div>
</div>

<!-- 页面精选部分 -->
<div id="accessory">
  <div class="container">
    <div class="acc_top">
      <img src="images/top2.jpg"></img>
    </div>
    <div class="acc_main">
      <div class="acc_left left">
        <div>
          <img class="l1" src="images/summer3.jpg" onclick="a('柠檬香草',${userIdInfo})">
        </div>
        <div class="acc_all">
          <p>夏日畅销榜</p>
          <ul>
            <li>柠檬水</li>
            <li>青柠汽水</li>
            <li>黄瓜汽水</li>
            <li>草莓冰激凌</li>
            <li>抹茶冰激凌</li>
            <li>原味冰激凌</li>
          </ul>
          <h2 class="line"></h2>
          <p class="acc">冰饮系列<span></span></p>
        </div>
        <div>
          <img class="l2" src="images/summer4.jpg" onclick="a('橙汁',${userIdInfo})">
        </div>
        <div>
          <img class="l3" src="images/summer2.jpg" onclick="a('青柠汽水',${userIdInfo})">
        </div>
      </div>
      <div class="acc_right right">
        <div><img class="r1" src="images/summer1.jpg" onclick="a('黄桃冰激凌',${userIdInfo})"></div>
        <div><img class="r2" src="images/summer5.jpg" onclick="a('草莓冰激凌',${userIdInfo})"></div>
        <div><img class="r3" src="images/summer6.jpg" onclick="a('抹茶冰激凌',${userIdInfo})"></div>
        <div><img class="r4" src="images/summer7.jpg" onclick="a('原味冰激凌',${userIdInfo})"></div>
      </div>
    </div>
  </div>
</div>

<!-- 页面的搜索OPPO部分 -->
<div id="world">
  <div class="container">
    <div class="world_top">
      <img class="spanTest" src="images/top3.jpg"></img>
    </div>
    <div class="world_main">
      <div class="world_left left">
        <div><img src="images/xidian1.jpg" onclick="a('巧克力蛋糕',${userIdInfo})"></div>
        <div><img src="images/xidian2.jpg" onclick="a('草莓蛋糕',${userIdInfo})"></div>
        <div><img src="images/xidian3.jpg" onclick="a('百味小蛋糕',${userIdInfo})"></div>
        <div><img src="images/xidian4.jpg" onclick="a('巧克力曲奇',${userIdInfo})"></div>
      </div>
      <div class="world_right right">
        <div class="world_title">
          <div class="news">新闻</div>
          <div class="weibo">微博</div>
        </div>
        <ul>
          <li>
            <dl>
              <dt>
                <img src="images/news1.jpg">
              </dt>
              <dd>test</dd>
            </dl>
          </li>
          <li>
            <dl>
              <dt>
                <img src="images/news2.jpg">
              </dt>
              <dd>test</dd>
            </dl>
          </li>
          <li>
            <dl>
              <dt>
                <img src="images/news3.jpg">
              </dt>
              <dd>test</dd>
            </dl>
          </li>
          <li>
            <dl>
              <dt>
                <img src="images/news4.jpg">
              </dt>
              <dd>test</dd>
            </dl>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>

<!-- 页面的服务部分 -->
<div id="serve">
  <div class="container">
    <ul>
      <li>
        <dl>
          <dt></dt>
          <dd class="dd1">正品保障</dd>
          <dd class="dd2">所有的商品都无添加剂</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dt></dt>
          <dd class="dd1">正品保障</dd>
          <dd class="dd2">所有的商品都无添加剂</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dt></dt>
          <dd class="dd1">正品保障</dd>
          <dd class="dd2">所有的商品都无添加剂</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dt></dt>
          <dd class="dd1">正品保障</dd>
          <dd class="dd2">所有的商品都无添加剂</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dt></dt>
          <dd class="dd1">正品保障</dd>
          <dd class="dd2">所有的商品都无添加剂</dd>
        </dl>
      </li>
    </ul>
  </div>
</div>

<!-- 页面的售后服务部分 -->
<div id="after_sale">
  <div class="container">
    <ul>
      <li>
        <ol>
          <li><a href="#">关于我们</a></li>
          <li><a href="#">关于biubiu</a></li>
          <li><a href="#">新闻中心</a></li>
        </ol>
      </li>
      <li>
        <ol>
          <li><a href="#">关于我们</a></li>
          <li><a href="#">关于biubiu</a></li>
          <li><a href="#">新闻中心</a></li>
        </ol>
      </li>
      <li>
        <ol>
          <li><a href="#">关于我们</a></li>
          <li><a href="#">关于biubiu</a></li>
          <li><a href="#">新闻中心</a></li>
        </ol>
      </li>
      <li>
        <ol>
          <li><a href="#">关于我们</a></li>
          <li><a href="#">关于biubiu</a></li>
          <li><a href="#">新闻中心</a></li>
        </ol>
      </li>
      <li>
        <ol>
          <li><span class="xl"></span><a href="#">新浪微博</a></li>
          <li><span class="xl"></span><a href="#">腾讯微博</a></li>
          <li><span class="xl"></span><a href="#">人人网</a></li>
          <li><span class="xl"></span><a href="#">QQ空间</a></li>
        </ol>
      </li>
      <li>
        <ol>
          <li><a href="#">关于我们</a></li>
          <li><a href="#">关于biubiu</a></li>
          <li><a href="#">新闻中心</a></li>
        </ol>
      </li>
    </ul>
  </div>
</div>
<!-- 页面的底部 -->
<div id="footer">
  <div class="container">
    <p>
      <img src="images/p6.jpg" width="100" height="16">
      <span>@2021 武汉市xxxxxxx</span>
      <a href="#">版权说明</a>
      <a href="#">版权说明</a>
      <a href="#">版权说明</a>
      <a href="#">版权说明</a>
      <a href="#">版权说明</a>
    </p>
  </div>
</div>
<!-- <script src="js/lunbo.js"></script> -->
<%--<script src="/js/index.js"></script>--%>
<script src="/js/swiper.js"></script>
<script src="/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  var swiper = new Swiper('.swiper-container', {
    pagination: '.swiper-pagination',
    paginationClickable: true,
    loop: true,
    autoplay: 3000,


    speed: 1000,
    prevButton: '.swiper-button-prev',
    nextButton: '.swiper-button-next',
    effect: 'fade',//  effect: 'flip',effect: 'coverflow',slide', 'fade',cube
    grabCursor: true,
    cube: {
      shadow: false,
      slideShadows: false,
      shadowOffset: 20,
      shadowScale: 0.94
    }
  });

  window.onload = function(){
      var nav = document.getElementById("nav");
      var header = document.getElementById("header");
      headerTop = header.offsetTop;

  }

  window.onscroll = function(){
    var backTop = document.documentElement.scrollTop || document.body.scrollTop

    if(backTop >= headerTop){
      nav.style.position = "fixed";
      nav.style.top = "30";
      nav.style.left = "0";
      nav.style.zIndex = "100";
      header.style.position = "fixed";
      header.style.top = "0";
      header.style.left = "0";
      header.style.zIndex = "100";
    } else {
      nav.style.position = "";
      header.style.position = "";
    }
  }

  function playAndPause(){
      var music = document.getElementById("bgm");
      var navLiImg = document.getElementById("navLiImg");
      if(music.paused){
          music.play();
          navLiImg.classList.add("navMusic");
      }else{
          music.pause();
          navLiImg.classList.remove("navMusic");
      }
  }

</script>
</body>
</html>
