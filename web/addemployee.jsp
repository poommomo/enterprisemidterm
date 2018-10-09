<%--
  Created by IntelliJ IDEA.
  User: Momo
  Date: 4/10/2018 AD
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Employees</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <h1>Add New Employee</h1>

    <form class="form-horizontal" action="employee">

        <div class="form-group">
            <label class="control-label col-sm-2" for="empno">Employee Number:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="empno" name="empno" placeholder="Enter Employee Number">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="firstname">First Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter First Name">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="lastname">Last Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter Last Name">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="birthdate">Birthday:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="birthdate" name="birthdate" placeholder="Enter Birth Date (dd/mm/yyyy)">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="hiredate">Hire Date:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="hiredate" name="hiredate" placeholder="Enter Hire Date (dd/mm/yyyy)">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="gender">Gender:</label>

            <select class="col-sm-10" id="gender" name="gender">
                <option value="M">Male</option>
                <option value="F">Female</option>
            </select>
            <%--<select class="col-sm-10" id="category" name="category">--%>
            <%--<option value="1">1</option>--%>
            <%--<option value="2">2</option>--%>
            <%--<option value="3">3</option>--%>
            <%--<option value="4">4</option>--%>
            <%--</select>--%>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
        </div>

    </form>

</div>
</body>
