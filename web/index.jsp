<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Products</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<sql:query dataSource="jdbc/employees" var="result">
    SELECT * FROM employees
    <%--WHERE category.id = product.category_id--%>
    <%--WHERE category.id = product.category_id and product.name like '%<%= request.getParameter("name")%>%'--%>
</sql:query>


<div class="container">
    <h1>Employees</h1>
    <br>
    <a href="addemployee.jsp">ADD NEW EMPLOYEE</a>
    <br>

    <table class="table table-striped">
        <tr>
            <th>Employee Number</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Birth Date</th>
            <th>Gender</th>
            <th>Hired Date</th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><c:out value="${row.emp_no}"/></td>
                <td><c:out value="${row.first_name}"/></td>
                <td><c:out value="${row.last_name}"/></td>
                <td><c:out value="${row.birth_date}"/></td>
                <td><c:out value="${row.gender}"/></td>
                <td><c:out value="${row.hire_date}"/></td>
                <td><button class="btn btn-warning" onclick="window.location='employee.jsp?id=<c:out value="${row.emp_no}"/>';">UPDATE</button></td>
                <td><button class="btn btn-danger" onclick="confirmDelete(<c:out value="${row.emp_no}"/>);">DELETE</button></td>
            </tr>
        </c:forEach>
    </table>

</div>


</body>
<script>
    function confirmDelete(id) {
        if (confirm('Are you sure?')) {
            window.location = "employee?cmd=d&id="+id;
        }
    }
</script>

</html>