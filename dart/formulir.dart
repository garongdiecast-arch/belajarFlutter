import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(title: "formulir", home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> agama = [
    'Islam',
    'Kristen Protestan',
    'Kristen Katolik',
    'Hindu',
    'Budha',
  ];
  String _agama = 'Islam';

  void ubahAgama(String? value) {
    setState(() {
      _agama = value!;
    });
  }

  String? _jk;

  final TextEditingController _nameController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("formulir"),
        leading: Icon(Icons.list),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: "Nama Lengkap",
              labelText: "Nama Lengkap",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 16),
          InputPassword(),
          SizedBox(height: 16),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Moto Hidup',
              labelText: 'Moto Hidup',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 16),
          RadioListTile<String>(
            value: 'Laki-Laki',
            title: Text('Laki-Laki'),
            groupValue: _jk,
            onChanged: (String? value) {
              setState(() {
                _jk = value;
              });
            },
          ),
          RadioListTile<String>(
            value: 'Perempuan',
            title: Text('Perempuan'),
            groupValue: _jk,
            onChanged: (String? value) {
              setState(() {
                _jk = value;
              });
            },
          ),
          SizedBox(height: 16),

          Row(
            children: [
              Text(
                "Agama",
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 14),
              DropdownButton<String>(
                value: _agama,
                items: agama.map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (String? value) {
                  ubahAgama(value);
                },
              ),
            ],
          ),

          SizedBox(height: 100),

          ElevatedButton(
            onPressed: () {
              // Mengambil dan menggabungkan semua isi penampung ke dalam variabel pesan
              String hasilRangkuman =
                  "Nama: ${_nameController.text}\n""Agama: ${_agama}\n""Jenis Kelamin: ${_jk}";

              // Tampilkan variabel 'hasilRangkuman' ke dalam fungsi Alert Dialog Anda!
              _alertdialog(hasilRangkuman);
            },
            child: Text('Submit'),
          ),

          // TextField(
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     hintText: "Password",
          //     labelText: "Password",
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(20)
          //     )
          //   ),
          // )
        ],
      ),
    );
  }
}

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscured,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Masukan password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        suffixIcon: IconButton(
          icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      ),
    );
  }
}
