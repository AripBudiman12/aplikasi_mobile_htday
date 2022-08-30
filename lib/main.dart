import 'package:flutter/material.dart';
import 'package:ht_day/daftarbarang/daftar_barang.dart';
import 'package:ht_day/helpers/user_info.dart';
import 'package:ht_day/ui/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTDAY',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
