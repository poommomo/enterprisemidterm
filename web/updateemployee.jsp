<%--
  Created by IntelliJ IDEA.
  User: Momo
  Date: 4/10/2018 AD
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sql:query dataSource="jdbc/employees" var="result">
    SELECT * FROM employees where emp_no = ?
    <sql:param value="${param.id}"/>
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Employee <c:out value="${param.id}"/></h1>
<c:forEach var="p" items="${result.rows}">

    <div class="container">
        <h1>Add New Employee</h1>

        <form class="form-horizontal" action="employee">

            <input type="hidden" name="cmd" value='u'/>
            <input type="hidden" name="emp_no" value='<c:out value="${p.emp_no}"/>'/>

            <div class="form-group">
                <label class="control-label col-sm-2" for="firstname">First Name:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="firstname" name="firstname" value='<c:out value="${p.first_name}"/>'>
                    <%--<input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter First Name">--%>
                </div>
            </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="lastname">Last Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="lastname" name="lastname" value='<c:out value="${p.last_name}"/>'>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="gender" onselect='<c:out value="${p.gender}"/>'>Gender:</label>

                    <select class="col-sm-10" id="gender" name="gender">
                        <option value="M">Male</option>
                        <option value="F">Female</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="birthdate">First Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="birthdate" name="birthdate" value='<c:out value="${p.birth_date}"/>'>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="hiredate">Hired Date:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="hiredate" name="hiredate" value='<c:out value="${p.hire_date}"/>'>
                    </div>
                </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>

        </form>

    </div>

</c:forEach>

</body>
</html>