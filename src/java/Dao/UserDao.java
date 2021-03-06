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
import java.util.ArrayList;
import java.util.List;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.jasypt.util.password.BasicPasswordEncryptor;
/**
 *
 * @author Eka Putra <ekaputtra at gmail.com>
 */
public class UserDao {
    public List<User> getUserPost(int idpost) {
        final Connection koneksi = new Koneksi().getKoneksi();
        final String query = "SELECT iduser FROM komentar WHERE idpost=? GROUP BY iduser";
        List<User> userList = new ArrayList<User>();
        try {
            PreparedStatement ps = koneksi.prepareStatement(query);
            ps.setInt(1, idpost);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                User user = new User();
                user.setIduser(rs.getString("iduser"));
                userList.add(user);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return userList;
    }
    
    public User getById(String iduser) {
        final Connection koneksi = new Koneksi().getKoneksi();
        final String query = "select * from user where iduser=?";
        User user = new User();
        try {
            PreparedStatement ps = koneksi.prepareStatement(query);
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                user.setIduser(rs.getString("iduser"));
                user.setNama(rs.getString("nama"));
                user.setPassword(rs.getString("password"));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return user;
    }
    
    public int cekById(String iduser) {
        final Connection koneksi = new Koneksi().getKoneksi();
        final String query = "SELECT COUNT(iduser) FROM user WHERE iduser=?";
        int status = 0;
        try {
            PreparedStatement ps = koneksi.prepareStatement(query);
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();
            rs.next();
            status = rs.getInt(1);
        } catch(SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public List<User> getAll() {
        final Connection koneksi = new Koneksi().getKoneksi();
        final String query = "select * from user";
        
        List<User> userList = new ArrayList<User>();
        
        try {
            PreparedStatement ps = koneksi.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                User user = new User();
                user.setIduser(rs.getString("iduser"));
                user.setNama(rs.getString("nama"));
                user.setPassword(rs.getString("password"));
                userList.add(user);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return userList;
    }
    
    public int save(User user) {
        final Connection koneksi = new Koneksi().getKoneksi();
        final String query = "insert into user(iduser, nama, password) values(?,?,?)";
        int status = 0;
        try {
            BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
            String encryptedPassword = passwordEncryptor.encryptPassword(user.getPassword());
            PreparedStatement ps = koneksi.prepareStatement(query);
            ps.setString(1, user.getIduser());
            ps.setString(2, user.getNama());
            ps.setString(3, encryptedPassword);
            status = ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public boolean validate(User user) {
        final Connection koneksi = new Koneksi().getKoneksi();
        final String query = "select user.password from user WHERE iduser=?";
        boolean status = false;
        try {
            PreparedStatement ps = koneksi.prepareStatement(query);
            ps.setString(1, user.getIduser());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
                if (passwordEncryptor.checkPassword(user.getPassword(), rs.getString("password"))) {
                    status = true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}
