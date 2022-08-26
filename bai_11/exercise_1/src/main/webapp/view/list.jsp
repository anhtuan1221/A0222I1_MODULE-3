<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 22/08/2022
  Time: 16:33
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
<div class="container">
    <h2 style="text-align: center">PRODUCT LIST</h2>
    <p><a href="/product?action=create">Create new product</a></p>
    <table class="table table-dark">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>DESCRIPTION</th>
            <th>MANUFACTURER</th>
            <th>EDIT</th>
            <th>DELETE</th>
        </tr>
        <c:forEach var="p" items="${productList}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.price}</td>
                <td>${p.description}</td>
                <td>${p.manufacturer}</td>
                <td>
                    <button type="button" class="btn btn-outline-primary">
                        <a href="/product?action=edit&id=${p.id}">UPDATE</a>
                    </button>
                </td>
                <td>
                        <%--                    <button type="button" onclick="deleteInfo('${student.id}','${student.name}')" class="btn btn-outline-primary">--%>
                        <%--                        <a href="/product?action=delete&id=${p.id}">DELETE</a>--%>
                        <%--                    </button>--%>
                    <button type="button" onclick="deleteInfo('${p.id}','${p.name}')" class="btn btn-danger"
                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="/product" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input hidden name="deleteId" id="deleteId">
                        <input hidden name="action" value="delete">
                        <span>Bạn có muốn xoá sản phẩm  </span><span id="deleteName"></span><span> Không?</span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">OK</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function deleteInfo(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>
</html>
