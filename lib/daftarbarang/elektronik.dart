import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ht_day/daftarbarang/hiasan_kamar.dart';

class elektronik extends StatefulWidget {
  @override
  _HiasanKamarState createState() => _HiasanKamarState();
}

class _HiasanKamarState extends State<elektronik> {
  List<Container> daftarbarang = new List();

  var barang = [
    {
      "nama": "AC 2 PK",
      "gambar": "ac.jpg",
      "harga": "Rp.1.500,000",
      "keterangan": "Spesifikasi AC:\n- Type: AC Inverter\n- Warna: Putih\n"
          "- Daya Listrik(Waat): 360 (230-600) Watt\n- Dimensi: 86x29x25 cm\n"
          "Berat: 8 Kg\n- Garansi: 1 Tahun Sparepart, 10 Tahun Kompresor.",
      "bintang": "8"
    },
    {
      "nama": "Kipas Angin",
      "gambar": "kipas.jpg",
      "harga": "Rp.350,000",
      "keterangan":
          "Memiliki 3 kecepatan angin. Ruangan anda akan terasa lebih sejuk."
              "Membantu sirkulasi udara dengan motor dan kipas berukuran 16 yang berkualitas.",
      "bintang": "10"
    },
    {
      "nama": "Laptop",
      "gambar": "laptop.jpg",
      "harga": "Rp.4.500,000",
      "keterangan":
          "Barang baru dan bergaransi resmi!!!\nIntel Coleron Processor\nChroom OS\n"
              "11.6 diagonal,HD (1366x768), anti-glare,220 nits,45%NTCS\n"
              "4 GB LPDDRA4-3733 Mhz RAM (onboard)",
      "bintang": "12"
    },
    {
      "nama": "Mixer Audio",
      "gambar": "mixer.jpg",
      "harga": "Rp.1.000,000",
      "keterangan": "Garansi resmi 1 tahun!!!\nSpesifikasi:\n"
          "- 200 WATT\n- 4 Channel Mic\n- Support Bluethooth\n- Support USB,SD/MMC Card\n"
          "- Knob Master Music Volume\n- Knob Music Mic Volume\n- Knob Echo, Mid, Hight, Repeat, Delay.",
      "bintang": "6"
    },
    {
      "nama": "Speaker Active",
      "gambar": "salon.jpg",
      "harga": "Rp.400,000",
      "keterangan": "Speaker aktif yang memiliki daya fungsi yang besar."
          "Mempunyai fitur Gadget input yang berguna sebagai line input 3,5 mm anda bisa dengan mudah mengkoreksi media player.",
      "bintang": "11"
    },
    {
      "nama": "TV LED",
      "gambar": "tv.jpg",
      "harga": "Rp.2.000,000",
      "keterangan":
          "-Perfect Smart funtion with Google Assistant\n-Certificate Google Android TV\n"
              "-Perfecet picture quality with HDR technology\n-Perfect design with super narrow bazel",
      "bintang": "5"
    },
  ];

  _buatlist() async {
    for (var i = 0; i < barang.length; i++) {
      final barangnya = barang[i];
      final String gambar = barangnya["gambar"];
      final String harga = barangnya["harga"];
      final String keterangan = barangnya["keterangan"];
      final String bintang = barangnya["bintang"];

      daftarbarang.add(
        new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
            child: new Column(
              children: <Widget>[
                new Hero(
                  tag: barangnya['nama'],
                  child: new Material(
                    child: new InkWell(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Detail(
                            nama: barangnya['nama'],
                            gambar: gambar,
                            harga: barangnya['harga'],
                            keterangan: barangnya['keterangan'],
                            bintang: barangnya['bintang']),
                      )),
                      child: new Image.asset(
                        "elektronik/$gambar",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                ),
                new Text(
                  barangnya['nama'],
                  style: new TextStyle(fontSize: 20.0),
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
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarbarang,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar, this.harga, this.keterangan, this.bintang});
  final String nama;
  final String gambar;
  final String harga;
  final String keterangan;
  final String bintang;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(
              tag: nama,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "elektronik/$gambar",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          new BagianNama(
            nama: nama,
            harga: harga,
            bintang: bintang,
          ),
          new BagianIcon(),
          new BagianKeterangan(
            keterangan: keterangan,
          )
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama, this.harga, this.bintang});
  final String nama;
  final String harga;
  final String bintang;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$harga",
                  style: new TextStyle(fontSize: 17.0, color: Colors.green),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30,
                color: Colors.red,
              ),
              new Text(
                "$bintang",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () async {
                const url = 'tel:+62 895 4147 36529';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Iconteks(
                icon: Icons.call,
                teks: "Call",
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                const url = 'https://shopee.co.id/happytosday';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not lauch $url';
                }
              },
              child: Iconteks(
                icon: Icons.web_sharp,
                teks: "Web Store",
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                const url =
                    'https://www.google.com/maps/place/Rumah+pok+rum/@-6.1411735,106.7130968,17z/data=!3m1!4b1!4m5!3m4!1s0x2e69f907fcdc0739:0xee5aa789ecc7635f!8m2!3d-6.1411788!4d106.7152855';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not lauch $url';
                }
              },
              child: Iconteks(
                icon: Icons.navigation,
                teks: "Alamat",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  BagianKeterangan({this.keterangan});
  final String keterangan;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          children: <Widget>[
            new Text(
              "$keterangan",
              style: new TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
