//menampilkan data scara looping dari array
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "List View",
    home: Home(data: List<String>.generate(300,(i)=>"ini data ke $i"),),
  ));
}

class Home extends StatelessWidget {
  final List<String> data;
  const Home({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('List View'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: Icon(Icons.widgets),
              title: Text(data[index]),
            );
          },
        ),

      ),
    );
  }
}

//Menampilkan data secara berulang dari JSON data
