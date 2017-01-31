/*
 * The MIT License
 *
 * Copyright 2016 Eka Putra <ekaputtra at gmail.com>.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package Dao;

import Koneksi.Koneksi;
import Model.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author Eka Putra <ekaputtra at gmail.com>
 */
public class PostDao {
    private final Connection koneksi = new Koneksi().getKoneksi();
    private final String save = "insert into post(iduser, post, waktu, jmlkomentar) values(?,?,?,?)";
    private final String getAll = "SELECT user.iduser, user.nama, post.idpost, post.post, post.jmlkomentar "
                                + "FROM user INNER JOIN post ON user.iduser=post.iduser "
                                + "ORDER BY post.waktu DESC";
    private final String getById = "SELECT user.iduser, user.nama, post.idpost, post.post, post.jmlkomentar "
                                 + "FROM user INNER JOIN post ON user.iduser=post.iduser "
                                 + "WHERE idpost=?";
    private final String getByUser = "SELECT user.iduser, user.nama, post.idpost, post.post, post.jmlkomentar "
                                   + "FROM user INNER JOIN post ON user.iduser=post.iduser "
                                   + "WHERE post.iduser=? ORDER BY post.waktu DESC";
    private final String edit = "UPDATE post SET post=? WHERE idpost=? AND iduser=?";
    private final String delete = "DELETE FROM post WHERE idpost=? AND iduser=?";
    private final String addJmlKomentar = "UPDATE post SET jmlkomentar=jmlkomentar+1 WHERE idpost=?";
    private final String subJmlKomentar = "UPDATE post SET jmlkomentar=jmlkomentar-1 WHERE idpost=?";
    private final String cekByUser = "SELECT COUNT(idpost) FROM post WHERE iduser=?";
    
    public int cekByUser(String iduser) {
        int status = 0;
        try {
            PreparedStatement ps = koneksi.prepareStatement(cekByUser);
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();
            rs.next();
            status = rs.getInt(1);
        } catch(SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public void subJmlKomentar(int idpost) {
        try {
            PreparedStatement ps = koneksi.prepareStatement(subJmlKomentar);
            ps.setInt(1, idpost);
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    
    public void addJmlKomentar(int idpost) {
        try {
            PreparedStatement ps = koneksi.prepareStatement(addJmlKomentar);
            ps.setInt(1, idpost);
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    
    public int delete(Post post) {
        int status = 0;
        try {
            PreparedStatement ps = koneksi.prepareStatement(delete);
            ps.setInt(1, post.getIdpost());
            ps.setString(2, post.getIduser());
            status = ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public int edit(Post post) {
        int status = 0;
        try {
            PreparedStatement ps = koneksi.prepareStatement(edit);
            ps.setString(1, post.getPost());
            ps.setInt(2, post.getIdpost());
            ps.setString(3, post.getIduser());
            status = ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public int save(Post post) {
        int status = 0;
        try {
            Date date = new Date();
            SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String waktu = sdf.format(date);
            PreparedStatement ps = koneksi.prepareStatement(save);
            ps.setString(1, post.getIduser());
            ps.setString(2, post.getPost());
            ps.setString(3, waktu);
            ps.setInt(4, 0);
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public Post getById(int idpost) {
        Post post = null;
        try {
            PreparedStatement ps = koneksi.prepareStatement(getById);
            ps.setInt(1, idpost);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                post = new Post();
                post.setIdpost(rs.getInt("idpost"));
                post.setNama(rs.getString("nama"));
                post.setIduser(rs.getString("iduser"));
                post.setPost(rs.getString("post"));
                post.setJmlkomentar(rs.getInt("jmlkomentar"));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return post;
    }
    
    public List<Post> getAll() {
        List<Post> postList = new ArrayList<Post>();
        
        try {
            PreparedStatement ps = koneksi.prepareStatement(getAll);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Post post = new Post();
                post.setIdpost(rs.getInt("idpost"));
                post.setIduser(rs.getString("iduser"));
                post.setNama(rs.getString("nama"));
                post.setPost(rs.getString("post"));
                post.setJmlkomentar(rs.getInt("jmlkomentar"));
                postList.add(post);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return postList;
    }
    
    public List<Post> getByUser(String iduser) {
        List<Post> postList = new ArrayList<Post>();
        
        try {
            PreparedStatement ps = koneksi.prepareStatement(getByUser);
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Post post = new Post();
                post.setIdpost(rs.getInt("idpost"));
                post.setIduser(rs.getString("iduser"));
                post.setNama(rs.getString("nama"));
                post.setPost(rs.getString("post"));
                post.setJmlkomentar(rs.getInt("jmlkomentar"));
                postList.add(post);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return postList;
    }
    
    public static void main(String[] args) {
        PostDao pd = new PostDao();
        List<Post> p = new ArrayList<Post>();
        p = pd.getAll();
        for (Post data: p) {
            System.out.println(data);
        }
    }
}
