<%-- 
    Document   : baca
    Created on : Dec 25, 2016, 3:14:43 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.NotifDao"%>
<%
String idpost = request.getParameter("idpost").toString();
int idnotif = Integer.parseInt(request.getParameter("idnotif").toString());
NotifDao notifDao = new NotifDao();
notifDao.subNotif(idnotif);
response.sendRedirect("../../index.jsp?folder=halaman&file=komentar&idpost="+idpost);
%>