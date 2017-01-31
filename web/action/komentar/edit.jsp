<%-- 
    Document   : edit
    Created on : Dec 25, 2016, 8:23:52 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.KomentarDao"%>
<jsp:useBean id="k" class="Model.Komentar"></jsp:useBean>
<jsp:setProperty property="*" name="k"/>
<%
KomentarDao komDao = new KomentarDao();
int status = komDao.edit(k);
if (status != 0) {
    session.setAttribute("editComSuc", "Komentar berhasil diedit.");
} else {
    session.setAttribute("editComErr", "Komentar gagal diedit.");
}
response.sendRedirect("../../index.jsp?folder=halaman&file=komentar&idpost="+k.getIdpost());
%>