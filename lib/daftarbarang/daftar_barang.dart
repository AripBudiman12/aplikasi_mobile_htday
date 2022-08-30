import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import './hiasan_kamar.dart' as hiasan;
import './elektronik.dart' as elektro;

class DaftarBarang extends StatefulWidget {
  @override
  _daftarbarangState createState() => _daftarbarangState();
}

class _daftarbarangState extends State<DaftarBarang>
    with SingleTickerProviderStateMixin {
  static final List<String> imageList = [
    'png/halut1.png',
    'png/halut2.png',
  ];
  final _formKey = GlobalKey<FormState>();

  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Barang"),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.lightbulb),
              text: "Hiasan Kamar",
            ),
            new Tab(
              icon: new Icon(Icons.tv),
              text: "Elektronik",
            ),
          ],
        ),
      ),
      body: Center(
        child: new TabBarView(controller: controller, children: <Widget>[
          new hiasan.HiasanKamar(),
          new elektro.elektronik(),
        ]),
      ),
    );
  }
}



// CarouselSlider(
//           options: CarouselOptions(
//             enlargeCenterPage: true,
//             enableInfiniteScroll: false,
//             autoPlay: true,
//             aspectRatio: 2.0,
//           ),
//           items: imageList.map((e) {
//             return Container(
//               alignment: Alignment.centerLeft,
//               padding: EdgeInsets.only(top: 8.0),
//               height: 150,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: <Widget>[
//                     Image.asset(
//                       e,
//                       width: 10000,
//                       height: 2000,
//                       fit: BoxFit.cover,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
