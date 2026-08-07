import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    title: "card & parsing",
    home: HalSatu(),
  ));
}
class HalSatu extends StatelessWidget{
  const HalSatu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        
        title: Center(
          child: Text("Diamond Coffe",style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily:"popins",
          ),),//TextStyle//Text
        ),//Center
      ),//AppBar
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                MyCard(icon: Icons.home, text: "home", iconColor: Colors.brown.shade600,),
                MyCard(icon: Icons.coffee, text: "coffe", iconColor: Colors.brown.shade800,),
                MyCard(icon: Icons.cake, text: "cake", iconColor: Colors.amber.shade700,),
                
              ],
            )//Column
          )Container
        
        
      
    );//Scaffold
  }
}

class MyCard extends StatelessWidget{
  //MyCard({this.icon,this.texts});
  final IconData icon;
  final String text;
  final Color iconColor;

  const MyCard({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
    });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
            child: Column(
              children: [
                Icon(icon,color:iconColor,size: 50,),
                Text(text, style: TextStyle(fontSize: 20,fontFamily: "montserrat",fontWeight:FontWeight(600)) ),
          
              ],//Children
            )//Column
          )//Container
    ); //Scaffold
  }
}
