<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 05/09/2022
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <%--    jquery--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%--    table data--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">

    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
</head>
<body>
<div>
    <h1 class="font-text-footer" style="color: black"> Product List</h1>

    <c:if test="${mess !=null}">
        <h2 class="text-danger">${mess}</h2>
    </c:if>
    <c:if test="${message !=null}">
        <h2 class="text-danger">${message}</h2>
    </c:if>
    <%--        ++++++++++++++++++form search++++++++++++++--%>
    <div class="container d-flex flex-row justify-content-between">
        <div class="col-sm-4">
            <p><a href="/product?action=create">Create new product</a></p>
        </div>
        <form action="/product" method="get" class="d-flex ">
            <div class="input-group mb-3">
                <input class="ms-2" name="nameSearch" placeholder="Nhập tên product"
                       value="${nameSearch}">
                <button class="btn btn-success" type="submit" name="action" value="search">Search</button>
            </div>
        </form>
    </div>

</div>
<table id="jqueryTable" class="table table-dark">
    <thead>
    <tr>
        <th>#</th>
        <th>Product name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Color</th>
        <th>Category</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.quantity}</td>
            <td>${product.color}</td>
            <c:forEach items="${categoryList}" var="category">
                <c:if test="${product.category_id == category.id}">
                    <td>${category.name}</td>
                </c:if>
            </c:forEach>
            <td>
                <a href="/product?action=edit&id=${product.id}">
                    <button class="btn btn-primary">ShowEdit</button>
                </a>

                <!-- Button trigger modal -->
                <button type="button" onclick="showInfo('${product.id}','${product.name}')"
                        class="btn btn-danger"
                        data-bs-toggle="modal"
                        data-bs-target="#deleteModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

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

<script>
    $(document).ready(function () {
        $('#jqueryTable').DataTable({
            "pageLength": 5,
            lengthMenu: [
                [5, 10, 25, 50, -1],
                ['5 rows', '10 rows', '25 rows', '50 rows', 'Show all']
            ],
        });
    });

    function showInfo(id, value) {
        document.getElementById("idProduct").value = id;
        document.getElementById("idValueProduct").innerText = value;
    }
</script>
</body>
<%--<script src="template/bootstrap/jquery-3.6.0.min.js"></script>--%>
<%--<script src="template/bootstrap/js/bootstrap.js"></script>--%>
<script>

</script>
</html>
