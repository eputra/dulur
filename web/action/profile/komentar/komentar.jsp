<%-- 
    Document   : komentar
    Created on : Dec 31, 2016, 1:52:17 PM
    Author     : Eka Putra <ekaputtra at gmail.com>
--%>

<%@page import="Dao.*, Model.*, java.util.*"%>
<jsp:useBean id="k" class="Model.Komentar"></jsp:useBean>
<jsp:setProperty property="*" name="k"/>
<%
Komentar komentar = new Komentar();
komentar.setIduser(session.getAttribute("iduser").toString());
komentar.setIdpost(k.getIdpost());
komentar.setKomentar(k.getKomentar());
KomentarDao komentarDao = new KomentarDao();
int idkomentar = komentarDao.save(komentar);
if (idkomentar == 0) {
    session.setAttribute("addComErr", "Komentar gagal ditambah.");
} else {
    PostDao postDao = new PostDao();
    postDao.addJmlKomentar(k.getIdpost());
    
    PostDao pDao = new PostDao();
    Post post = new Post();
    post = pDao.getById(k.getIdpost());
    
    UserDao userDao = new UserDao();
    List<User> userList = new ArrayList<User>();
    userList = userDao.getUserPost(post.getIdpost());
    for (User iduserList: userList) {
        if(!iduserList.getIduser().equals(session.getAttribute("iduser").toString())) {
            if(!post.getIduser().equals(iduserList.getIduser())) {
                NotifDao notifDao = new NotifDao();
                Notif notif = new Notif();
                notif.setIdKomentar(idkomentar);
                notif.setIdPost(post.getIdpost());
                notif.setPengirim(session.getAttribute("iduser").toString());
                notif.setPenerima(iduserList.getIduser());
                notif.setPemilik(post.getIduser());
                notifDao.addNotif(notif);
            }
        } else if(!post.getIduser().equals(iduserList.getIduser())) {
            NotifDao notifDao = new NotifDao();
            Notif notif = new Notif();
            notif.setIdKomentar(idkomentar);
            notif.setIdPost(post.getIdpost());
            notif.setPengirim(session.getAttribute("iduser").toString());
            notif.setPenerima(post.getIduser());
            notif.setPemilik(post.getIduser());
            notifDao.addNotif(notif);
        }
    }
        
    session.setAttribute("addComSuc", "Komentar berhasil ditambah.");
}
response.sendRedirect("../../../index.jsp?folder=halaman&file=komentarprofile&idpost="+k.getIdpost());
%>