<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 05/09/2022
  Time: 18:45
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
<h1>CREATE NEW PRODUCT</h1>
<br>
<div class="container">
    <form action="/product?action=create" method="post">
        <div class="input-group mb-3">
            <span class="input-group-text">Name</span>
            <input required name="name" value="${product.name}" type="text" class="form-control me-2"
                   placeholder="Name">
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text">Price</span>
            <input required name="price" value="${product.price}" type="text" class="form-control me-2"
                   placeholder="Price">
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text">Quantity</span>
            <input required name="quantity" value="${product.quantity}" type="number"
                   class="form-control me-2"
                   placeholder="Quantity">
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text">Color</span>
            <input required name="color" value="${product.color}" type="text" class="form-control me-2"
                   placeholder="Color">
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text">Describe</span>
            <input required name="describe" value="${product.describe}" type="text"
                   class="form-control me-2"
                   placeholder="Describe">
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text">Type(*)</span>
            <select name="categoryId" class="me-2">
                <option value="">Chọn</option>
                <c:forEach items="${categoryList}" var="category">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>
        <br>
        <div class="input-group mb-5 d-flex align-content-center justify-content-center">
            <button type="submit" class="btn btn-primary">Create</button>
            <button type="button" class="btn btn-primary ms-3"><a style="text-decoration: none"
                                                                  class="text-light"
                                                                  href="/product">Back</a></button>
        </div>
    </form>
</div>
</center>
</div>
</body>
</html>
