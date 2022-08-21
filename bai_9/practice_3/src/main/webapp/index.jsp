<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 17/08/2022
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="practice_3.css">
</head>
<body>
<h2>Currency Converter</h2>
<form action="/convert" method="get">
    <div class="login">
        <label> Rate: </label><br>
        <input type="text" name="rate" placeholder="RATE" value="22000">
        <label> USA : </label>
        <input type="text" name="usd" placeholder="USD" value="0"><br>
        <input type="submit" id="submit" value="Converter"/>
    </div>
</form>
</body>
</html>
