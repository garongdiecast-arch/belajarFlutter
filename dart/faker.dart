import 'package:flutter/material.dart';
import 'package:faker/faker.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final faker =  Faker();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Tile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          chatItem(
            nama: 'zura',
            nomor: faker.lorem.sentence(),
            imageUrl: 'https://images.unsplash.com/photo-1679930348703-f94efd6ad369?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
            status: 'online',
          ),
          Divider(),
          chatItem(
            nama: faker.person.name(),
            nomor: '0812zxx',
            imageUrl: 'https://images.unsplash.com/photo-1679930348703-f94efd6ad369?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
            status: 'online',
          ),
          
          Divider(),
        ],
      ),
    );
  }
}

class chatItem extends StatelessWidget {
  final String nama;
  final String nomor;
  
  final String imageUrl;
  final String status;

  const chatItem({
    super.key,
    required this.nama,
    required this.nomor,
    required this.imageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nama),
      subtitle: Text(nomor),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
      trailing: Text(status),
      dense: true,
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (BuildContext context) => Detail()));
      },
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('hai')));
  }
}
