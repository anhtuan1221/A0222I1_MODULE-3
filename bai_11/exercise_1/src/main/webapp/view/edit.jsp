<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 24/08/2022
  Time: 16:14
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
<p>
    <c:if test='${requestScope["message"]!=null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product"> BACK TO LIST PRODUCT</a>
</p>
<br>
<form action="" method="post">
    <pre>Name:              <input type="text" name="name" placeholder="Edit name" value="${requestScope["products"].name}"> </pre>
    <pre>Price:             <input type="number" name="price" placeholder="Edit price" value="${requestScope["products"].price}"> </pre>
    <pre>Description:       <input type="text" name="description" placeholder="Edit " value="${requestScope["products"].description}"></pre>
    <pre>Manufacturer:      <input type="text" name="manufacturer" placeholder="Edit " value="${requestScope["products"].manufacturer}"></pre>
    <pre>                   <button type="submit">UPDATE</button></pre>
</form>
</body>
</html>
