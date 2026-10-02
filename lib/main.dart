import 'package:flutter/material.dart';
import 'profile_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Deklarasi data mahasiswa (tinggal diganti pas demo live)
  final String myName = "Mahasiswa Informatika";
  final String myNim = "20240801193"; // Contoh akhir ganjil/genap
  final String myHobby = "Ngoding sambil dengerin musik";

  @override
  Widget build(BuildContext context) {
    // 1. Ambil last digit buat nentuin warna background
    int lastDigit = int.parse(myNim.substring(myNim.length - 1));

    // Logic ganjil genap
    Color bgColor = (lastDigit % 2 != 0)
        ? Colors.tealAccent[100]! // Ganjil = Toska Muda
        : Colors.amber[100]!;     // Genap = Kuning Muda

    // 2. Hitung skor aktivitas (2 digit terakhir + 50)
    int lastTwoDigits = int.parse(myNim.substring(myNim.length - 2));
    int mySkor = lastTwoDigits + 50;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor, // Terapkan warna dinamis
      ),
      home: Scaffold(
        body: Center( // Posisikan kartu tepat di tengah
          child: ProfileCard(
            nama: myName,
            nim: myNim,
            hobi: myHobby,
            skorAktivitas: mySkor,
          ),
        ),
      ),
    );
  }
}