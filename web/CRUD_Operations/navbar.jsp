<%-- 
    Document   : navbar
    Created on : 03-Aug-2024, 9:35:47 pm
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String sUser; %>
<% sUser = (String) session.getAttribute("username"); %>
<nav class="navbar bg-body-tertiary w-100">
    <div class="container-fluid">
        <a class="navbar-brand">Welcome <%= sUser %></a>
        <form class="d-flex" role="search" action="" method="POST">
            <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success me-2" type="submit">Search</button>
            <a href="logout.jsp"><button class="btn btn-danger" type="button">Logout</button></a>
        </form>
    </div>
</nav>