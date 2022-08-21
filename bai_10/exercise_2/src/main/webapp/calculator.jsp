<%--
  Created by IntelliJ IDEA.
  User: anhtuannguyen
  Date: 19/08/2022
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="ex_2.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Simple Calculator</h1>
<div class="login">
    <div><h1>Calculator</h1></div>
    <form action="/calculator" method="post">
        <div class="row">
            <div class="col-5"><h5>First operand :</h5></div>
            <div class="col-7"><input type="text" name="first-operand"></div>
        </div>
        <div class="row">
            <div class="col-5"><h5>Operator :</h5></div>
            <div class="col-7">
                <select class="form-select" aria-label="Default select example" name="operator">
                    <option selected value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-5"><h5>Second operand :</h5></div>
            <div class="col-7"><input type="text" name="second-operand"></div>
        </div>
        <div class="button">
            <button type="submit" class="btn btn-primary" value="">Calculate</button>
        </div>
    </form>
</div>
</body>
</html>
