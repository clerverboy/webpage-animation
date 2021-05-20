<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <link rel="stylesheet" href="css/register.css">
    <script type="text/javascript">
        function checkUserName(){
            console.log($("#userName").val());
            $.post({
                url:"${pageContext.request.contextPath}/checkUserName",
                data:{"username":$("#userName").val()},
                success:function (data) {
                    if(data == "用户名已存在"){
                        document.getElementById("userNameSpan").innerHTML = data;
                        console.log(data);
                    }else{
                        document.getElementById("userNameSpan").innerHTML = "";
                    }

                }
            })
        }
        function checkPassword(){
            var fPassword = document.getElementById("firstPassword").value;
            var sPassword = document.getElementById("secondPassword").value;
            if(fPassword == sPassword){
                document.getElementById("checkPassword").innerHTML = ""
                console.log("密码一致")
            }else{
                document.getElementById("checkPassword").innerHTML = "密码不一致"
                console.log("密码不一致")
            }
        }
    </script>
    <style>
        #bigBox .inputBox .inputText{
            width: 400px;
        }
        #bigBox .inputBox .inputText input{
            width: 280px;
            float: left;
        }
        #bigBox .inputBox .inputText span{
            margin-top: 10px;
            width: 100px;
            color: red;
            float: right;
        }
    </style>
</head>
<body>

<div id="bigBox">
    <h1>注册</h1>

    <div class="inputBox">
        <form action="${pageContext.request.contextPath}/regist" method="post">
            <div class="inputText">
                <input type="text" required id="userName" name="username" onblur="checkUserName()" placeholder="Username"><span id="userNameSpan"></span><br>
                <input type="password" required id="firstPassword" name="pwd" placeholder="Password"><br>
                <input type="password" required id="secondPassword" onblur="checkPassword()" placeholder="affirm password"><span id="checkPassword"></span><br>
                <input type="text" required name="name" placeholder="name"><br>
                <input type="text" required name="pnum" placeholder="phoneNumber"><br>
                <input type="text" required name="address" placeholder="address"><br>
            </div>
            <input type="submit" class="inputButton" value="REGIST">
        </form>
    </div>
</div>

<script src="/js/jquery-3.6.0.js"></script>
</body>
</html>
