<%-- 
    Document   : depan
    Created on : Dec 25, 2016, 6:08:49 AM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<% session.removeAttribute("title"); %>
<!-- Sign In -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">Dulur</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <form data-toggle="validator" role="form" method="post" action="action/user/signin.jsp" class="navbar-form navbar-right">
        <div class="form-group">
          <input type="text" name="iduser" id="inUserName" placeholder="Username" class="form-control" maxlength="10" required>
        </div>
        <div class="form-group">
          <input type="password" name="password" id="inPassword" placeholder="Password" class="form-control" maxlength="32" required>
        </div>
        <button type="submit" class="btn btn-success">Sign In</button>
      </form>
    </div>
    </div>
</nav>    

<div class="container">
    <center>
        <h1>Selamat datang di Dulur</h1>
        <h3>Tempat paling mudah dan nyaman untuk berkomunikasi dengan saudara Anda.</h3>
    </center>
    <form data-toggle="validator" role="form" method="post" action="action/user/signup.jsp" class="signup">
        <div class="form-group form-group-lg">
            <input type="text" name="iduser" id="inputUsername" placeholder="Username" class="form-control" maxlength="10" required>
        </div>
        <div class="form-group form-group-lg">
            <input type="text" name="nama" id="inputFullName" placeholder="Fullname" class="form-control" maxlength="30" required>
        </div>
        <div class="form-group form-group-lg">
            <input type="password" name="password" id="inputPassword" placeholder="Password" class="form-control" maxlength="32" required>
        </div>
        <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
    </form>
</div>