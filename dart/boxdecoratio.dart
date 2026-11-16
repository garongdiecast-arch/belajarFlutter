import 'package:flutter/material.dart';

void main() => runApp(const ScoreApp());

class ScoreApp extends StatelessWidget {
  const ScoreApp({super.key});

  // Data list sederhana: nama pemain dan skornya
  final List<String> players = const ["Andi", "Budi", "Citra", "Dedi"];
  final List<String> scores = const ["95", "85", "75", "60"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Skor Pemain'),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
          itemCount: players.length, // Menyesuaikan jumlah data (4)
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8), // Jarak antar kotak
              padding: const EdgeInsets.all(16), // Jarak dalam kotak
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menampilkan nomor urut (index + 1) dan nama pemain
                  Text(
                    "Peringkat ${index + 1}: ${players[index]}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Menampilkan skor berdasarkan index
                  Text(
                    "Skor: ${scores[index]}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
