import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'ListView', home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Daftar Menu',
            style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "popins",
          ),//TextStyle
        ),//Text
      ),//AppBar
      body: ListView(
        children: [
          DaftarMenu(
            icon:
                'https://i0.wp.com/resepkoki.id/wp-content/uploads/2016/09/Resep-Nasi-Goreng-Ikan-Teri.jpg?fit=1920%2C1440&ssl=1',
            judul: 'Nasi goreng',
            deskripsi: 'Nasing goreng spesial yang berisi telur teri dan udang',
          ),
          DaftarMenu(icon: 'https://cafetaria.murniteguhhospitals.com/wp-content/uploads/2023/02/Ifumie-Goreng-Spesial.jpg', 
            judul: 'Ifumie Goreng Special',
           deskripsi: 'Ifumie goreng spesial terdiri 1 telur mata sapi,ayam gorang dan telur yang udah di campur pada ifumie goreng',
          ),
          DaftarMenu(icon:'https://cafetaria.murniteguhhospitals.com/wp-content/uploads/2023/02/Nasi-Soto-Ayam-3.jpg', 
          judul:'Nasi Soto Ayam + Perekedel', 
          deskripsi:'Nasi soto ayam yang include dengan seporsi nasi dan tamabahn perkedel 1 potong'
          ),
          DaftarMenu(icon:'https://cafetaria.murniteguhhospitals.com/wp-content/uploads/2023/02/Ayam-Penyet.jpg', 
          judul:'Ayam Penyet', 
          deskripsi:'Dalam seporsi Ayam penyet terdiri dari Nasi Putih,Kriuk,Ayam Penyet,Sambal Belacan,Tahun&Tempe,dan Teh Manis Dingin/Panas'
          ),
          DaftarMenu(icon:'https://cafetaria.murniteguhhospitals.com/wp-content/uploads/2023/02/Mie-Goreng-Spesial1.jpg', 
          judul:'Mie Goreng Special',
          deskripsi:'Dalam pembelian seporsi Mie Goreng Spesial include Telur Mata Sapi dan Ayam Goreng Spesial'),
          DaftarMenu(icon:'https://cafetaria.murniteguhhospitals.com/wp-content/uploads/2023/02/Mie-Goreng-Spesial1.jpg', 
          judul:'Mie Goreng Special',
          deskripsi:'Dalam pembelian seporsi Mie Goreng Spesial include Telur Mata Sapi dan Ayam Goreng Spesial'),
          DaftarMenu(icon:'https://cafetaria.murniteguhhospitals.com/wp-content/uploads/2023/02/Mie-Goreng-Spesial1.jpg', 
          judul:'Mie Goreng Special',
          deskripsi:'Dalam pembelian seporsi Mie Goreng Spesial include Telur Mata Sapi dan Ayam Goreng Spesial'),
          DaftarMenu(icon:'https://cafetaria.murniteguhhospitals.com/wp-content/uploads/2023/02/Mie-Goreng-Spesial1.jpg', 
          judul:'Mie Goreng Special',
          deskripsi:'Dalam pembelian seporsi Mie Goreng Spesial include Telur Mata Sapi dan Ayam Goreng Spesial'),
        ],

      ),//ListView
    );//Scaffold
  }
}

class DaftarMenu extends StatelessWidget {
  final String icon;
  final String judul;
  final String deskripsi;
  const DaftarMenu({
    super.key,
    required this.icon,
    required this.judul,
    required this.deskripsi,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Row(
          children: [
            Image(image: NetworkImage(icon), width: 100),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sans-serif',
                    ),TextStyle
                  ),//Text
                  const SizedBox(width: 12),
                  Text(deskripsi,style: TextStyle(fontSize: 12,color: Colors.grey),)
                ],
              ),//Column
            ),//Expanded
          ],
        ),//Row
      ),//Card
    );//Container
  }
}
//Melakukan test jika gmabr tidak muncul
Image(image: NetworkImage(icon), width: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
            // Menampilkan ikon pengganti jika gambar gagal di-load / URL mati
             return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
            },),
