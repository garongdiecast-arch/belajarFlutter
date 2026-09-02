  import 'package:flutter/material.dart';

  void main() {
    runApp(MaterialApp(
      title: 'input text, alert & snackbar', 
      home: Home()
      ));
  }

  class Home extends StatefulWidget {
    const Home({super.key});

    @override
    State<Home> createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    String texts = '';
    TextEditingController controller = TextEditingController();
    TextEditingController controllerAlert = TextEditingController();
    TextEditingController controllerSb = TextEditingController();
    void _alertdialog(String str) {
      if (str.isEmpty) return;
      AlertDialog alertDialog = AlertDialog(
        content: Text(str, style: TextStyle(fontFamily: 'poppins', fontSize: 50)),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) => alertDialog,
      );
    }


    void _snackbar(BuildContext context,String str) {
      if (str.isEmpty) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            str,
            style: TextStyle(fontSize: 20, fontFamily: 'poppins'),
          ),
          duration: Duration(seconds: 1),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'INPUT TEXT,ALERT DIALOG& SNACKBAR',
            style: TextStyle(
              fontFamily: 'POPPINS',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(7),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Tulis disini'),
                onSubmitted: (String str) {
                  setState(() {
                    texts = '$str \n $texts';
                    controller.clear();
                  });
                },
              ),
              Text(texts, style: TextStyle(fontSize: 20, fontFamily: 'poppins')),

              TextField(
                controller: controllerAlert,
                decoration: InputDecoration(hintText: 'INI ALERT'),
                onSubmitted: (String str) {
                  _alertdialog(str);
                  controllerAlert.clear();
                },
              ),
              TextField(
                controller: controllerSb,
                decoration: InputDecoration(hintText: 'INI SnackBar'),
                onSubmitted: (String str) {
                  _snackbar(context,str);
                  controllerSb.clear();
                },
              ),
            ],
          ),
        ),
      );
    }
  }
