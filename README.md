# Dulur (Simple Social Media)

Aplikasi Dulur ini merupakan aplikasi social media yang sangat sederhana, yang dibuat untuk memenuhi tugas Bahasa Pemrograman 3. Fiturnya sendiri hanya signup, signin, menampilkan kabar, menambah kabar, mengubah kabar, menghapus kabar, menampilkan komentar, menambah komentar, mengubah komentar, menghapus komentar, menampilkan notifikasi, dan signout.

Untuk masalah keamanan, akun user belum tersimpan dengan baik oleh aplikasi Dulur ini, karena password user yang tersimpan di database tidak dienkripsi. Kemudian untuk notifikasi juga masih ada bug, jadi ketika ada user yang berkomentar di status kita, dan kemudian user tersebut menghapus komentarnya, kita akan tetap mendapat notifikasi dari komentar tersebut. Bug ini terjadi sepertinya karena desain  database yang kurang baik, karena seharusnya table notifikasi berelasi dengan table komentar.

Jika ada kritik atau saran agar aplikasi Dulur ini bisa menjadi lebih baik, silahkan open issues atau pull request.
