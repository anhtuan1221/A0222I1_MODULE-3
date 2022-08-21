<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 19/08/2022
  Time: 09:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="practice_1.css">
</head>
<body>
<div class="login"></div>
<h2>Currency Converter</h2>
<form action="converter.jsp" method="get">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type="submit" id="submit" value="Converter"/>
</form>
</div>
</body>
</html>
