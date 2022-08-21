<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 17/08/2022
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        .login{
            height: 180px;
            width: 250px;
            margin: 0px;
            padding: 10px;
            border: 1px seagreen solid;
        }
        .login input{
            padding: 5px;
            margin: 5px;
        }
    </style>
</head>
<body>
<form action="/login" method="get">
    <div class="login">
        <h2>Login</h2>
        <input type="text" name="username" size="30" placeholder="username">
        <input type="password" name="password" size="30" placeholder="password">
        <input type="submit" value="Sign in">
    </div>
</form>

</body>
</html>
