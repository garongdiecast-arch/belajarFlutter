import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HalloFriend()));
}

class HalloFriend extends StatelessWidget {
  const HalloFriend({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blueAccent,
              width: 200,
              height: 100,
                child: Center(
                  child: Text("hai diamond",
                    style: TextStyle(
                    color: Colors.white,
                    fontFamily: "serif",fontSize: 20,
                    )
                ),
                
              ),
            ),
            const SizedBox(height: 20),  
            //--container 2
            Container(
              color: Colors.redAccent,
              width: 100,
              height: 100,
                child: Icon(
                  Icons.favorite,
                  color: Colors.white12,
                  size: 50,
              ),//Icon


            ),//Container
          ],//Children
        ),//Column

      ),//Center
   
    );//Scaffold
  }
}        
          
  
