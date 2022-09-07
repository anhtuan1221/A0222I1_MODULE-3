<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 07/09/2022
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>ProductList</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<div>
    <h1>Product List</h1>
    <c:if test="${mess !=null}">
        <h2 class="text-danger">${mess}</h2>
    </c:if>
    <c:if test="${message !=null}">
        <h2 class="text-danger">${message}</h2>
    </c:if>
</div>
<div>
    <table class="table table-dark">
        <tr>
            <th>#</th>
            <th>Product name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Color</th>
            <th>Category</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${productList}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.color}</td>
                <c:forEach items="${categoryList}" var="category">
                    <c:if test="${product.category_id==category.id}">
                        <td>${category.name}</td>
                    </c:if>
                </c:forEach>
                <td>
                    <a href="/product?action=edit&id=${product.id}" class="edit" title="Edit" data-toggle="tooltip">
                        <i class="material-icons">&#xE254;</i>
                    </a>
                    <a class="delete" title="Delete" data-toggle="tooltip"
                       onclick="show('${product.id}','${product.name}')"
                       data-bs-toggle="modal"
                       data-bs-target="#deleteModal">
                        <i class="material-icons">&#xE872;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <!--Modal delete-->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <%--            ---------thêm thẻ form---------%>
            <form action="/product" method="get">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-danger" id="exampleModalLabel">Xác nhận xoá !</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="text" hidden id="idProduct" name="idDelete">
                        <span>Bạn có muốn xóa Product </span>
                        <span class="text-danger" id="idValueProduct"></span><span> không?</span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="action" value="delete">Delele</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function show(id,value){
        document.getElementById("idProduct").value=id;
        document.getElementById("idValueProduct").innerText= value;
    }
</script>
</body>
</html>
