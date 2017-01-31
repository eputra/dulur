<%-- 
    Document   : delete
    Created on : Dec 31, 2016, 11:45:51 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.PostDao, Model.Post"%>
<%
Post post = new Post();
post.setIdpost(Integer.parseInt(request.getParameter("idpost")));
post.setIduser(session.getAttribute("iduser").toString());
PostDao postDao = new PostDao();
int status = postDao.delete(post);
if(status != 0) {
    session.setAttribute("delPostSuc","Posting berhasil dihapus!");
} else {
    session.setAttribute("delPostErr","Posting gagal dihapus!");
}
response.sendRedirect("../../../index.jsp?folder=halaman&file=profile&iduser="+session.getAttribute("iduser").toString());
%>