import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";

void main() {
  runApp(MaterialApp(title: 'gradPvCircelanimDdmenu', home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> pictures = [
    "blueSky.jpg",
    "diamond.jpg",
    "diamond1.jpeg",
    "n7618.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.5;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topRight,
            end: FractionalOffset.bottomLeft,
            colors: [Colors.red, Colors.yellow],
          ),
        ),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: pictures.length,
          itemBuilder: (context, int i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 25),
              child: Material(
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAlias,
                elevation: 8,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: pictures[i],
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Detail(picture: pictures[i]),
                              ),
                            );
                          },
                          child: Image.asset(
                            "img/${pictures[i]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Detail extends StatefulWidget {
  final String picture;

  const Detail({super.key, required this.picture});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Color warna =Colors.grey;
  void _options(Pilihan pilihan){
    setState(() {
      warna=pilihan.warna;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('isi Gambar'),
        backgroundColor: Colors.blueAccent,
        actions: [
          PopupMenuButton <Pilihan>(
            onSelected: _options,
            itemBuilder: (BuildContext context){
              return listPilihan.map((Pilihan i){
                return PopupMenuItem<Pilihan>(
                  value: i,
                  child: Text(i.teks),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.blue, // Menyamakan warna dengan/mendekati AppBar
                  warna, // Bright Cyan
                  Colors.black.withValues(alpha : 0.5), // 204 setara dengan opacity ~0.8 (0.8 * 255)// Warm Gold / Yellow
                ],
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: widget.picture,
              child: ClipOval(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset("img/${widget.picture}", fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Pilihan{
  final String teks;
  final Color warna;
  const Pilihan({required this.teks, required this.warna});
}
 List<Pilihan> listPilihan =const <Pilihan>[
  Pilihan(teks:"strenght", warna:Colors.red),
  Pilihan(teks:"Agility", warna:Colors.green),
  Pilihan(teks:"Intelligence", warna:Colors.blue)
 ];
