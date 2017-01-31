<%-- 
    Document   : alertHome
    Created on : Dec 31, 2016, 9:12:27 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%
String delPostSuc = (String)session.getAttribute("delPostSuc");
if(delPostSuc != null) {
    %>
    <div class="post alert alert-success" role="alert"><%=delPostSuc%></div>
    <%
    session.removeAttribute("delPostSuc");
}

String delPostErr = (String)session.getAttribute("delPostErr");
if(delPostErr != null) {
    %>
    <div class="post alert alert-danger" role="alert"><%=delPostErr%></div>
    <%
    session.removeAttribute("delPostErr");
}

String addPostSuc = (String)session.getAttribute("addPostSuc");
if(addPostSuc != null) {
    %>
    <div class="post alert alert-success" role="alert"><%=addPostSuc%></div>
    <%
    session.removeAttribute("addPostSuc");
}

String addPostErr = (String)session.getAttribute("addPostErr");
if(addPostErr != null) {
    %>
    <div class="post alert alert-danger" role="alert"><%=addPostErr%></div>
    <%
    session.removeAttribute("addPostErr");
}
%>