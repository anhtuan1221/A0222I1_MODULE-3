<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 19/08/2022
  Time: 08:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="ex_1.css">
</head>
<body>
<div class="enter">
    <h2>Product Description</h2>
    <h3>Bàn phím cơ</h3>
    <form action="/input" method="get">
        <input type="text" name="price" value="100000">
        <input type="text" name="discount" placeholder="Discount Percent">
        <input type="submit" id="submit" value="Calculate Discount">
    </form>
</div>
</body>
</html>
