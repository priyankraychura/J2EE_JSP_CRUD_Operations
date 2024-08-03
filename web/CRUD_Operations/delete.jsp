<%-- 
    Document   : delete
    Created on : 03-Aug-2024, 4:18:46 pm
    Author     : Priya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            try {
                int CusId =  Integer.parseInt(request.getParameter("id"));
                Class.forName("com.mysql.cj.jdbc.Driver");
                String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
                Connection conn = DriverManager.getConnection(DB_URL, "root", "");

                String SQL = "DELETE FROM customers_jsp WHERE id = ?";

                PreparedStatement stmt = conn.prepareStatement(SQL);
                stmt.setInt(1, CusId);

                stmt.executeUpdate();

                stmt.close();
                conn.close();
                
                response.sendRedirect("CustomerTable.jsp");
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        %>
    </body>
</html>