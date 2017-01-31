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

function signinErrId() {
    swal("Username Invalid", "Silahkan coba dengan username lain!", "error");
}

function signinErrPass() {
    swal("Password Invalid", "Silahkan coba dengan password lain!", "error");
}

function signupError() {
    swal("Duplicate Username", "Silahkan coba dengan username lain!", "info");
}

function conDelPost(idPost) {
    swal({
        title: "Apakah Anda yakin?",
        text: "Posting ini akan dihapus secara permanent!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, delete it!",
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    },
    function() {
        document.location="action/post/delete.jsp?idpost="+idPost;
    });
}

function conDelPostPro(idPost) {
    swal({
        title: "Apakah Anda yakin?",
        text: "Posting ini akan dihapus secara permanent!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, delete it!",
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    },
    function() {
        document.location="action/profile/post/delete.jsp?idpost="+idPost;
    });
}

function conDelCom(idCom, idPost) {
    swal({
        title: "Apakah Anda yakin?",
        text: "Komentar ini akan dihapus secara permanent!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, delete it!",
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    },
    function() {
        document.location="action/komentar/delete.jsp?idkomentar="+idCom+"&idpost="+idPost;
    });
}

function conDelComPro(idCom, idPost) {
    swal({
        title: "Apakah Anda yakin?",
        text: "Komentar ini akan dihapus secara permanent!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, delete it!",
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    },
    function() {
        document.location="action/profile/komentar/delete.jsp?idkomentar="+idCom+"&idpost="+idPost;
    });
}