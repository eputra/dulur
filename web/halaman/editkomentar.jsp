<%-- 
    Document   : editkomentar
    Created on : Dec 25, 2016, 7:10:40 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.KomentarDao, Model.Komentar"%>
<%
KomentarDao komDao = new KomentarDao();
Komentar kom = new Komentar();
kom = komDao.getById(Integer.parseInt(request.getParameter("idkomentar")));
%>
<div class="container">
    <div class="komentar">
        <div class="kepala">
            <a href="index.jsp?folder=halaman&file=profile&iduser=<%=kom.getIduser()%>">
                <%=kom.getNama()%>
            </a>
            <span class="iduser">@<%=kom.getIduser()%></span>
        </div>
        <p><%=kom.getKomentar()%></p>
    </div>
    <form data-toggle="validator" method="post" action="action/komentar/edit.jsp" class="post-komentar">
        <div class="form-group">
            <input type="hidden" name="idpost" value="<%=kom.getIdpost()%>"/>
            <input type="hidden" name="idkomentar" value="<%=kom.getIdkomentar()%>"/>
            <input type="hidden" name="iduser" value="<%=session.getAttribute("iduser")%>"/>
            <textarea name="komentar" class="form-control" rows="7" required><%=kom.getKomentar()%></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Edit Komentar</button>
    </form>
</div>