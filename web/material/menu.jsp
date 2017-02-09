<%-- 
    Document   : menu
    Created on : Dec 25, 2016, 6:05:01 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.NotifDao,java.io.File"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String hal = "home";
String fol = request.getParameter("folder");
String fil = request.getParameter("file");
if((fol != null) && (fil != null)) {
    String dataFile = fol+"/"+fil+".jsp";
    File file = new File(request.getServletContext().getRealPath(dataFile));
    if(file.exists()) {
        hal = fil;
    }
}
String iduser = session.getAttribute("iduser").toString();
NotifDao notifDao = new NotifDao();
int jumlahNotif = notifDao.getJmlnotif(iduser);
%>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <%
            if(jumlahNotif > 0) {
               %>
               <button type="button" class="navbar-toggle collapsed badge-notif-xs" data-badge="<%= jumlahNotif %>" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
               <%
            } else {
                %>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <%
            }
            %>
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp?folder=halaman&amp;file=home">Dulur</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="<%if(hal.equals("home")){out.print("aktif");}%>">
                    <a href="index.jsp?folder=halaman&amp;file=home">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                        <span class="visible-xs-inline">Home</span>
                    </a>
                </li>
                <li class="<%if(hal.equals("pemberitahuan")){out.print("aktif");}%>">
                    <a href="index.jsp?folder=halaman&amp;file=pemberitahuan">
                        <%
                        if(jumlahNotif > 0) {
                            %>
                            <span class="glyphicon glyphicon-bell badge-notif-lg hidden-xs" data-badge="<%= jumlahNotif %>" aria-hidden="true"></span>
                            <span class="visible-xs-inline">
                                <span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
                                Notifications
                                <span class="badge"><%= jumlahNotif %></span>
                            </span>
                            <%
                        } else {
                            %>
                            <span class="glyphicon glyphicon-bell hidden-xs" aria-hidden="true"></span>
                            <span class="visible-xs-inline">
                                <span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
                                Notification
                            </span>
                            <%
                        }
                        %>
                    </a>
                </li>
                <li class="<%if(hal.equals("profile")){out.print("aktif");}%>">
                    <a href="index.jsp?folder=halaman&amp;file=profile&amp;iduser=<%=iduser%>">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        <span class="visible-xs-inline">Profile</span>
                    </a>
                </li>
                <li>
                    <a href="action/user/signout.jsp">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                        <span class="visible-xs-inline">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>