<%-- 
    Document   : index
    Created on : Dec 23, 2016, 7:58:08 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dulur</title>
        <link rel="icon" href="assets/images/dulur.png" type="image/x-icon">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/dulur.css" rel="stylesheet">
        <link href="assets/css/sweetalert.css" rel="stylesheet">
    </head>
    <body>
    <%
    if(session.getAttribute("session") == null) {
        %>
        <jsp:include page="halaman/depan.jsp"/>
        <%
    } else {
        %>
        <jsp:include page="material/menu.jsp"/>
        <%
        if(request.getParameter("folder") != null) {
            String dataFile = request.getParameter("folder")+"/"+request.getParameter("file")+".jsp";
            File file = new File(request.getServletContext().getRealPath(dataFile));
            if(file.exists()) {
                %>
                <jsp:include page="<%=dataFile%>"/>
                <%
            } else {
                %>
                <jsp:include page="halaman/home.jsp"/>
                <%
            }
        } else {
           %>
            <jsp:include page="halaman/home.jsp"/>
            <% 
        }
    }
    %>
    <footer class="footer">
        <p>&copy; 2017 Dulur, Inc.</p>
    </footer>
    
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/validator.min.js"></script>
    <script src="assets/js/sweetalert.min.js"></script>
    <script src="assets/js/alert.js"></script>
    <jsp:include page="material/alertIndex.jsp"/>
    </body>
</html>