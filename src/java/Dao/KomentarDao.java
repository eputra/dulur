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
import Model.Komentar;
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
public class KomentarDao {
    private final Connection koneksi = new Koneksi().getKoneksi();
    private final String save = "INSERT INTO komentar(idpost, iduser, komentar, waktu) values(?, ?, ?, ?)";
    private final String getAll = "SELECT user.iduser, user.nama, komentar.idkomentar, komentar.komentar, post.idpost "
                                + "FROM komentar "
                                + "INNER JOIN user ON user.iduser=komentar.iduser "
                                + "INNER JOIN post ON post.idpost=komentar.idpost "
                                + "WHERE post.idpost=? "
                                + "ORDER BY komentar.waktu ASC";
    private final String getById = "SELECT user.iduser, user.nama, "
                                 + "komentar.idkomentar, komentar.idpost, komentar.komentar "
                                 + "FROM komentar "
                                 + "INNER JOIN user ON user.iduser=komentar.iduser "
                                 + "WHERE komentar.idkomentar=?";
    private final String edit = "UPDATE komentar SET komentar=? WHERE idkomentar=? AND iduser=?";
    private final String delete = "DELETE FROM komentar WHERE idkomentar=? AND iduser=?";
    
    public int delete(Komentar kom) {
        int status = 0;
        try {
            PreparedStatement ps = koneksi.prepareStatement(delete);
            ps.setInt(1, kom.getIdkomentar());
            ps.setString(2, kom.getIduser());
            status = ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public int edit(Komentar kom) {
        int status = 0;
        try {
            PreparedStatement ps = koneksi.prepareStatement(edit);
            ps.setString(1, kom.getKomentar());
            ps.setInt(2, kom.getIdkomentar());
            ps.setString(3, kom.getIduser());
            status = ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public Komentar getById(int idkomentar) {
        Komentar kom = null;
        try {
            PreparedStatement ps = koneksi.prepareStatement(getById);
            ps.setInt(1, idkomentar);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                kom = new Komentar();
                kom.setIduser(rs.getString("iduser"));
                kom.setNama(rs.getString("nama"));
                kom.setIdkomentar(rs.getInt("idkomentar"));
                kom.setIdpost(rs.getInt("idpost"));
                kom.setKomentar(rs.getString("komentar"));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return kom;
    }
    
    public int save(Komentar komentar) {
        int status = 0;
        try {
            Date date = new Date();
            SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String waktu = sdf.format(date);
            PreparedStatement ps = koneksi.prepareStatement(save);
            ps.setInt(1, komentar.getIdpost());
            ps.setString(2, komentar.getIduser());
            ps.setString(3, komentar.getKomentar());
            ps.setString(4, waktu);
            status = ps.executeUpdate();
            
        } catch(SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public List<Komentar> getAll(int idpost) {
        List<Komentar> komList = new ArrayList<Komentar>();
        try {
            PreparedStatement ps = koneksi.prepareStatement(getAll);
            ps.setInt(1, idpost);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Komentar kom = new Komentar();
                kom.setNama(rs.getString("nama"));
                kom.setIduser(rs.getString("iduser"));
                kom.setIdkomentar(rs.getInt("idkomentar"));
                kom.setKomentar(rs.getString("komentar"));
                kom.setIdpost(rs.getInt("idpost"));
                komList.add(kom);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return komList;
    }
    
    public static void main(String[] args) {
//        KomentarDao kd = new KomentarDao();
//        Komentar k = new Komentar();
//        k.setKomentar("Coba jj");
//        k.setIdkomentar(3);
//        k.setIduser("eka");
//        int status = kd.edit(k);
//        if (status == 0) {
//            System.out.println("Gagal");
//        } else {
//            System.out.println("Berhasil");
//        }
        KomentarDao kd = new KomentarDao();
        List<Komentar> k = new ArrayList<Komentar>();
        k = kd.getAll(82);
        for (Komentar data: k) {
            System.out.println(data);
        }
    }
}
