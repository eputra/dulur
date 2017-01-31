<%-- 
    Document   : edit
    Created on : Dec 31, 2016, 1:33:36 PM
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
response.sendRedirect("../../../index.jsp?folder=halaman&file=komentarprofile&idpost="+p.getIdpost());
%>