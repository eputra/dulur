<%-- 
    Document   : alertIndex
    Created on : Dec 31, 2016, 8:49:10 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%
String signinErrId = (String)session.getAttribute("signinErrId");
if (signinErrId == "1") {
    %>
    <script type="text/javascript">
        signinErrId();
    </script>
    <%
    session.removeAttribute("signinErrId");
}

String signinErrPass = (String)session.getAttribute("signinErrPass");
if (signinErrPass == "1") {
    %>
    <script type="text/javascript">
        signinErrPass();
    </script>
    <%
    session.removeAttribute("signinErrPass");
}

String signupError = (String)session.getAttribute("signupError");
if (signupError == "1") {
    %>
    <script type="text/javascript">
        signupError();
    </script>
    <%
    session.removeAttribute("signupError");
}
%>