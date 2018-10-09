package employee.Controller;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.DateFormat;


public class EmployeeServlet extends HttpServlet {

    public void init() throws ServletException {

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String empID = req.getParameter("id");
        String cmd = req.getParameter("cmd");

        String employeeNumber = req.getParameter("empno");
        String firstName = req.getParameter("firstname");
        String lastName = req.getParameter("lastname");
        String birthDate = req.getParameter("birthdate");
        String gender = req.getParameter("gender");
        String hireDate = req.getParameter("hiredate");


        Context envContext = null;
        String sql = "";

        try {
            envContext = new InitialContext();
            Context initContext = (Context) envContext.lookup("java:/comp/env");
            DataSource dataSource = (DataSource) initContext.lookup("jdbc/employees");
            Connection connection = dataSource.getConnection();

            if (cmd == null) {
                // CREATE
                sql = "insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date) values (?,?,?,?,?,?)";

                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, Integer.parseInt(employeeNumber));
                statement.setString(3, firstName);
                statement.setString(4, lastName);
                java.sql.Date finalBirthDate = convertDate(birthDate, "dd/MM/YYYY");
                java.sql.Date finalHireDate = convertDate(hireDate, "dd/MM/yyyy");

                statement.setDate(2, finalBirthDate);
                statement.setString(5, gender);
                statement.setDate(6, finalHireDate);
                statement.execute();
            } else if (cmd.equals("d") && empID != null) {
                // DELETE
                sql = "DELETE FROM employees WHERE emp_no = ?";
                PreparedStatement stmt=connection.prepareStatement(sql);
                stmt.setInt(1,Integer.parseInt(empID));
                stmt.execute();
            } else if (cmd.equals("u") && empID != null) {
                // UPDATE
                sql = "UPDATE employees SET birth_date = ?, first_name = ?, last_name = ?, gender = ?, hire_date = ? where emp_no = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(6, Integer.parseInt(empID));
                statement.setString(2, firstName);
                statement.setString(3, lastName);

                java.sql.Date finalBirthDate = convertDate(birthDate, "yyyy-MM-dd");
                java.sql.Date finalHireDate = convertDate(hireDate, "yyyy-MM-dd");

                statement.setDate(1, finalBirthDate);
                statement.setString(4, gender);
                statement.setDate(5, finalHireDate);

                statement.execute();
            }

            resp.sendRedirect("index.jsp");
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }

    private java.sql.Date convertDate(String date, String dateFormat) {

        DateFormat formatter = new SimpleDateFormat(dateFormat);
        Date current = new Date();
        java.sql.Date defaultDate = new java.sql.Date(current.getTime());
        java.sql.Date finalDate = defaultDate;

        try {
            Date input = formatter.parse(date);
            finalDate = new java.sql.Date(input.getTime());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return finalDate;
        }
    }
}
