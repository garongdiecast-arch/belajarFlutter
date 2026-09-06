import "package:flutter/material.dart";



void main(){
  runApp(MaterialApp(
    title:'grid dan hero',
    home:Home(),
  ));
}
class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> listOfSuperHero=[];

  var characters=[
    {'name':'Captain Amerika', 'picture':'captain.jpg'},
    {'name':'Hawk Eye', 'picture':'hawkEye.jpg'},
    {'name':'Iron Man', 'picture':'ironMan.jpg'},
    {'name':'Hulk', 'picture':'hulk.webp'},
    {'name':'Spider Man', 'picture':'spider.jpg'},
  ];

  void createList() async{
    for (var i = 0; i< characters.length;i++){
      final its =characters[i];
      final String picture = its ['picture']??'';
      listOfSuperHero.add(
        Container(
          padding: EdgeInsets.all(7),
          child: Card(
            child: Column(
              children: [
                Expanded(child: Image.asset('img/$picture',fit: BoxFit.cover,),),
                Padding(padding: EdgeInsets.all(10)),
                Text(its['name']??'',style: TextStyle(fontSize: 18),)
                

              ],
            ),
          )
        )
      );
    }
  }
  @override
  void initState() {
    
    createList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Hero',style: TextStyle(color: Colors.white70,fontFamily: 'poppins')),
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: listOfSuperHero,
        ),
    );
  }
}
