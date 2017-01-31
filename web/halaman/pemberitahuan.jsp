<%-- 
    Document   : pemberitahuan
    Created on : Dec 25, 2016, 1:26:05 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.NotifDao, Model.Notif, java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
NotifDao notifDao = new NotifDao();
int jumlahNotif = notifDao.getJmlnotif(session.getAttribute("iduser").toString());
List<Notif> notifList = new ArrayList<Notif>();
notifList = notifDao.getAll(session.getAttribute("iduser").toString());
request.setAttribute("notifList", notifList);
%>
<div class="container">
    <div class="konten">
        <%
        if(jumlahNotif < 1) {
            %>
            <span class="iduser">Tidak ada pemberitahuan.</span>
            <%
        } else {
            %>
            <span class="iduser"><%=jumlahNotif%> Pemberitahuan</span>
            <c:forEach items="${notifList}" var="data">
                <c:set var="pengirim" value="${data.getPengirim()}"/>
                <c:set var="penerima" value="${data.getPenerima()}"/>
                <c:set var="pemilik" value="${data.getPemilik()}"/>
                <hr>
                <a href="index.jsp?folder=halaman&file=profile&iduser=${data.getPengirim()}">
                    ${data.getNamaPengirim()} 
                </a>
                <span class="iduser">@${data.getPengirim()}</span> berkomentar di
                <a href="action/notif/baca.jsp?idpost=${data.getIdPost()}&idnotif=${data.getIdNotif()}">status</a>
                <%
                if(pageContext.getAttribute("pemilik").equals(pageContext.getAttribute("pengirim"))) {
                    out.println("Nya.");
                } else if(pageContext.getAttribute("pemilik").equals(pageContext.getAttribute("penerima"))) {
                    out.println("Anda.");
                } else {
                    %>
                    <a href="index.jsp?folder=halaman&file=profile&iduser=${data.getPemilik()}">
                        ${data.getNamaPemilik()} 
                    </a>
                    <span class="iduser">@${data.getPemilik()}.</span>
                    <%
                }
                %>
            </c:forEach>
            <%
        }
        %>
    </div>
</div>