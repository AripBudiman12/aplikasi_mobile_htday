import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HiasanKamar extends StatefulWidget {
  @override
  _HiasanKamarState createState() => _HiasanKamarState();
}

class _HiasanKamarState extends State<HiasanKamar> {
  List<Container> daftarbarang = new List();

  var barang = [
    {
      "nama": "Alat Kosmetik",
      "gambar": "3.kotak-kosmetik.png",
      "harga": "Rp.16,450",
      "keterangan":
          "Kotak ini berfungsi untuk membantu anda make-up,kosmetik,skin-care,"
              "hingga perhiasan. Sehingga lebih rapih dan tertata."
              "Dengan organizer yang rapih membuat anda dapat menaruh dan mengambil"
              " koleksi make-up anda dengan mudah dan cepat",
      "bintang": "12"
    },
    {
      "nama": "Jam LCD",
      "gambar": "4.jam-LCD.png",
      "harga": "Rp.77,528",
      "keterangan":
          "Fitur:\n-Design Moderen:\nJam ini memiliki design yang modern sesuai dengan perkembangan jaman\n"
              "-Fungsi Alarm:\njam ini juga dapat digunakan sebagai waker\n"
              "-Papan Memo:\nTulisan yang anda tulis pada memo board dapat bercahaya.",
      "bintang": "9"
    },
    {
      "nama": "Cat Air",
      "gambar": "5.cat-air.png",
      "harga": "Rp.50,000",
      "keterangan":
          "Humidifier ini berfungsi untuk menjaga kelembaban udara dan juga dapat "
              "digunakan sebagai aroma therapy dengan menaruh sedikit pewangi didalam airnya "
              "Design dari humidifier ini sangat unik dimana berbentuk seperti kucing yang imut.",
      "bintang": "10"
    },
    {
      "nama": "Lampu Tidur",
      "gambar": "6.lampu-tidur.png",
      "harga": "Rp.85,500",
      "keterangan":
          "Lampu tidur dengan design minimalis batu-batuan himalaya ini memiliki banyak fungsi."
              "Salah satunya adalah lampu tidur dimana dapat membuat efek cahaya seperti batu lava yang sedang menyala."
              "Fungsi lainnya yaitu sebagai pembersih udara karena batu-batuan ini dapat melepaskan ion-ion yang membersihkan udara.",
      "bintang": "7"
    },
    {
      "nama": "Tali Tirai",
      "gambar": "7.pengikat-tirai.png",
      "harga": "Rp.32,040",
      "keterangan":
          "Tali kepang ini berfungsi untuk mengikat gorden ketika anda ingin membuka gorden dan terlihat rapih."
              "Tali klip tirai ini memiliki bentuk model bandul yang dapat menempel dengan daya magnet membuat dekorasi jendela lebih indah.",
      "bintang": "11"
    },
    {
      "nama": "Jam Dinding",
      "gambar": "8.jam-dinding.png",
      "harga": "Rp.26,370",
      "keterangan":
          "Memiliki design yang unik, cocok digunakan untuk menghias ruangan,"
              "ditenagai hanya dengan baterai AA, dan terbuat dari bahan vinly dengan potongan 3D hollow model cangkir kopi",
      "bintang": "12"
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                          bintang: barangnya['bintang'],
                        ),
                      )),
                      child: new Image.asset(
                        "png/$gambar",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(3.0),
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
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: daftarbarang,
        ),
      ),
    );
  }
}

call(String s) {}

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
            height: 243.0,
            child: new Hero(
              tag: nama,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "png/$gambar",
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
          ),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  final String text;
  final String onTap;
  BagianNama({this.nama, this.harga, this.bintang, this.text, this.onTap});
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
      padding: new EdgeInsets.only(right: 10.0),
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
          )),
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
