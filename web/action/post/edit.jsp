<%-- 
    Document   : update
    Created on : Dec 24, 2016, 2:43:40 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.PostDao" %>
<jsp:useBean id="p" class="Model.Post"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>
<%
PostDao post = new PostDao();
int status = post.edit(p);
if (status != 0) {
    session.setAttribute("editPostSuc","Posting berhasil diedit!");
} else {
    session.setAttribute("editPostErr","Posting gagal diedit!");
}
response.sendRedirect("../../index.jsp?folder=halaman&file=komentar&idpost="+p.getIdpost());
%>