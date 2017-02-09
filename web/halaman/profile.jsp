<%-- 
    Document   : profile
    Created on : Dec 31, 2016, 7:22:15 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.PostDao, Dao.UserDao, Model.Post, java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Alert -->
<div class="container">
    <jsp:include page="../material/alertHome.jsp"/>
    <%
    String iduser = request.getParameter("iduser").toString();
    UserDao userDao = new UserDao();
    int statusUser = userDao.cekById(iduser);
    if(statusUser == 0) {
        %>
        <div class="konten">
            <span class="iduser">Maaf, dulur @<%=iduser%> tidak ditemukan.</span>
        </div>
        <%
    } else {
        %>
        <!-- Post -->
        <%
        if(iduser.equals(session.getAttribute("iduser").toString())) {
            %>
            <form data-toggle="validator" method="post" action="action/profile/post/post.jsp" class="post">
                <input type="hidden" name="iduser" value="<%=session.getAttribute("iduser").toString()%>">
                <div class="form-group">
                    <textarea name="post" class="form-control" placeholder="Kabar untuk saudara Anda..." rows="7" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Post</button>
            </form>
            <%
        }
        %>

        <%
        PostDao pDao = new PostDao();
        int statusPost = pDao.cekByUser(iduser);
        if(statusPost == 0) {
            %>
            <div class="konten">
                <span class="iduser">Tidak ada posting.</span>
            </div>
            <%
        } else {
            PostDao postDao = new PostDao();
            List<Post> postList = new ArrayList<Post>();
            postList = postDao.getByUser(iduser);
            request.setAttribute("postList", postList); 
            %>
            <!-- Konten -->
                <c:forEach items="${postList}" var="data">
                    <c:set var="iduser" value="${data.getIduser()}"/>
                    <div class="konten">
                        <div class="kepala">
                            <a href="index.jsp?folder=halaman&amp;file=profile&amp;iduser=${data.getIduser()}">${data.getNama()}</a>
                            <span class="iduser">@${data.getIduser()}</span>
                            <%
                            if(pageContext.getAttribute("iduser").equals(session.getAttribute("iduser"))) {
                                %>
                                <span class="dropdown user-action hidden-xs">
                                    <a href="#" class="dropdown-toggle iduser" data-toggle="dropdown">
                                        <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-left">
                                        <li><a href="index.jsp?folder=halaman&amp;file=editpostprofile&amp;idpost=${data.getIdpost()}">Edit</a></li>
                                        <li><a href="#" onclick="conDelPostPro(${data.getIdpost()})">Delete</a>
                                    </ul>
                                </span>
                                <span class="dropdown user-action visible-xs">
                                    <a href="#" class="dropdown-toggle iduser" data-toggle="dropdown">
                                        <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="index.jsp?folder=halaman&amp;file=editpostprofile&amp;idpost=${data.getIdpost()}">Edit</a></li>
                                        <li><a href="#" onclick="conDelPostPro(${data.getIdpost()})">Delete</a>
                                    </ul>
                                </span>
                                <%
                            }
                            %>
                        </div>
                        <p>${data.getPost()}</p>
                        <a href="index.jsp?folder=halaman&amp;file=komentarprofile&amp;idpost=${data.getIdpost()}">${data.getJmlkomentar()} Komentar</a>
                    </div>
                </c:forEach>
            <%
        }
    }
    %>
</div>