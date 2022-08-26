<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 22/08/2022
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<p><a href="/product"> BACK TO LIST PRODUCT</a></p>
<form action="" method="post">
    <table class="table table-dark">
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Manufacturer</th>
        </tr>
        <tr>
            <td>${products.name}</td>
            <td>${products.price}</td>
            <td>${products.description}</td>
            <td>${products.manufacturer}</td>
        </tr>
        <tr>
            <td>
                <button type="submit" class="btn btn-outline-secondary">Delete Product</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
