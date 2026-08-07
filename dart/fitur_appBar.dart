import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: HalamanSatu(),
  )
  );//t
}

class HalamanSatu extends StatelessWidget{
  const HalamanSatu({super.key} );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        leading: Icon(
          color: Colors.white60,
          Icons.home,
        ),// Icon
        title: Center(
          child: Text(
          "Diamond coffee",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily:"popins",
          ),//TextStyle
          ),// Text
          
        ),// Center
        actions: [
          Icon(
            Icons.search,
          )//Icon
        ],
      ),//AppBar
      body:Container(
        child:Column(
          children: [
            Icon(Icons.coffee,size: 50,color: Colors.brown.shade800),
            Icon(Icons.restaurant,size: 50,color: Colors.brown.shade800),
            Icon(Icons.cake,size: 50,color: Colors.brown.shade800),
            
          ],//Children
        ),//column
      ),//Container
    );// scaffold
  }
}
