<%--
  Created by IntelliJ IDEA.
  User: Chiran
  Date: 10/5/2020
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Employee Management CRUD App with JSP and Servlets </title>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-success">
        <a class="navbar-brand" href="#">EmployeeMan</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/CRUD_App_war_exploded">Add New Employee <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CRUD_App_war_exploded/list">Employee List </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About Us </a>
                </li>

            </ul>
        </div>
    </nav>

    <div class="container" style="padding-top:40px;">
        <div class="text-center">
            <h1> Employee Management CRUD App with JSP, Servlets </h1>
        </div>
        <hr>
        <form action="add" method="post">
            <label>First Name</label>
            <input type="text"  class="form-control" name="firstName" id="firstName">
            <br>
            <label>Last Name</label>
            <input type="text" class="form-control" name="lastName" id="lastName">
            <br>
            <label>Age</label>
            <input type="number" class="form-control" name="age" id="age">
            <br>
            <label>Address</label>
            <input type="text" class="form-control" name="address" id="address">
            <br>
            <label>Mobile No</label>
            <input type="text" class="form-control" name="mobileNo" id="mobileNo">
            <br>
            <input type="submit"  class="btn btn-success" id="btnSubmit" value="Add Employee">
        </form>
    </div>
    </body>
</html>
