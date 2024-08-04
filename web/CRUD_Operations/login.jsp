<%-- 
    Document   : login
    Created on : 04-Aug-2024, 10:45:04 am
    Author     : Priya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="loginStyle.css" rel="stylesheet">
    </head>
    <body>
        <%
            if (request.getMethod().equals("POST")) {
                try {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    boolean valid = validateUser(username, password);

                    if (valid) {
                        session.setAttribute("username", username);

                        Cookie cookie = new Cookie("SESSIONid", session.getId());
                        response.addCookie(cookie);

                        response.sendRedirect("CustomerTable.jsp?sessionid=" + session.getId());
                    } else {
        %>
        <div class="alert alert-danger alert-dismissible fade show position-absolute top-0 start-0 m-4" role="alert">
            Login Failed! Invalid username or password!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        %>

        <%!
            private boolean validateUser(String username, String password) throws SQLException {
                boolean status = false;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
                    Connection conn = DriverManager.getConnection(DB_URL, "root", "");

                    String SQL = "SELECT * FROM users WHERE username = ? AND password = ?";
                    PreparedStatement stmt = conn.prepareStatement(SQL);

                    stmt.setString(1, username);
                    stmt.setString(2, password);

                    ResultSet rs = stmt.executeQuery();
                    status = rs.next();

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (ClassNotFoundException ex) {
                    ex.printStackTrace();
                }

                return status;
            }
        %>
        <div class="wrapper"> </div>
        <div class="con-0">
            <h3>Welcome Back...</h3>
            <form action="" method="POST">

                <div class="form-floating mb-3">
                    <input type="text" class="form-control shadow-none" id="floatingInput" placeholder="Username" name="username">
                    <label for="floatingInput" autocomplete="off">Username</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control shadow-none" id="floatingPassword" placeholder="Password" name="password">
                    <label for="floatingPassword" autocomplete="off">Password</label>
                </div>
                <button type="submit"/>Submit</button>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
