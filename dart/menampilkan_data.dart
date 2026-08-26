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
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){
  runApp(MaterialApp(
    title: "List View",
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {  
  List? dataJSON;
  @override
  void initState(){
    super.initState();
    ambildata();
  }

  Future<void> ambildata() async{
    http.Response hasil =await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers:{"Accept":"application/json"}
    );
    setState(() {
      dataJSON=jsonDecode(hasil.body);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('list data json'),
      ),
      body: ListView.builder(
        itemCount: dataJSON?.length??0,
        itemBuilder: (context, index){
          return Container(
            padding:EdgeInsets.all(12),
            child:Card(
              child: Container(
                padding:EdgeInsets.all(12),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(dataJSON![index]['title'],style: TextStyle(fontWeight: FontWeight.bold),),
                  //const SizedBox(width: 10,),
                  Text(dataJSON![index]['body']),

                ],

                ) 
              ),
            )
            
            
          );
        }

      ),

    );
  }
}
