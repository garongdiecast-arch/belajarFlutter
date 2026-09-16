import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(title: 'grid dan hero', home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> listOfSuperHero = [];

  var characters = [
    {
      'name': 'Captain Amerika',
      'picture': 'captain.jpg',
      'email': 'captainAmerika@gmail.com',
    },
    {
      'name': 'Hawk Eye',
      'picture': 'hawkEye.jpg',
      'email': 'hawkEye@gmail.com',
    },
    {
      'name': 'Iron Man',
      'picture': 'ironMan.jpg',
      'email': 'ironMan@gmail.com',
    },
    {'name': 'thor', 'picture': 'thor.jpg', 'email': 'thor@gmail.com'},
  ];

  void createList() async {
    for (var i = 0; i < characters.length; i++) {
      final its = characters[i];
      final String picture = its['picture'] ?? '';
      listOfSuperHero.add(
        Container(
          padding: EdgeInsets.zero,
          child: Card(
            clipBehavior:
                Clip.antiAlias, // Memastikan potongan rapi di sudut Card

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: its['name'] ?? '',
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => Detail(
                              picture: picture,
                              name: its['name'] ?? '',
                              email: its['email'] ?? '',
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            'img/$picture',
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            width: double.infinity,
                            height: 154,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // 1. & 2. Gunakan SizedBox dan ClipRRect
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    its['name'] ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
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
        title: Text(
          'Super Hero',
          style: TextStyle(color: Colors.white70, fontFamily: 'poppins'),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.count(crossAxisCount: 2, children: listOfSuperHero),
    );
  }
}

class Detail extends StatelessWidget {
  final String name;
  final String picture;
  final String email;
  const Detail({
    super.key,
    required this.name,
    required this.picture,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 350,
            child: Hero(
              tag: name,
              child: Material(
                child: InkWell(
                  child: SizedBox(
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'img/$picture',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        width: double.infinity,
                        //height: 1000,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          NameComponent(name: "$name", email: "$email"),
          SizedBox(height: 50,),
          BagianIcon(),
          Keterangan()
        ],
      ),
    );
  }
}

class NameComponent extends StatelessWidget {
  final String name;
  final String email;
  const NameComponent({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight(600),
                    color: Colors.blueAccent,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  email,
                  style: TextStyle(
                    fontFamily: 'poppins',
                    color: Colors.grey.shade600,
                  ),
                )
                ,
              ],
            ),
          ),
          //const SizedBox(width: 80),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 50),
              const SizedBox(width: 4),
              Text(
                '12', // Jumlah rating
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  const BagianIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconText(icon: Icons.call,text: 'Call',),
          IconText(icon: Icons.message,text: 'Message',),
          IconText(icon: Icons.photo,text: 'Photo',),
          
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconText ({super.key,required this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon,color: Colors.blue,size: 32,),
          SizedBox(height: 8,),
          Text(text,style: TextStyle(fontFamily: 'poppins',fontSize: 14,color: Colors.blue,fontWeight: FontWeight(600)),)
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  
  const Keterangan({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Card(
      
        child:Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software like Aldus PageMaker and Microsoft Word including versions of Lorem Ipsum."), 
      ) ,
    );
  }
}
