<%-- 
    Document   : home
    Created on : Dec 24, 2016, 7:00:52 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.PostDao, Model.Post, java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <!-- Alert -->
    <jsp:include page="../material/alertHome.jsp"/>
    
    <!-- Post -->
    <form data-toggle="validator" method="post" action="action/post/post.jsp" class="post">
        <div class="form-group">
            <textarea name="post" class="form-control" placeholder="Kabar untuk saudara Anda..." rows="7" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Post</button>
    </form>
    
    <!-- Konten -->
    <%
    PostDao postDao = new PostDao();
    List<Post> postList = new ArrayList<Post>();
    postList = postDao.getAll();
    if(!postList.isEmpty()) {
        request.setAttribute("postList", postList);
        %>
        <c:forEach items="${postList}" var="data">
            <c:set var="iduser" value="${data.getIduser()}"/>
            <div class="konten">
                <div class="kepala">
                    <a href="index.jsp?folder=halaman&file=profile&iduser=${data.getIduser()}">${data.getNama()}</a>
                    <span class="iduser">@${data.getIduser()}</span>
                    <%
                    if(pageContext.getAttribute("iduser").equals(session.getAttribute("iduser"))) {
                        %>
                        <span class="dropdown user-action hidden-xs">
                            <a href="#" class="dropdown-toggle iduser" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="index.jsp?folder=halaman&file=editpost&idpost=${data.getIdpost()}">Edit</a></li>
                                <li><a href="#" onclick="conDelPost(${data.getIdpost()})">Delete</a>
                            </ul>
                        </span>
                        <span class="dropdown user-action visible-xs">
                            <a href="#" class="dropdown-toggle iduser" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="index.jsp?folder=halaman&file=editpost&idpost=${data.getIdpost()}">Edit</a></li>
                                <li><a href="#" onclick="conDelPost(${data.getIdpost()})">Delete</a>
                            </ul>
                        </span>
                        <%
                    }
                    %>
                </div>
                <p>${data.getPost()}</p>
                <a href="index.jsp?folder=halaman&file=komentar&idpost=${data.getIdpost()}">${data.getJmlkomentar()} Komentar</a>
            </div>
        </c:forEach>
        <%
    } else {
        %>
        <div class="konten">
            <span class="iduser">Tidak ada posting.</span>
        </div>
        <%
    }
    %>
</div>