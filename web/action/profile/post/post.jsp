<%-- 
    Document   : post
    Created on : Dec 31, 2016, 11:02:07 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.PostDao, Model.Post"%>
<jsp:useBean id="p" class="Model.Post"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>
<%
String iduser = session.getAttribute("iduser").toString();
Post post = new Post();
post.setIduser(iduser);
post.setPost(p.getPost());
PostDao postDao = new PostDao();
int status = postDao.save(post);
if (status != 0) {
    session.setAttribute("addPostSuc", "Posting berhasil ditambah.");
} else {
    session.setAttribute("addPostErr", "Posting gagal ditambah.");
}
response.sendRedirect("../../../index.jsp?folder=halaman&file=profile&iduser="+iduser);
%>