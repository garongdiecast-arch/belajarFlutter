import 'package:flutter/material.dart';
import './detail.dart';

void main() {
  runApp(MaterialApp(title: 'SideBar', home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String picture1 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRESozexqSZ70tqpK8e8nlWwUyZzVdE31N41BNL3El4Qw&s=10';
  String picture2 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9y-u3DNIaym0OuUkjxBnP3s3QgqosOPApjrLK2LU2QA&s=10';

  String name1 = 'Azur';
  String name2 = 'blueSky';

  void changeUser() {
    setState(() {
      String backup = picture1;
      picture1 = picture2;
      picture2 = backup;

      String backupName = name1;
      name1 = name2;
      name2 = backupName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demo SideBar (Drawer)',
          style: TextStyle(fontFamily: 'poppins', fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(name1),
              accountEmail: Text('Azur@gmail.com'),
              currentAccountPicture: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Detail(
                        name: name1, picture: picture1),
                        ),
                  );
                },
                child: CircleAvatar(backgroundImage: NetworkImage(picture1)),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://chanelmuslim.com/wp-content/uploads/2021/09/azalea-5120368_1920.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              otherAccountsPictures: [
                InkWell(
                  onTap: () {
                    changeUser();
                  },
                  child: CircleAvatar(backgroundImage: NetworkImage(picture2)),
                ),
              ],
            ),
            ListTile(title: Text('settings'), trailing: Icon(Icons.settings)),
            ListTile(title: Text('Dompet'), trailing: Icon(Icons.wallet)),
          ],
        ),
      ),
      body: Container(
        child: Text('nay',
        style: TextStyle(fontFamily: 'poppins',fontSize: 7),),
      ),
    );
  }
}
