<%-- 
    Document   : editpost
    Created on : Dec 24, 2016, 2:12:48 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Model.Post, Dao.PostDao" %>
<%
String iduser = session.getAttribute("iduser").toString();
String idpost = request.getParameter("idpost");
PostDao postDao = new PostDao();
Post post = new Post();
post = postDao.getById(Integer.parseInt(idpost));
%>
<div class="container">
    <div class="komentar">
        <div class="kepala">
            <a href="index.jsp?folder=halaman&amp;file=profile&amp;iduser=<%=post.getIduser()%>">
                <%=post.getNama()%>
            </a>
            <span class="iduser">@<%=post.getIduser()%></span>
        </div>
        <p><%=post.getPost()%></p>
    </div>
    <form data-toggle="validator" method="post" action="action/post/edit.jsp" class="post-komentar">
        <div class="form-group">
            <input type="hidden" name="idpost" value="<%=post.getIdpost()%>"/>
            <input type="hidden" name="iduser" value="<%=session.getAttribute("iduser")%>"/>
            <textarea name="post" class="form-control" rows="7" required><%=post.getPost()%></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Edit Post</button>
    </form>
</div>