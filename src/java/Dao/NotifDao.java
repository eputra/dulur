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
import Model.Notif;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Eka Putra <ekaputtra at gmail.com>
 */
public class NotifDao {
    private Connection koneksi = new Koneksi().getKoneksi();
    private final String addNotif = "INSERT INTO "
                                  + "notif(idpost, pengirim, penerima, baca, waktu, pemilik) "
                                  + "values(?,?,?,?,?,?)";
    private final String getAll = "SELECT notif.*, Pengirim.nama AS namaPengirim, "
                                + "Penerima.nama AS namaPenerima, Pemilik.nama AS namaPemilik "
                                + "FROM notif "
                                + "LEFT JOIN user AS Pengirim ON notif.pengirim=Pengirim.iduser "
                                + "LEFT JOIN user AS Penerima ON notif.penerima=Penerima.iduser "
                                + "LEFT JOIN user AS Pemilik ON notif.pemilik=Pemilik.iduser "
                                + "WHERE penerima=? AND baca=0 ORDER BY waktu ASC";
    private final String getJmlnotif = "SELECT COUNT(idnotif) FROM notif WHERE penerima=? AND baca=0";
    private final String subNotif = "UPDATE notif SET baca=1 WHERE idnotif=?";
    
    public void subNotif(int idnotif) {
        try {
            PreparedStatement ps = koneksi.prepareStatement(subNotif);
            ps.setInt(1, idnotif);
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    
    public int getJmlnotif(String penerima) {
        int jumlah = 0;
        try {
            PreparedStatement ps = koneksi.prepareStatement(getJmlnotif);
            ps.setString(1, penerima);
            ResultSet rs = ps.executeQuery();
            rs.next();
            jumlah = rs.getInt(1);
        } catch(SQLException e) {
            System.out.println(e);
        }
        return jumlah;
    }
    
    public List<Notif> getAll(String penerima) {
        List<Notif> notifList = new ArrayList<Notif>();
        try {
            PreparedStatement ps = koneksi.prepareStatement(getAll);
            ps.setString(1, penerima);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Notif notif = new Notif();
                notif.setIdNotif(rs.getInt("idnotif"));
                notif.setIdPost(rs.getInt("idpost"));
                notif.setPengirim(rs.getString("pengirim"));
                notif.setNamaPengirim(rs.getString("namaPengirim"));
                notif.setPenerima(rs.getString("penerima"));
                notif.setNamaPenerima(rs.getString("namaPenerima"));
                notif.setPemilik(rs.getString("pemilik"));
                notif.setNamaPemilik(rs.getString("namaPemilik"));
                notif.setBaca(rs.getString("baca"));
                notif.setWaktu(rs.getString("waktu"));
                notifList.add(notif);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return notifList;
    }
    
    public void addNotif(Notif notif) {
        try {
            Date date = new Date();
            SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String waktu = sdf.format(date);
            PreparedStatement ps = koneksi.prepareStatement(addNotif);
            ps.setInt(1, notif.getIdPost());
            ps.setString(2, notif.getPengirim());
            ps.setString(3, notif.getPenerima());
            ps.setString(4, "0");
            ps.setString(5, waktu);
            ps.setString(6, notif.getPemilik());
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
//        NotifDao nd = new NotifDao();
//        nd.subNotif(2);
        
        NotifDao nd = new NotifDao();
        List<Notif> n = new ArrayList<Notif>();
        n = nd.getAll("eka");
        for (Notif data: n) {
            System.out.println(data);
        }
    }
}
