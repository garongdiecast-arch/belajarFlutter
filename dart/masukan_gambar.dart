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
