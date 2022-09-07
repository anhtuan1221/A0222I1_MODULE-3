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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h1> EditProduct</h1>
<h2>
    <a href="/product">List All Users</a>
</h2>
</center>
<div align="center">
    <form method="post">
        <table class="table table-dark">
            <c:if test="${product != null}">
                <input type="hidden" name="id" value="<c:out value='${product.id}' />"/>
            </c:if>
            <tr>
                <th>Product Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${product.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Product price:</th>
                <td>
                    <input type="text" name="price" size="45"
                           value="<c:out value='${product.price}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Quantity:</th>
                <td>
                    <input type="number" name="quantity" size="15"
                           value="<c:out value='${product.quantity}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Product color:</th>
                <td>
                    <input type="text" name="color" size="15"
                           value="<c:out value='${product.color}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Describe :</th>
                <td>
                    <input type="text" name="describe" size="15"
                           value="<c:out value='${product.describe}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Category :</th>
                <td>
                    <select name="typeId" class="me-2">
                        <c:forEach items="${categoryList}" var="category">
                            <c:if test="${product.category_id == category.id}">
                                <option value="${category.id}" selected>${category.name}</option>
                            </c:if>
                        </c:forEach>

                        <c:forEach items="${categoryList}" var="category">
                            <c:if test="${product.category_id != category.id}">
                                <option value="${category.id}" selected>${category.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
