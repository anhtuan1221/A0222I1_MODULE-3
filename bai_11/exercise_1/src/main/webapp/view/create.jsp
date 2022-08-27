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
<h1>CREATE NEW PRODUCT</h1>
<br>
<a href="/product">BACK TO PRODUCT LIST</a>
<br>
<c:if test="${message!=null}">
    <p style="color: gold">${message}</p>
</c:if>
<form action="/product?action=create" method="post">
        <pre>Name:              <input type="text" name="name"> </pre>
        <pre>Price:             <input type="number" name="price"> </pre>
        <pre>Description:       <input type="text" name="description"/></pre>
        <pre>Manufacturer:      <input type="text" name="manufacturer"/></pre>
        <pre>                   <button>Save</button></pre>
</form>
</body>
</html>
