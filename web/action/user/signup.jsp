<%-- 
    Document   : signup
    Created on : Dec 24, 2016, 6:30:20 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.UserDao"%>
<jsp:useBean id="user" class="Model.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
UserDao userDao = new UserDao();
int status = userDao.save(user);
if (status != 0) {
    session.setAttribute("session","1");
    session.setAttribute("iduser", user.getIduser());
    session.setAttribute("nama", user.getNama());
    
    response.sendRedirect("../../index.jsp?folder=halaman&file=home");
} else {
    session.setAttribute("signupError", "1");
    response.sendRedirect("../../");
}
%>