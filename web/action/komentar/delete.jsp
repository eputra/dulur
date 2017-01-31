<%-- 
    Document   : delete
    Created on : Dec 25, 2016, 10:34:23 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.KomentarDao, Dao.PostDao, Model.Komentar"%>
<%
int idpost = Integer.parseInt(request.getParameter("idpost"));
Komentar kom = new Komentar();
kom.setIdkomentar(Integer.parseInt(request.getParameter("idkomentar")));
kom.setIduser(session.getAttribute("iduser").toString());
KomentarDao komDao = new KomentarDao();
int status = komDao.delete(kom);
if(status != 0) {
    PostDao postDao = new PostDao();
    postDao.subJmlKomentar(idpost);
    session.setAttribute("delComSuc","Komentar berhasil dihapus!");
} else {
    session.setAttribute("delComErr","Komentar gagal dihapus!");
} 
response.sendRedirect("../../index.jsp?folder=halaman&file=komentar&idpost="+idpost);
%>