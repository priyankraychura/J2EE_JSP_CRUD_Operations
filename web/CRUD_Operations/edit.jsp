<%-- 
    Document   : edit
    Created on : 03-Aug-2024, 4:18:39 pm
    Author     : Priya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"
              <title></title>
    </head>
    <body>
        <%!
            int id;
            String name;
            String number;
            int age;
        %>
        <%
            if (request.getMethod().equals("GET")) {
                try {
                    int CusId = Integer.parseInt(request.getParameter("id"));
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
                    Connection conn = DriverManager.getConnection(DB_URL, "root", "");

                    String SQL = "SELECT * FROM customers_jsp WHERE id = ?";

                    PreparedStatement stmt = conn.prepareStatement(SQL);
                    stmt.setInt(1, CusId);

                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
                        id = rs.getInt("id");
                        name = rs.getString("name");
                        number = rs.getString("number");
                        age = rs.getInt("age");
                    }

                    rs.close();
                    stmt.close();
                    conn.close();

                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            } else {
                try {
                    int CusId = Integer.parseInt(request.getParameter("id"));
                    String name = request.getParameter("name");
                    String number = request.getParameter("number");
                    int age = Integer.parseInt(request.getParameter("age"));
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
                    Connection conn = DriverManager.getConnection(DB_URL, "root", "");

                    String SQL = "UPDATE customers_jsp SET name=?, number=?, age=? WHERE id = ?";

                    PreparedStatement stmt = conn.prepareStatement(SQL);
                    stmt.setString(1, name);
                    stmt.setString(2, number);
                    stmt.setInt(3, age);
                    stmt.setInt(4, CusId);

                    int updated = stmt.executeUpdate();

                    if (updated == 1) {
                        response.sendRedirect("CustomerTable.jsp");
                    }

                    stmt.close();
                    conn.close();

                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        %>

        <div class="container mt-4 w-50">
            <h3 class="my-4">Update</h3>
            <form method="POST" action="">
                <div class="row mb-3">
                    <span class="col-sm-2 input-group-text" id="basic-addon1">Id</span>
                    <div class="col-sm-10">
                        <input type="text" class="form-control w-50" name="id" value="<%= id %>" id="inputEmail3" disabled="true">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control w-50" name="name" value="<%= name%>" id="inputEmail3">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Number</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control w-50" name="number" value="<%= number%>" id="inputPassword3">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Age</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control w-50" name="age" value="<%= age%>" id="inputPassword3">
                    </div>
                </div>


                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</body>
</html>