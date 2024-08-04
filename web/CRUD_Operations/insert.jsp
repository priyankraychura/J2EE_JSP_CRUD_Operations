<%-- 
    Document   : insert
    Created on : 03-Aug-2024, 4:56:53 pm
    Author     : Priya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%
            String sUser = (String) session.getAttribute("username");
            if (sUser != null) {
                if (request.getMethod().equals("POST")) {
                    try {
                        String name = request.getParameter("name");
                        String number = request.getParameter("number");
                        int age = Integer.parseInt(request.getParameter("age"));
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
                        Connection conn = DriverManager.getConnection(DB_URL, "root", "");

                        String SQL = "INSERT INTO customers_jsp SET name=?, number=?, age=?";

                        PreparedStatement stmt = conn.prepareStatement(SQL);
                        stmt.setString(1, name);
                        stmt.setString(2, number);
                        stmt.setInt(3, age);

                        int inserted = stmt.executeUpdate();

                        if (inserted == 1) {
                            response.sendRedirect("CustomerTable.jsp");
                        }

                        stmt.close();
                        conn.close();

                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
            } else {
                response.sendRedirect("login.jsp?isValid=false");
            }
        %>
        <div class="container mt-4 w-50">
            <h3 class="my-4">Register Customer</h3>
            <form method="POST" action="">
                <div class="row mb-3">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control w-50" name="name" id="inputEmail3">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Number</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control w-50" name="number" id="inputPassword3">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Age</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control w-50" name="age" id="inputPassword3">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <a href="CustomerTable.jsp"><button type="button" class="btn btn-danger">Cancel</button></a>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
