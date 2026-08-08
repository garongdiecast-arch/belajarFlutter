import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HalSatu(),
    title: 'Navigasi',
    routes: <String,WidgetBuilder>{
      '/HalSatu':(context) => HalSatu(),
      '/HalDua':(context) => HalDua(),
    },
  ));
}

class HalSatu extends StatelessWidget{
  const HalSatu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Music'),
      ),
      body: Center(
        child: IconButton(
          onPressed:(){
            Navigator.pushNamed(context, '/HalDua');
        }, 
          icon: Icon(Icons.headset,color: Colors.brown,size: 50,) ,
        ),
      )
    );
  }
}
class HalDua extends StatelessWidget{
  const HalDua({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Speaker'),
      ),
      body: Center(
        child: IconButton(
          onPressed:null,//(){
          //   Navigator.pushNamed(context, '/HalSatu');
          // }, 
          icon: Icon(Icons.speaker,color: Colors.brown,size: 50,) ,
        ),
      )
    );
  }
}
