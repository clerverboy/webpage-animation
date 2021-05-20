<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<div id="bigBox">
    <h1>登录</h1>
    <div class="inputBox">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="inputText">
                <h3>${msg}</h3>
                <input type="text" name="username" placeholder="Username"><br>
                <input type="password" name="pwd" placeholder="Password">
            </div>
            <input type="submit" class="inputButton" value="LOGIN">
        </form>
    </div>
</div>

</body>
</html>
