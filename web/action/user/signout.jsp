<%-- 
    Document   : signout
    Created on : Dec 24, 2016, 7:28:16 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%
    session.removeAttribute("session");
    response.sendRedirect("../../");
%>
