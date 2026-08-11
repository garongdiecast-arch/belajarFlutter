//Masukan gamabar manual
//Masuk ke Folder pubspec.yaml
//Pada bagian flutter:
//Ketik - img/headset.webp
//img folder dimana kita menyimpan foto
//untuk bagian hal.dart dengan cara Image.asset('img/komputer.png'),
 Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Text('Komputer',style: TextStyle(fontSize: 30),),
            Padding(padding: EdgeInsets.all(20)),
            Image.asset('img/komputer.png'),

          ],
        ),
      ),
    );
  }
}
//Masukan Gambar melalu link pada link image address
// Pertama cari gambar dari internet
//Lalu copy link image address
//Setelah itu  ketikan perintiatah seperti dan masukan link pada url  berikut contoh Image(image:NetworkImage(url))
import 'package:flutter/material.dart';

class Radio extends StatelessWidget {
  const Radio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Text('Radio',style: TextStyle(fontSize: 30),),
            Padding(padding: EdgeInsets.all(20)),
            Image(image: NetworkImage('https://img.magnific.com/free-vector/smartphone-with-different-views-realistic-style_23-2147849864.jpg?semt=ais_test_b&w=740&q=80'))
      
          ],
        ),
      ),
    );
  }
}
