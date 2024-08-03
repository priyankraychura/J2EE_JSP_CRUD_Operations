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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <title>Customer Data</title>
    <style>
        body{
            width: 100%;
            height: 100vh;
        }
        .userTable{
            width: 80%;
            height: 650px;
            padding: 50px;
            /*border: 1px solid black;*/
            background-color: #E2E3E5;
        }
        /* width */
        .userTable::-webkit-scrollbar {
            width: 10px;
        }

        /* Track */
        .userTable::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 5px;
        }

        /* Handle */
        .userTable::-webkit-scrollbar-thumb {
            background: green;
            border-radius: 10px;
        }

        /* Handle on hover */
        .userTable::-webkit-scrollbar-thumb:hover {
            background: #b30000;
        }
    </style>
</head>
<body class="d-flex justify-content-center">
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
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
                        Connection conn = DriverManager.getConnection(DB_URL, "root", "");

                        String SQL = "SELECT * FROM customers_jsp";

                        PreparedStatement stmt = conn.prepareStatement(SQL);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <th scope="row"><%= rs.getInt("id")%></th>
                    <td><%= rs.getString("name")%></td>
                    <td><%= rs.getString("number")%></td>
                    <td><%= rs.getInt("age")%></td>
                    <td>
                        <a href="delete.jsp?id=<%= rs.getInt("id")%>"><button class="btn btn-danger btn-sm text-light">Delete</button></a>
                        <a href="edit.jsp?id=<%= rs.getInt("id")%>"><button class="btn btn-primary btn-sm text-light">Edit</button></a>
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
                %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>