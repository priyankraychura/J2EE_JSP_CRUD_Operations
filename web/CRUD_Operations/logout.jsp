<%-- 
    Document   : logout.jsp
    Created on : 03-Aug-2024, 8:53:01 pm
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String sUser = (String) session.getAttribute("username");

            if (sUser != null) {
                session.removeAttribute(sUser);
                session.invalidate();
                
                response.sendRedirect("login.jsp");
            }


        %>
    </body>
</html>
