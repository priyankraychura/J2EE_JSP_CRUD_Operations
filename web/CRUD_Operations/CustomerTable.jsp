<%-- 
    Document   : CustomerTable
    Created on : 03-Aug-2024, 4:09:02 pm
    Author     : Priya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <title>Customer Data</title>
</head>
<body class="d-flex flex-column align-items-center">
    <%@include file="navbar.jsp" %>
    <div class="userTable mt-3 shadow-md rounded overflow-auto">
        <div class="box-header d-flex justify-content-between align-items-center mb-4">
            <h2 class="">Customer Data</h2>
            <a href="insert.jsp"><button class="btn btn-success btn-sm">Add New</button></a>
        </div>
        <table class="table table-secondary">
            <thead>
                <tr>
                    <th scope="col">#ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Number</th>
                    <th scope="col">Age</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody class="table-group-divider">
                <%
                    String sUser = (String) session.getAttribute("username");

                    if (sUser != null) {
                        String SQL;
                        PreparedStatement stmt;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
                            Connection conn = DriverManager.getConnection(DB_URL, "root", "");

                            if (request.getMethod().equals("POST")) {
                                String search = request.getParameter("search");
                                SQL = "SELECT * FROM customers_jsp WHERE name LIKE ? OR number LIKE ?";

                                stmt = conn.prepareStatement(SQL);

                                stmt.setString(1, "%" + search + "%");
                                stmt.setString(2, "%" + search + "%");
//                            stmt.setInt(3, Integer.parseInt(search));
                            } else {
                                SQL = "SELECT * FROM customers_jsp";
                                stmt = conn.prepareStatement(SQL);
                            }

                            ResultSet rs = stmt.executeQuery();

                            while (rs.next()) {
                %>
                <tr>
                    <th scope="row"><%= rs.getInt("id")%></th>
                    <td><%= rs.getString("name")%></td>
                    <td><%= rs.getString("number")%></td>
                    <td><%= rs.getInt("age")%></td>
                    <td>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#<%= rs.getInt("id")%>">
                            Delete
                        </button>
                        <a href="edit.jsp?id=<%= rs.getInt("id")%>"><button class="btn btn-primary btn-sm text-light">Edit</button></a>

                        <!-- Modal -->
                        <div class="modal fade" id="<%= rs.getInt("id")%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Confirmation!</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to delete user "<%= rs.getString("name")%>"?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <a href="delete.jsp?id=<%= rs.getInt("id")%>"><button class="btn btn-danger text-light">Delete</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <%
                            }

                            rs.close();
                            stmt.close();
                            conn.close();

                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    } else {
                        response.sendRedirect("login.jsp?isValid=false");
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>