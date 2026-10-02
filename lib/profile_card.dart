import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String hobi;
  final int skorAktivitas;

  const ProfileCard({
    Key? key,
    required this.nama,
    required this.nim,
    required this.hobi,
    required this.skorAktivitas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ekstrak digit untuk perhitungan dinamis (tugas praktikum)
    int lastDigit = int.parse(nim.substring(nim.length - 1));
    int secondLastDigit = int.parse(nim.substring(nim.length - 2, nim.length - 1));

    // Rumus sesuai tabel
    double cardWidth = 320.0 + (secondLastDigit * 5.0);
    double radiusValue = 12.0 + (lastDigit * 1.5);
    double logoSize = 60.0 + (lastDigit * 2.0);
    double spaceWidth = 15.0 + lastDigit.toDouble();

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radiusValue),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Hitam transparan
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Biar tinggi Container menyesuaikan isi
        children: [
          // Header Kartu
          Row(
            children: [
              // Logo Kiri
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueAccent, width: 2),
                ),
                padding: const EdgeInsets.all(8.0),
                child: FlutterLogo(size: logoSize),
              ),
              // Jarak Pemisah
              SizedBox(width: spaceWidth),
              // Judul & Nama di Kanan pake Expanded biar aman dari overflow
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kartu Praktikan",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Divider(thickness: 1.5),
          const SizedBox(height: 15),

          // Detail Identitas
          Column(
            children: [
              _buildRowDetail("NIM", nim),
              const SizedBox(height: 8),
              _buildRowDetail("Hobi", hobi),
              const SizedBox(height: 8),
              _buildRowDetail("Skor Aktivitas", skorAktivitas.toString()),
            ],
          ),
        ],
      ),
    );
  }

  // Method bantuan buat bikin baris identitas biar kodenya DRY
  Widget _buildRowDetail(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(title, style: const TextStyle(color: Colors.black87)),
        ),
        const Text(": "),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600), // Sesuai syarat tebal
          ),
        ),
      ],
    );
  }
}