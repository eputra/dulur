<%-- 
    Document   : alertKomentar
    Created on : Dec 31, 2016, 8:55:02 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%
String editPostSuc = (String)session.getAttribute("editPostSuc");
if(editPostSuc != null) {
    %>
    <div class="post alert alert-success" role="alert"><%=editPostSuc%></div>
    <%
    session.removeAttribute("editPostSuc");
}

String editPostErr = (String)session.getAttribute("editPostErr");
if(editPostErr != null) {
    %>
    <div class="post alert alert-danger" role="alert"><%=editPostErr%></div>
    <%
    session.removeAttribute("editPostErr");
}

String addComSuc = (String)session.getAttribute("addComSuc");
if(addComSuc != null) {
    %>
    <div class="post alert alert-success" role="alert"><%=addComSuc%></div>
    <%
    session.removeAttribute("addComSuc");
}

String addComErr = (String)session.getAttribute("addComErr");
if(addComErr != null) {
    %>
    <div class="post alert alert-danger" role="alert"><%=addComErr%></div>
    <%
    session.removeAttribute("addComErr");
}

String editComSuc = (String)session.getAttribute("editComSuc");
if(editComSuc != null) {
    %>
    <div class="post alert alert-success" role="alert"><%=editComSuc%></div>
    <%
    session.removeAttribute("editComSuc");
}

String editComErr = (String)session.getAttribute("editComErr");
if(editComErr != null) {
    %>
    <div class="post alert alert-danger" role="alert"><%=editComErr%></div>
    <%
    session.removeAttribute("editComErr");
}

String delComSuc = (String)session.getAttribute("delComSuc");
if(delComSuc != null) {
    %>
    <div class="post alert alert-success" role="alert"><%=delComSuc%></div>
    <%
    session.removeAttribute("delComSuc");
}

String delComErr = (String)session.getAttribute("delComErr");
if(delComErr != null) {
    %>
    <div class="post alert alert-danger" role="alert"><%=delComErr%></div>
    <%
    session.removeAttribute("delComErr");
}
%>