<%-- 
    Document   : komentar
    Created on : Dec 24, 2016, 3:51:01 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Model.Post, Dao.PostDao, Model.Komentar, Dao.KomentarDao, java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
int idpost = Integer.parseInt(request.getParameter("idpost"));
PostDao postDao = new PostDao();
Post post = new Post();
post = postDao.getById(idpost);
%>
<c:set var="iduser-post" value="<%=post.getIduser()%>"/>
<div class="container">
    <!-- Alert -->
    <jsp:include page="../material/alertKomentar.jsp"/>
    
    <div class="komentar">
        <div class="kepala">
            <a href="index.jsp?folder=halaman&file=profile&iduser=<%=post.getIduser()%>"><%=post.getNama()%></a>
            <span class="iduser">@<%=post.getIduser()%></span>
            <%
            if(pageContext.getAttribute("iduser-post").equals(session.getAttribute("iduser"))) {
                %>
                <span class="dropdown user-action hidden-xs">
                    <a href="#" class="dropdown-toggle iduser" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-left">
                        <li><a href="index.jsp?folder=halaman&file=editpost&idpost=<%=idpost%>">Edit</a></li>
                        <li><a href="#" onclick="conDelPost(<%=idpost%>)">Delete</a>
                    </ul>
                </span>
                <span class="dropdown user-action visible-xs">
                    <a href="#" class="dropdown-toggle iduser" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="index.jsp?folder=halaman&file=editpost&idpost=<%=idpost%>">Edit</a></li>
                        <li><a href="#" onclick="conDelPost(<%=idpost%>)">Delete</a>
                    </ul>
                </span>
                <%
            }
            %>
        </div>
        <p><%=post.getPost()%></p>
    </div>
    
    <div class="daftar-komentar">
        <span class="iduser"><%=post.getJmlkomentar()%> Komentar</span>
        <%
        KomentarDao komDao = new KomentarDao();
        List<Komentar> komList = new ArrayList<Komentar>();
        komList = komDao.getAll(idpost);
        request.setAttribute("komList", komList);
        %>
        <c:forEach items="${komList}" var="data">
            <c:set var="iduser-kom" value="${data.getIduser()}"/>
            <hr>
            <div class="kepala">
                <a href="index.jsp?folder=halaman&file=profile&iduser=${data.getIduser()}">${data.getNama()}</a>
                <span class="iduser">@${data.getIduser()}</span>
                <%
                if(pageContext.getAttribute("iduser-kom").equals(session.getAttribute("iduser"))) {
                    %>
                    <span class="dropdown user-action hidden-xs">
                        <a href="#" class="dropdown-toggle iduser" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-left">
                            <li><a href="index.jsp?folder=halaman&file=editkomentar&idkomentar=${data.getIdkomentar()}">Edit</a></li>
                            <li><a href="#" onclick="conDelCom(${data.getIdkomentar()}, ${data.getIdpost()})">Delete</a>
                        </ul>
                    </span>
                    <span class="dropdown user-action visible-xs">
                        <a href="#" class="dropdown-toggle iduser" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="index.jsp?folder=halaman&file=editkomentar&idkomentar=${data.getIdkomentar()}">Edit</a></li>
                            <li><a href="#" onclick="conDelCom(${data.getIdkomentar()}, ${data.getIdpost()})">Delete</a>
                        </ul>
                    </span>
                    <%
                }
                %>
            </div>
            <p>${data.getKomentar()}</p>
        </c:forEach>
    </div>
    <form data-toggle="validator" method="post" action="action/komentar/komentar.jsp" class="post-komentar">
        <div class="form-group">
            <input type="hidden" name="idpost" value="<%=idpost%>"/>
            <textarea name="komentar" class="form-control" placeholder="Tulis komentar..." rows="7" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Komentar</button>   
    </form>
</div>