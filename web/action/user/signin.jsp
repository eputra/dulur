<%-- 
    Document   : login
    Created on : Dec 24, 2016, 7:01:23 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.UserDao, Model.User"%>
<jsp:useBean id="u" class="Model.User"/>
<jsp:setProperty property="*" name="u"/>
<%
UserDao uDao = new UserDao();
int stat = uDao.cekById(u.getIduser());
if(stat != 0) {
    UserDao userDao = new UserDao();
    boolean status = userDao.validate(u);
    if(status) {
        User user = new User();
        user = userDao.getById(u.getIduser());

        session.setAttribute("session","1");
        session.setAttribute("iduser", user.getIduser());
        session.setAttribute("nama", user.getNama());

        response.sendRedirect("../../index.jsp?folder=halaman&file=home");
    } else {
        session.setAttribute("signinErrPass","1");
        response.sendRedirect("../../");
    }
} else {
    session.setAttribute("signinErrId","1");
    response.sendRedirect("../../");
}
%>