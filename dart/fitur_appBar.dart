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
          "Azur coffee",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),//TextStyle
          ),// Text
          
        ),// Center
        actions: [
          Icon(
            Icons.search,
          )//Icon
        ],
      ),//AppBar
    );// scaffold
  }
}
