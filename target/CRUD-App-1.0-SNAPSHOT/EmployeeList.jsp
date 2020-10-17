<%--
  Created by IntelliJ IDEA.
  User: Chiran
  Date: 10/5/2020
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--xmlns:c="http://java.sun.com/jsp/jstl/core"--%>
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
            <li class="nav-item">
                <a class="nav-link" href="/CRUD_App_war_exploded">Add New Employee</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/CRUD_App_war_exploded/list">Employee List  <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">About Us </a>
            </li>

        </ul>
    </div>
</nav>

<div class="text-center container" style="padding-top:40px;">
    <div class="text-center">
        <h1> Employee Management CRUD App with JSP, Servlets </h1>
    </div>
    <hr>
    <h3><b> List of Employees </b></h3>
    <br>
    <table border="1"  class="table" style="width:100%;">
        <tr style="color:darkgreen; font-weight:bold;">
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Address</th>
            <th>Mobile No</th>
            <th>ACTION</th>
        </tr>
        <c:forEach var='employee' items="${listEmployee}">

            <tr>
                <form action="edit" method="get">
                    <td><c:out value="${employee.empId}"/>
                        <input type="hidden" value='<c:out value="${employee.empId}"/>' name="empId">
                    </td>
                    <td><input name="firstName" value='<c:out value="${employee.firstName}"/>'></td>
                    <td><input name="lastName" value='<c:out value="${employee.lastName}"/>'></td>
                    <td><input name="address" value='<c:out value="${employee.address}"/>'></td>
                    <td><input name="age" value='<c:out value="${employee.age}"/>'></td>
                    <td><input name="mobileNo" value='<c:out value="${employee.mobileNo}"/>'></td>
                    <td>
                        <button type="submit" class="btn btn-warning">Edit Employee</button>
                        <a href="delete?id=<c:out value='${employee.empId}' />" type="button" class="btn btn-danger">Remove</a>
                    </td>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
